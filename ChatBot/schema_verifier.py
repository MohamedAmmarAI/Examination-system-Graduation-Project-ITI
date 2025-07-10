
from langchain.prompts import ChatPromptTemplate
from langchain_google_genai import ChatGoogleGenerativeAI

class SchemaVerifier:
    def __init__(self, api_key: str):
        self.llm = ChatGoogleGenerativeAI(model="gemini-1.5-flash-latest", google_api_key=api_key)

    def verify_schema_relevance(self, question: str, schema_info: str):
        template = """
        You are a highly intelligent assistant.

        Given a schema for an Examination System Data Warehouse, determine if the user's question is related to the available data.

        The schema includes tables like DimStudent, DimExam, DimCourse, DimInstructor, DimQuestion, DimBranch, FactStudent, etc.

        The user might ask questions in English or Arabic. You should classify the question as:
        - "Related" → if it refers to students, exams, questions, scores, courses, instructors, dates, branches, or performance.
        - "Not related" → if it’s a personal, joke, or off-topic question.

        Question: {question}

        <SCHEMA>
        {schema_info}
        </SCHEMA>

        Respond with one word only: Related or Not related.
        """
        prompt = ChatPromptTemplate.from_template(template)
        prompt_text = prompt.format(question=question, schema_info=schema_info)
        response = self.llm.invoke(prompt_text)
        return response.content.strip().lower()
