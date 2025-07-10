# 🎓 Online Examination System Empowered by AI Chatbot

A comprehensive online examination platform integrating OLTP, Data Warehousing, ETL pipelines, Power BI dashboards, SSRS reports, and an AI-powered chatbot for natural language business intelligence.

## 📌 Project Overview

This system is designed to support academic and administrative operations for educational institutions. It manages student records, exams, certification readiness, and HR analytics, providing data-driven insights via reports, dashboards, and conversational AI.

## 🚀 Features

- **Centralized SQL Server database** with referential integrity
- **Data warehouse** with dimensional modeling and clean surrogate keys
- **ETL pipeline using SSIS** to populate the data warehouse and HR Data Mart
- **SSRS reports** built on stored procedures and deployed to Power BI
- **Power BI dashboards** for Students, Instructors, Admins, and HR
- **BI Chatbot** using Streamlit and NLP to interact with the data warehouse in natural language
- **Realistic sample data** for full-stack testing

## 🧠 Objectives

1. Design and implement a scalable, normalized OLTP system
2. Build a star-schema data warehouse for academic and HR analytics
3. Develop multi-dimensional Power BI dashboards
4. Provide natural language access to data via a chatbot
5. Support performance improvement and strategic decision-making

## 🗂️ Project Modules

| Module              | Description                                                                 |
|---------------------|-----------------------------------------------------------------------------|
| ERD Design          | Logical data model capturing student lifecycle, exam performance, and HR data |
| Database Population | Mock data generation for realistic testing                                  |
| Stored Procedures   | CRUD + exam operations + admin tools                                        |
| Data Warehouse      | Clean star schema ready for slicing and dicing                              |
| HR Data Mart        | Focused on recruitment KPIs and skill readiness                             |
| SSRS Reporting      | 6+ parameterized reports deployed in Power BI                               |
| Dashboards          | 20+ interactive dashboards using optimized DAX                              |
| AI Chatbot          | Query data warehouse using natural language in Streamlit                    |

## 📊 Key Dashboards

- Student Dashboard
- Instructor Dashboard
- Admin Dashboard
- HR Recruitment Dashboard

## 🤖 Chatbot Capabilities

- Ask questions like “How many students passed Python exams?”
- Get instant summaries on certifications, readiness, and scores
- No SQL or BI expertise needed

## 👥 Team Members

| Name                     | Role               | GitHub                                | LinkedIn                                         |
|--------------------------|--------------------|----------------------------------------|--------------------------------------------------|
| Nada Hosny               | Marketing Analyst  | —                                      | [LinkedIn](https://www.linkedin.com/in/nada-hosny/) |
| Mohamed Ammar           | Data Scientist     | [GitHub](https://github.com/MohamedAmmarAI) | [LinkedIn](http://www.linkedin.com/in/mohamed-ammar1) |
| Mahmoud Elbaal          | Data Analyst       | [GitHub](https://github.com/MahmoudElbaal) | [LinkedIn](https://www.linkedin.com/in/mahmoudelbaal) |
| Sabry Yahia             | Data Analyst       | [GitHub](https://github.com/SabryYahia) | [LinkedIn](https://www.linkedin.com/in/sabry-yahia-0b76102b3/) |

## 🛠️ Tech Stack

- SQL Server
- SSIS, SSRS
- Power BI
- Streamlit
- Python
- DAX
- GitHub

## 📦 How to Run

1. Clone the repository
2. Set up SQL Server and restore database scripts
3. Run ETL using SSIS packages
4. Open Power BI files for dashboards
5. Launch chatbot via Streamlit app

## 📈 Future Improvements

- Add multilingual support to the chatbot
- Integrate real-time exam monitoring
- Implement authentication and role-based access

---

> This project was developed as part of the graduation requirement for the ITI Data Analysis program.
