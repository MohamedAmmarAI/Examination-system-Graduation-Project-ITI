
# chat_app.py
import streamlit as st
from db_connector import DatabaseConnector
from question_classifier import QuestionClassifier
from schema_verifier import SchemaVerifier
from non_serious_assistant import NonSeriousAssistant
from sql_assistant import SQLAssistant
from schema_describer import SchemaDescriber
from langchain.schema import AIMessage, HumanMessage

class ChatApp:
    def __init__(self):
        self.gemini_api_key_1 ="Write your GEMINI API KEY here"
        self.gemini_api_key_2 ="Write your GEMINI API KEY here"
        self.gemini_api_key_3 ="Write your GEMINI API KEY here"
        self.gemini_api_key_4 ="Write your GEMINI API KEY here"

        self.db_connector = DatabaseConnector()
        self.describer = SchemaDescriber(self.gemini_api_key_2)
        self.sql_assistant = SQLAssistant(api_key_1=self.gemini_api_key_4,api_key_2=self.gemini_api_key_1,
        describer_key=self.gemini_api_key_2
)

        self.schema_verifier = SchemaVerifier(self.gemini_api_key_3)
        self.non_serious_assistant = NonSeriousAssistant(self.gemini_api_key_2)
        self.question_classifier = QuestionClassifier(self.gemini_api_key_1)
        self.init_session_state()

    def init_session_state(self):
        if "chat_history" not in st.session_state:
            st.session_state.chat_history = [
                AIMessage(content="Hello! I'm your BI Assistant. Ask me anything about your data warehouse."),
            ]
        if "db" not in st.session_state:
            st.session_state.db = None

    def sidebar(self):
        st.sidebar.subheader("Database Connection")
        st.sidebar.text_input("Host", value="localhost", key="Host")
        st.sidebar.text_input("Port", value="1433", key="Port")
        st.sidebar.text_input("User", value="sa", key="User")
        st.sidebar.text_input("Password", type="password", value="your_password", key="Password")
        st.sidebar.text_input("Database", value="ExaminationSystem_DWH_New", key="Database")

        if st.sidebar.button("Connect"):
            with st.spinner("Connecting to SQL Server..."):
                try:
                    st.session_state.db = self.db_connector.connect(
                        st.session_state["User"],
                        st.session_state["Password"],
                        st.session_state["Host"],
                        st.session_state["Port"],
                        st.session_state["Database"]
                    )
                    st.success("Connected successfully!")
                except Exception as e:
                    st.error(f"Connection failed: {e}")

    def display_chat_history(self):
        for message in st.session_state.chat_history:
            with st.chat_message("AI" if isinstance(message, AIMessage) else "Human"):
                st.markdown(message.content)

    def handle_user_query(self):
        user_query = st.chat_input("Type your question here...")
        if user_query:
            st.session_state.chat_history.append(HumanMessage(user_query))
            with st.chat_message("Human"):
                st.markdown(user_query)

            with st.chat_message("AI"):
                if st.session_state.db:
                    classification = self.question_classifier.classify_question(user_query)
                    if classification == "serious":
                        schema_info = st.session_state.db.get_table_info()
                        descriptions = self.describer.describe_and_save_all(schema_info)
                        relevance = self.schema_verifier.verify_schema_relevance(user_query, descriptions)
                        if relevance == "related":
                            response = self.sql_assistant.generate_response(user_query, st.session_state.db, st.session_state.chat_history[-2:])
                        else:
                            response = "سؤالك لا يبدو متعلقًا بالبيانات. اسأل عن الامتحانات أو الطلاب أو الدرجات."
                    else:
                        response = self.non_serious_assistant.get_non_serious_response(user_query)
                    st.markdown(response)
                    st.session_state.chat_history.append(AIMessage(content=response))

    def run(self):
        st.set_page_config(page_title="BI Assistant", page_icon=":bar_chart:")
        st.title("Examination System - BI Assistant")
        self.sidebar()
        self.display_chat_history()
        self.handle_user_query()


