
from langchain_community.utilities import SQLDatabase

class DatabaseConnector:
    def __init__(self):
        self.db = None

    def connect(self, user: str, password: str, host: str, port: str, database: str):
        db_uri = f"mssql+pyodbc://{user}:{password}@{host}:{port}/{database}?driver=ODBC+Driver+17+for+SQL+Server"
        self.db = SQLDatabase.from_uri(db_uri)
        return self.db