
from langchain.prompts import ChatPromptTemplate
from langchain_google_genai import ChatGoogleGenerativeAI

class QuestionClassifier:
    def __init__(self, gemini_api_key: str):
        self.gemini_api_key = gemini_api_key
        self.llm = ChatGoogleGenerativeAI(model="gemini-1.5-flash-latest", google_api_key=self.gemini_api_key)

    def classify_question(self, question: str):
        template = """
        Classify the following question as either "Serious" or "Non-Serious".
        Serious questions are about exams, students, courses, instructors, performance, etc.
        Non-Serious questions are jokes, small talk, or unrelated.

        Question: {question}

        Reply with only one word: Serious or Non-Serious.
        """
        prompt = ChatPromptTemplate.from_template(template)
        prompt_text = prompt.format(question=question)
        response = self.llm.invoke(prompt_text)
        return response.content.strip().lower()

# non_serious_assistant.py
from langchain.prompts import ChatPromptTemplate
from langchain_google_genai import ChatGoogleGenerativeAI

class NonSeriousAssistant:
    def __init__(self, gemini_api_key: str):
        self.gemini_api_key = gemini_api_key
        self.llm = ChatGoogleGenerativeAI(model="gemini-1.5-flash-latest", google_api_key=self.gemini_api_key)

    def get_non_serious_response(self, question: str):
        template = """
        You are a fun, polite assistant. Respond playfully to non-serious questions in the same language.

        Examples:
        - Hello → Hello! How can I help you with the data today?
        - Tell me a joke → Why did the SQL query go broke? It couldn't join any tables!

        Question: {question}
        """
        prompt = ChatPromptTemplate.from_template(template)
        prompt_text = prompt.format(question=question)
        response = self.llm.invoke(prompt_text)
        return response.content.strip()
