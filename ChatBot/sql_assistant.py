
from langchain.prompts import ChatPromptTemplate
from langchain_google_genai import ChatGoogleGenerativeAI
from langchain_core.runnables import RunnablePassthrough
from langchain_core.output_parsers import StrOutputParser
from langchain_community.utilities import SQLDatabase
from schema_describer import SchemaDescriber
import streamlit as st
import time

class SQLAssistant:
    def __init__(self, api_key_1: str, api_key_2: str, describer_key: str):
        self.api_key_1 = api_key_1
        self.api_key_2 = api_key_2
        self.describer = SchemaDescriber(api_key=describer_key)

    def get_sql_chain(self, db: SQLDatabase):
        template = """
        You are a data analyst working with an examination system data warehouse.
        Tables follow naming conventions like DimStudent, DimCourse, DimExam, FactStudent.
        Based on the schema and chat history, write an SQL query to answer the user's question.

        <SCHEMA>{schema}</SCHEMA>
        Conversation History: {chat_history}

        Write ONLY the valid SQL Server query.
        Return pure SQL only — no explanations, no markdown, no comments, no ```sql block.
        """
        prompt = ChatPromptTemplate.from_template(template)
        llm = ChatGoogleGenerativeAI(model="gemini-1.5-flash-latest", google_api_key=self.api_key_1)

        def get_schema(_):
            schema_info = db.get_table_info()
            return self.describer.describe_and_save_all(schema_info)

        return (
            RunnablePassthrough.assign(schema=get_schema)
            | prompt
            | llm
            | StrOutputParser()
        )

    def generate_response(self, user_query: str, db: SQLDatabase, chat_history: list):
        sql_chain = self.get_sql_chain(db)

        response_template = """
        You are a BI Assistant.
        Based on the schema, SQL query, and its result, write a natural explanation in the same language as the user.

        <SCHEMA>{schema}</SCHEMA>
        Conversation History: {chat_history}
        SQL Query: <SQL>{query}</SQL>
        User Question: {question}
        SQL Response: {response}
        """
        prompt = ChatPromptTemplate.from_template(response_template)
        llm = ChatGoogleGenerativeAI(model="gemini-1.5-flash-latest", google_api_key=self.api_key_2)

        def get_schema(_):
            schema_info = db.get_table_info()
            return self.describer.describe_and_save_all(schema_info)

        chain = (
            RunnablePassthrough.assign(query=sql_chain).assign(
                schema=lambda _: get_schema,
                response=lambda vars: db.run(vars["query"]),
            )
            | prompt
            | llm
            | StrOutputParser()
        )

        try:
            time.sleep(2)
            result = chain.invoke({
                "question": user_query,
                "chat_history": chat_history,
            })
            print("🧾 Generated SQL:", result)
            return result
        except Exception as e:
            error_message = f"⚠️ خطأ أثناء تشغيل SQL:\n{e}"
            print("SQL ERROR:", e)
            st.error(error_message)
            return error_message



