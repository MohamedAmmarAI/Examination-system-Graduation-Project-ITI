

from langchain.prompts import ChatPromptTemplate
from langchain_google_genai import ChatGoogleGenerativeAI
import os

class SchemaDescriber:
    def __init__(self, api_key, output_file="schema_descriptions.txt"):
        self.llm = ChatGoogleGenerativeAI(model="gemini-1.5-flash-latest", google_api_key=api_key)
        self.output_file = output_file

    def generate_description(self, schema_info):
        template = """
        You are given the schema of an Examination System Data Warehouse.
        For each table, provide a brief description including:
        - Purpose of the table
        - Column names with data types
        - Mention clearly if a column like 'Score' exists and explain that it's the student's grade.
        - Primary and foreign keys
        - One sample row for illustration

        Make sure to include detailed descriptions for tables like FactStudent which contains the Score column.

        Schema:
        {schema_info}
        """
        prompt = ChatPromptTemplate.from_template(template)
        prompt_text = prompt.format(schema_info=schema_info)
        response = self.llm.invoke(prompt_text)
        return response.content.strip()

    def save_descriptions(self, descriptions):
        with open(self.output_file, "w", encoding="utf-8") as file:
            file.write(descriptions)
            file.write("\n" + "-" * 80 + "\n")

    def describe_and_save_all(self, database_schema):
        # Always regenerate schema description on each run
        description = self.generate_description(database_schema)
        self.save_descriptions(description)
        return description

