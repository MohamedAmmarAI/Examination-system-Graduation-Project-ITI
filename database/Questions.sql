delete from Question

DBCC CHECKIDENT ('Question', RESEED, 0);

update question set ExamID = 1 where QuestionID between 1 And 10

INSERT INTO Question (Type, QuestionText, CorrectAnswer, Grade, ExamID)
VALUES
-- SQL --
('MCQ', 'Which SQL command is used to retrieve data from a database?', 'SELECT', 1, NULL),
('MCQ', 'Which SQL function returns the current date and time?', 'GETDATE()', 1, NULL),
('MCQ', 'Which SQL operator is used for logical conjunction?', 'AND', 1, NULL),
('MCQ', 'Which SQL command is used to create a new table?', 'CREATE TABLE', 1, NULL),
('MCQ', 'Which function returns the number of rows in a query result?', 'COUNT', 1, NULL),
('MCQ', 'What is used to combine rows from two or more tables in SQL?', 'JOIN', 1, NULL),
( 'MCQ', 'Which keyword is used to define a temporary table in SQL Server?', 'CREATE TABLE #temp', 1, NULL),
( 'MCQ', 'Which clause is used to group rows that have the same values?', 'GROUP BY', 1, NULL),
( 'MCQ', 'Which SQL keyword is used to combine the results of two queries?', 'UNION', 1, NULL),
( 'MCQ', 'Which clause is used to filter results in SQL?', 'WHERE', 1, NULL),
( 'MCQ', 'What does the ORDER BY clause do?', 'Sorts results based on specified columns', 1, NULL),
( 'MCQ', 'What is the role of a FOREIGN KEY?', 'Links records between tables', 1, NULL),
( 'MCQ', 'Which SQL statement is used to update data in a table?', 'UPDATE', 1, NULL),
( 'MCQ', 'Which function returns the maximum value in a column?', 'MAX', 1, NULL),
( 'MCQ', 'Which normal form removes partial dependency?', 'Second Normal Form (2NF)', 1, NULL),
( 'MCQ', 'What SQL command is used to delete records from a table?', 'DELETE', 1, NULL),
( 'MCQ', 'Which clause is used to join two tables in a query?', 'JOIN', 1, NULL),
( 'MCQ', 'What is a composite key in a relational database?', 'A key made of two or more columns', 1, NULL),
( 'MCQ', 'Which SQL command is used to change existing data?', 'UPDATE', 1, NULL),
( 'MCQ', 'What does a PRIMARY KEY do in a table?', 'Uniquely identifies each record', 1, NULL),
( 'MCQ', 'Which SQL statement is used to insert new data into a table?', 'INSERT', 1, NULL),
( 'MCQ', 'Which aggregate function calculates the sum of a numeric column?', 'SUM', 1, NULL),
( 'MCQ', 'Which function returns the minimum value in a column?', 'MIN', 1, NULL),
( 'MCQ', 'Which clause is used to filter aggregated records in SQL?', 'HAVING', 1, NULL),
( 'MCQ', 'Which SQL command is used to remove a table and all its data?', 'DROP TABLE', 1, NULL),
( 'MCQ', 'Which operator is used for pattern matching in SQL?', 'LIKE', 1, NULL),
( 'MCQ', 'What is the purpose of a FOREIGN KEY in SQL?', 'Establishes relationships between tables', 1, NULL),
( 'MCQ', 'How do you add a new column to an existing table?', 'ALTER TABLE ADD COLUMN', 1, NULL),
( 'MCQ', 'Which join returns all rows from the left table and matching rows from the right table?', 'LEFT JOIN', 1, NULL),
( 'MCQ', 'What does the BETWEEN operator do in SQL?', 'Filters results within a specified range', 1, NULL),
( 'MCQ', 'What does the ALTER TABLE command do in SQL?', 'Modifies an existing table structure', 1, NULL),
( 'MCQ', 'Which SQL command is used to remove a table in SQL?', 'DROP TABLE', 1, NULL),
( 'MCQ', 'Which keyword is used to eliminate duplicate rows in a query?', 'DISTINCT', 1, NULL),
( 'MCQ', 'What is the purpose of the TOP clause in SQL Server?', 'Limits the number of rows returned', 1, NULL),
( 'MCQ', 'What does the acronym SQL stand for?', 'Structured Query Language', 1, NULL),
('TF', 'A primary key can contain NULL values.', 'False', 1, NULL),
('TF', 'SQL stands for Structured Question Language.', 'False', 1, NULL),
('TF', 'Each table must have a primary key.', 'True', 1, NULL),
( 'TF', 'An index improves retrieval.', 'True', 1, NULL),
( 'TF', 'Normalization reduces redundancy.', 'True', 1, NULL),
( 'TF', 'A foreign key enforces referential integrity.', 'True', 1, NULL),
( 'TF', 'A view stores data permanently.', 'False', 1, NULL),
( 'TF', 'SELECT is used to insert data.', 'False', 1, NULL),
( 'TF', 'A table can have two primary keys.', 'False', 1, NULL),
( 'TF', 'UPDATE modifies records.', 'True', 1, NULL),



-- HTML & CSS
('MCQ', 'What does HTML stand for?', 'HyperText Markup Language', 1, NULL),
('MCQ', 'Which tag is used to create a hyperlink in HTML?', '<a>', 1, NULL),
('MCQ', 'Which HTML tag is used to display an image?', '<img>', 1, NULL),
('MCQ', 'What attribute specifies the URL of an image in the <img> tag?', 'src', 1, NULL),
('MCQ', 'What is the correct HTML element for inserting a line break?', '<br>', 1, NULL),
('MCQ', 'Which property is used in CSS to change the text color?', 'color', 1, NULL),
('MCQ', 'How do you apply a CSS style to a specific ID?', '#id', 1, NULL),
('MCQ', 'Which CSS property controls the size of text?', 'font-size', 1, NULL),
('MCQ', 'How do you include an external CSS file in HTML?', '<link rel="stylesheet" href="style.css">', 1, NULL),
('MCQ', 'Which CSS property is used to set the background color?', 'background-color', 1, NULL),
('TF', 'HTML is used to style web pages.', 'False', 1, NULL),
('TF', 'The <head> tag in HTML contains meta information.', 'True', 1, NULL),
('TF', 'CSS stands for Cascading Style Sheets.', 'True', 1, NULL),
('TF', 'You can use multiple CSS classes on a single HTML element.', 'True', 1, NULL),
('TF', 'The <div> tag is an inline element by default.', 'False', 1, NULL),
('MCQ', 'Which tag is used to create an unordered list in HTML?', '<ul>', 1, NULL),
('MCQ', 'Which CSS unit is relative to the root element’s font size?', 'rem', 1, NULL),
('MCQ', 'Which tag is used to define a table row?', '<tr>', 1, NULL),
('MCQ', 'Which CSS property changes the spacing between letters?', 'letter-spacing', 1, NULL),
('MCQ', 'How do you center a block element horizontally in CSS?', 'margin: 0 auto;', 1, NULL),

-- JS --
('MCQ', 'What is the correct syntax for referring to an external script called "app.js"?', '<script src="app.js">', 1, NULL),
('MCQ', 'Which keyword is used to declare a variable in JavaScript?', 'let', 1, NULL),
('MCQ', 'Which method converts JSON data into a JavaScript object?', 'JSON.parse()', 1, NULL),
('MCQ', 'Which operator is used to compare both value and type?', '===', 1, NULL),
('MCQ', 'Which function is used to delay code execution in JavaScript?', 'setTimeout()', 1, NULL),
('MCQ', 'How do you write a comment in JavaScript?', '// comment', 1, NULL),
('MCQ', 'Which of the following is a JavaScript data type?', 'Boolean', 1, NULL),
('MCQ', 'How do you define a function in JavaScript?', 'function myFunction() { }', 1, NULL),
('MCQ', 'Which method adds an element to the end of an array?', 'push()', 1, NULL),
('MCQ', 'What will `typeof null` return?', 'object', 1, NULL),
('MCQ', 'Which loop is guaranteed to execute at least once?', 'do...while', 1, NULL),
('MCQ', 'How do you create an object in JavaScript?', 'let obj = { }', 1, NULL),
('MCQ', 'What does DOM stand for?', 'Document Object Model', 1, NULL),
('MCQ', 'Which method is used to select an element by ID?', 'document.getElementById()', 1, NULL),
('MCQ', 'What does `NaN` stand for in JavaScript?', 'Not a Number', 1, NULL),
('TF', 'JavaScript can be used on both the client and server side.', 'True', 1, NULL),
('TF', 'Variables declared with let are hoisted to the top of the block.', 'False', 1, NULL),
('TF', 'Arrow functions do not have their own “this” context.', 'True', 1, NULL),
('TF', 'JavaScript is the same as Java.', 'False', 1, NULL),
('TF', '`const` variables can be reassigned new values.', 'False', 1, NULL),


-- React -- 
('MCQ', 'What is the primary purpose of React?', 'Building user interfaces', 10, NULL),
('TF', 'React was developed by Google.', 'False', 10, NULL),
('MCQ', 'Which method is used to create a component in React?', 'function MyComponent() {}', 10, NULL),
('TF', 'JSX is optional in React development.', 'True', 10, NULL),
('MCQ', 'What is the correct syntax to create a React element?', 'React.createElement()', 10, NULL),
('TF', 'React updates the entire page on every change.', 'False', 10, NULL),
('MCQ', 'Which hook is used to manage state in a functional component?', 'useState', 10, NULL),
('TF', 'useEffect is used to perform side effects in React.', 'True', 10, NULL),
('MCQ', 'What is the virtual DOM in React?', 'An in-memory representation of the real DOM', 10, NULL),
('TF', 'Props in React can be changed inside the child component.', 'False', 10, NULL),
('MCQ', 'Which command is used to create a new React application using Create React App?', 'npx create-react-app my-app', 10, NULL),
('TF', 'React components must start with an uppercase letter.', 'True', 10, NULL),
('MCQ', 'Which of the following best describes props in React?', 'They are inputs to a component.', 10, NULL),
('TF', 'State is shared between React components by default.', 'False', 10, NULL),
('MCQ', 'What is the purpose of keys in React lists?', 'To help React identify which items have changed', 10, NULL),

-- Node.js --
('MCQ', 'What is Node.js primarily used for?', 'Building scalable network applications', 10, NULL),
('TF', 'Node.js is single-threaded.', 'True', 10, NULL),
('MCQ', 'Which module is used for file system operations in Node.js?', 'fs', 10, NULL),
('TF', 'npm stands for Node Package Manager.', 'True', 10, NULL),
('MCQ', 'How do you import a module in Node.js?', 'require()', 10, NULL),
('TF', 'Node.js natively supports ES6 modules without flags.', 'False', 10, NULL),
('MCQ', 'Which HTTP method is commonly used to retrieve data?', 'GET', 10, NULL),
('TF', 'Express.js is a web framework for Python.', 'False', 10, NULL),
('MCQ', 'What does callback hell refer to?', 'Nested callback functions', 10, NULL),
('TF', 'Promises help manage asynchronous code in Node.js.', 'True', 10, NULL),
('MCQ', 'Which command initializes a new npm project?', 'npm init', 10, NULL),
('TF', 'process.env is used to access environment variables.', 'True', 10, NULL),
('MCQ', 'Which package is commonly used for routing in Node.js?', 'Express', 10, NULL),
('TF', 'Node.js is suitable for CPU-intensive tasks.', 'False', 10, NULL),
('MCQ', 'Which method is used to send a JSON response in Express?', 'res.json()', 10, NULL),





-- Excel for Analysis
('MCQ', 'Which function is used to calculate the average in Excel?', 'AVERAGE', 10, NULL),
('TF', 'Excel can be used to connect to external databases.', 'True', 10, NULL),
('MCQ', 'What does the VLOOKUP function do?', 'Searches for a value in the first column and returns a value in the same row from another column', 10, NULL),
('TF', 'Conditional formatting can be applied based on formulas.', 'True', 10, NULL),
('MCQ', 'Which symbol is used to make a cell reference absolute?', '$', 10, NULL),
('TF', 'Excel does not support pivot tables.', 'False', 10, NULL),
('MCQ', 'Which tab in Excel contains the “Remove Duplicates” feature?', 'Data', 10, NULL),
('TF', 'The IF function can return only numeric values.', 'False', 10, NULL),
('MCQ', 'What is the purpose of a pivot table?', 'To summarize and analyze data', 10, NULL),
('TF', 'Excel charts update automatically when source data changes.', 'True', 10, NULL),
('MCQ', 'Which Excel function returns the number of cells that meet a condition?', 'COUNTIF', 10, NULL),
('TF', 'Excel’s Flash Fill can detect patterns and fill in values.', 'True', 10, NULL),
('MCQ', 'What keyboard shortcut opens the Format Cells dialog box?', 'Ctrl + 1', 10, NULL),
('TF', 'Excel macros are written in Python.', 'False', 10, NULL),
('MCQ', 'Which file format preserves all Excel features including macros?', '.xlsm', 10, NULL),

-- Power BI
('MCQ', 'What is the main use of Power BI?', 'Business intelligence and data visualization', 10, NULL),
('TF', 'Power BI can import data from Excel, SQL Server, and web sources.', 'True', 10, NULL),
('MCQ', 'What language is used for calculated columns in Power BI?', 'DAX', 10, NULL),
('TF', 'Power BI dashboards are interactive.', 'True', 10, NULL),
('MCQ', 'What does the Power Query Editor allow you to do?', 'Transform and clean data before loading', 10, NULL),
('TF', 'Power BI cannot handle real-time data.', 'False', 10, NULL),
('MCQ', 'What is the visual used to show trends over time?', 'Line Chart', 10, NULL),
('TF', 'Power BI supports natural language queries.', 'True', 10, NULL),
('MCQ', 'What pane is used to create and manage relationships?', 'Model', 10, NULL),
('TF', 'Measures are calculated row by row.', 'False', 10, NULL),
('MCQ', 'What is the default storage mode in Power BI Desktop?', 'Import', 10, NULL),
('TF', 'Reports and dashboards are the same in Power BI.', 'False', 10, NULL),
('MCQ', 'Which DAX function returns the total of a column?', 'SUM', 10, NULL),
('TF', 'You cannot publish Power BI reports to the web.', 'False', 10, NULL),
('MCQ', 'What is used in Power BI to group related visuals?', 'Bookmark', 10, NULL),

-- Python for Data Analysis
('MCQ', 'Which library is commonly used for data manipulation in Python?', 'pandas', 10, NULL),
('TF', 'The read_csv() function is used to import Excel files.', 'False', 10, NULL),
('MCQ', 'What is the output of df.shape in pandas?', 'Tuple representing number of rows and columns', 10, NULL),
('TF', 'NumPy arrays are more efficient than Python lists.', 'True', 10, NULL),
('MCQ', 'What method is used to view the first few rows of a DataFrame?', 'head()', 10, NULL),
('TF', 'Python is case-sensitive.', 'True', 10, NULL),
('MCQ', 'Which function drops missing values from a DataFrame?', 'dropna()', 10, NULL),
('TF', 'The groupby() method is used to merge datasets.', 'False', 10, NULL),
('MCQ', 'Which function is used to merge two DataFrames in pandas?', 'merge()', 10, NULL),
('TF', 'df.info() gives a summary of the DataFrame.', 'True', 10, NULL),
('MCQ', 'Which of the following is used to handle numerical arrays?', 'NumPy', 10, NULL),
('TF', 'The pandas fillna() function replaces NaN values.', 'True', 10, NULL),
('MCQ', 'What does axis=1 typically refer to?', 'Columns', 10, NULL),
('TF', 'Pandas Series is a one-dimensional labeled array.', 'True', 10, NULL),
('MCQ', 'Which method gives basic statistics about data in a DataFrame?', 'describe()', 10, NULL),

-- Data Visualization
('MCQ', 'Which library is used for plotting in Python?', 'matplotlib', 10, NULL),
('TF', 'Data visualization is only useful for presentations.', 'False', 10, NULL),
('MCQ', 'What is the best chart to show proportions?', 'Pie Chart', 10, NULL),
('TF', 'Line charts are ideal for categorical comparisons.', 'False', 10, NULL),
('MCQ', 'Which tool is widely used for interactive dashboards?', 'Tableau', 10, NULL),
('TF', 'A scatter plot shows the relationship between two variables.', 'True', 10, NULL),
('MCQ', 'Which plot is best for displaying the distribution of a dataset?', 'Histogram', 10, NULL),
('TF', 'Heatmaps are used to represent data in matrix format with color.', 'True', 10, NULL),
('MCQ', 'What is a legend used for in a chart?', 'To explain colors or symbols used in the plot', 10, NULL),
('TF', 'Visualizations cannot be created with code.', 'False', 10, NULL),
('MCQ', 'Which of the following tools uses a drag-and-drop interface?', 'Power BI', 10, NULL),
('TF', 'Dashboards can include multiple visuals from different datasets.', 'True', 10, NULL),
('MCQ', 'Which chart would best display changes over time?', 'Line Chart', 10, NULL),
('TF', 'Good visualizations should be cluttered with data.', 'False', 10, NULL),
('MCQ', 'What is the role of color in visual design?', 'To differentiate and highlight data elements', 10, NULL),

-- Statistics Fundamentals
('MCQ', 'What is the mean in a dataset?', 'The average of all values', 10, NULL),
('TF', 'Standard deviation measures the spread of data.', 'True', 10, NULL),
('MCQ', 'Which distribution is bell-shaped?', 'Normal distribution', 10, NULL),
('TF', 'Median is affected by outliers.', 'False', 10, NULL),
('MCQ', 'What does a p‑value indicate?', 'Probability of observing data under null hypothesis', 10, NULL),
('TF', 'A correlation coefficient of zero means no linear relationship.', 'True', 10, NULL),
('MCQ', 'Which measure is center of data?', 'Median', 10, NULL),
('TF', 'Variance is the square of standard deviation.', 'True', 10, NULL),
('MCQ', 'What is the mode?', 'The most frequent value', 10, NULL),
('TF', 'A skewed distribution has a long tail.', 'True', 10, NULL),
('MCQ', 'What does interquartile range measure?', 'Middle 50% spread', 10, NULL),
('TF', 'Population and sample mean are always equal.', 'False', 10, NULL),
('MCQ', 'Which test compares two means?', 't‑test', 10, NULL),
('TF', 'Outliers can affect standard deviation.', 'True', 10, NULL),
('MCQ', 'Which is a categorical variable?', 'Color of car', 10, NULL),

-- Intro to Machine Learning
('MCQ', 'What is machine learning?', 'Algorithms that learn from data', 10, NULL),
('TF', 'ML can only be used for classification tasks.', 'False', 10, NULL),
('MCQ', 'Which is supervised ML?', 'Predicting house prices', 10, NULL),
('TF', 'Unsupervised learning uses labeled data.', 'False', 10, NULL),
('MCQ', 'What is overfitting?', 'Model too closely fits training data', 10, NULL),
('TF', 'Cross‑validation helps assess generalization.', 'True', 10, NULL),
('MCQ', 'Which is example of ML model?', 'Linear regression', 10, NULL),
('TF', 'A decision tree can capture non‑linear relationships.', 'True', 10, NULL),
('MCQ', 'What is feature in ML?', 'An input variable', 10, NULL),
('TF', 'Training data is used to evaluate final model.', 'False', 10, NULL),
('MCQ', 'What is a label?', 'The output variable', 10, NULL),
('TF', 'Supervised learning needs a label.', 'True', 10, NULL),
('MCQ', 'What is unsupervised learning?', 'Finding structure without labels', 10, NULL),
('TF', 'Clustering is supervised learning.', 'False', 10, NULL),
('MCQ', 'Which algorithm is for classification?', 'Logistic regression', 10, NULL),

-- Supervised Learning
('MCQ', 'Which algorithm learns from labeled data?', 'Decision tree', 10, NULL),
('TF', 'Regression is for predicting continuous values.', 'True', 10, NULL),
('MCQ', 'Which metric is for regression tasks?', 'Mean squared error', 10, NULL),
('TF', 'Accuracy is best for imbalanced regression.', 'False', 10, NULL),
('MCQ', 'Which algorithm handles non‑linear splits?', 'Random forest', 10, NULL),
('TF', 'Support vector machines can do classification.', 'True', 10, NULL),
('MCQ', 'What is bagging?', 'Building multiple models and averaging', 10, NULL),
('TF', 'Boosting sequentially trains weak learners.', 'True', 10, NULL),
('MCQ', 'Which loss is used in classification?', 'Log loss', 10, NULL),
('TF', 'Regression can only be linear.', 'False', 10, NULL),
('MCQ', 'Which is regularization method?', 'Lasso', 10, NULL),
('TF', 'Underfitting is when model is too simple.', 'True', 10, NULL),
('MCQ', 'Which scaler normalizes values 0‑1?', 'MinMax scaler', 10, NULL),
('TF', 'Decision trees require feature scaling.', 'False', 10, NULL),
('MCQ', 'Which is ensemble method?', 'Gradient boosting', 10, NULL),

-- Unsupervised Learning
('MCQ', 'What is clustering?', 'Grouping similar data points', 10, NULL),
('TF', 'Dimensionality reduction is unsupervised.', 'True', 10, NULL),
('MCQ', 'Which algorithm is for clustering?', 'K‑means', 10, NULL),
('TF', 'PCA is used for classification.', 'False', 10, NULL),
('MCQ', 'What is anomaly detection?', 'Finding rare/odd patterns', 10, NULL),
('TF', 'K‑means needs number of clusters.', 'True', 10, NULL),
('MCQ', 'Which metric measures cluster similarity?', 'Silhouette score', 10, NULL),
('TF', 'Hierarchical clustering merges clusters.', 'True', 10, NULL),
('MCQ', 'What is dimensionality reduction?', 'Reducing feature count', 10, NULL),
('TF', 'DBSCAN requires specifying clusters count.', 'False', 10, NULL),
('MCQ', 'Which is non‑hierarchical method?', 'K‑means', 10, NULL),
('TF', 'Autoencoders are unsupervised neural nets.', 'True', 10, NULL),
('MCQ', 'Which method groups by density?', 'DBSCAN', 10, NULL),
('TF', 'Clustering always needs numeric data.', 'False', 10, NULL),
('MCQ', 'Which is used for PCA visualization?', 'Scatter plot', 10, NULL),

-- Model Evaluation
('MCQ', 'What is confusion matrix used for?', 'Evaluating classification performance', 10, NULL),
('TF', 'Precision measures correct positives over predicted positives.', 'True', 10, NULL),
('MCQ', 'What does ROC AUC measure?', 'Trade‑off between true positive and false positive rates', 10, NULL),
('TF', 'High recall means few false negatives.', 'True', 10, NULL),
('MCQ', 'Which metric combines precision & recall?', 'F1 score', 10, NULL),
('TF', 'Accuracy is always the best metric.', 'False', 10, NULL),
('MCQ', 'What is for regression evaluation?', 'Mean absolute error', 10, NULL),
('TF', 'R‑squared shows proportion of explained variance.', 'True', 10, NULL),
('MCQ', 'What is cross‑validation used for?', 'Estimating generalization error', 10, NULL),
('TF', 'Validation set is used to tune hyperparameters.', 'True', 10, NULL),
('MCQ', 'Which curve plots recall vs. precision?', 'Precision‑recall curve', 10, NULL),
('TF', 'AUC stands for Area Under Curve.', 'True', 10, NULL),
('MCQ', 'What does bias–variance tradeoff describe?', 'Balance between underfitting and overfitting', 10, NULL),
('TF', 'Variance error is high when model overfits.', 'True', 10, NULL),
('MCQ', 'Which method splits dataset for evaluation?', 'Train‑test split', 10, NULL),

-- ML with Python
('MCQ', 'Which library is for ML in Python?', 'scikit‑learn', 10, NULL),
('TF', 'Pandas is used for machine learning.', 'False', 10, NULL),
('MCQ', 'Import the model: from sklearn.tree import DecisionTreeClassifier', 'Python import syntax', 10, NULL),
('TF', 'You must scale features manually before using scikit‑learn.', 'False', 10, NULL),
('MCQ', 'Which method trains a scikit‑learn model?', 'fit()', 10, NULL),
('TF', 'predict() returns class labels by default.', 'True', 10, NULL),
('MCQ', 'Which function evaluates a model?', 'cross_val_score()', 10, NULL),
('TF', 'GridSearchCV finds best hyperparameters.', 'True', 10, NULL),
('MCQ', 'Which dataset loader is built‑in?', 'load_iris()', 10, NULL),
('TF', 'You need GPU for all scikit‑learn models.', 'False', 10, NULL),
('MCQ', 'Which class balances data preprocessing?', 'Pipeline', 10, NULL),
('TF', 'One‑hot encoding converts categories to numbers.', 'True', 10, NULL),
('MCQ', 'Which method transforms text to numbers?', 'TfidfVectorizer', 10, NULL),
('TF', 'Scikit‑learn pipelines chain preprocess and model.', 'True', 10, NULL),
('MCQ', 'Which method persists a fitted model?', 'joblib.dump()', 10, NULL),
('TF', 'ML with Python focuses only on deep learning.', 'False', 10, NULL);


INSERT INTO Choice (AnswerText, QuestionID) VALUES
-- Q1
('SELECT', 1), ('INSERT', 1), ('UPDATE', 1), ('DELETE', 1),
-- Q2
('GETDATE()', 2), ('CURRENT_DATE()', 2), ('NOW()', 2), ('SYSDATE()', 2),
-- Q3
('AND', 3), ('OR', 3), ('NOT', 3), ('BETWEEN', 3),
-- Q4
('CREATE TABLE', 4), ('INSERT INTO', 4), ('ALTER TABLE', 4), ('DROP TABLE', 4),
-- Q5
('COUNT', 5), ('SUM', 5), ('MAX', 5), ('AVG', 5),
-- Q6
('JOIN', 6), ('GROUP BY', 6), ('ORDER BY', 6), ('WHERE', 6),
-- Q7
('CREATE TABLE #temp', 7), ('DECLARE TEMP TABLE', 7), ('TEMP TABLE CREATE', 7), ('NEW TEMP TABLE', 7),
-- Q8
('GROUP BY', 8), ('ORDER BY', 8), ('HAVING', 8), ('WHERE', 8),
-- Q9
('UNION', 9), ('JOIN', 9), ('INTERSECT', 9), ('ALL', 9),
-- Q10
('WHERE', 10), ('HAVING', 10), ('FILTER', 10), ('IF', 10),
-- Q11
('Sorts results based on specified columns', 11), ('Combines results', 11), ('Filters records', 11), ('Removes duplicates', 11),
-- Q12
('Links records between tables', 12), ('Deletes rows', 12), ('Creates tables', 12), ('Sorts data', 12),
-- Q13
('UPDATE', 13), ('INSERT', 13), ('DELETE', 13), ('MERGE', 13),
-- Q14
('MAX', 14), ('TOP', 14), ('COUNT', 14), ('AVG', 14),
-- Q15
('Second Normal Form (2NF)', 15), ('First Normal Form (1NF)', 15), ('Third Normal Form (3NF)', 15), ('Boyce-Codd Normal Form (BCNF)', 15),
-- Q16
('DELETE', 16), ('REMOVE', 16), ('DROP', 16), ('TRUNCATE', 16),
-- Q17
('JOIN', 17), ('WHERE', 17), ('GROUP BY', 17), ('ORDER BY', 17),
-- Q18
('A key made of two or more columns', 18), ('A key in another table', 18), ('A primary key', 18), ('An indexed column', 18),
-- Q19
('UPDATE', 19), ('INSERT', 19), ('MODIFY', 19), ('ALTER', 19),
-- Q20
('Uniquely identifies each record', 20), ('Links to foreign keys', 20), ('Deletes duplicates', 20), ('Sorts data', 20),
-- Q21
('INSERT', 21), ('UPDATE', 21), ('SELECT', 21), ('CREATE', 21),
-- Q22
('SUM', 22), ('AVG', 22), ('MAX', 22), ('COUNT', 22),
-- Q23
('MIN', 23), ('MAX', 23), ('FIRST', 23), ('AVG', 23),
-- Q24
('HAVING', 24), ('WHERE', 24), ('GROUP BY', 24), ('ORDER BY', 24),
-- Q25
('DROP TABLE', 25), ('DELETE TABLE', 25), ('TRUNCATE TABLE', 25), ('REMOVE TABLE', 25),
-- Q26
('LIKE', 26), ('MATCH', 26), ('PATTERN', 26), ('EQUALS', 26),
-- Q27
('Establishes relationships between tables', 27), ('Sorts data', 27), ('Deletes rows', 27), ('Indexes tables', 27),
-- Q28
('ALTER TABLE ADD COLUMN', 28), ('UPDATE TABLE', 28), ('ADD COLUMN TO TABLE', 28), ('INSERT COLUMN', 28),
-- Q29
('LEFT JOIN', 29), ('INNER JOIN', 29), ('FULL JOIN', 29), ('RIGHT JOIN', 29),
-- Q30
('Filters results within a specified range', 30), ('Groups values', 30), ('Joins tables', 30), ('Sorts data', 30),
-- Q31
('Modifies an existing table structure', 31), ('Deletes records', 31), ('Creates a new table', 31), ('Selects data', 31),
-- Q32
('DROP TABLE', 32), ('DELETE TABLE', 32), ('REMOVE', 32), ('CLEAR', 32),
-- Q33
('DISTINCT', 33), ('GROUP BY', 33), ('HAVING', 33), ('ORDER BY', 33),
-- Q34
('Limits the number of rows returned', 34), ('Sorts data', 34), ('Filters records', 34), ('Joins tables', 34),

('Structured Query Language', 35), ('Sequential Query Logic', 35), ('Standard Question Language', 35), ('Server Query Language', 35), ( 'True', 36),
( 'False', 36),
( 'True', 37),
( 'False', 37),
( 'True', 38),
( 'False', 38),
( 'True', 39),
( 'False', 39),
( 'True', 40),
( 'False', 40),
( 'True', 41),
( 'False', 41),
( 'True', 42),
( 'False', 42),
( 'True', 43),
( 'False', 43),
( 'True', 44),
( 'False', 44),
( 'True', 45),
( 'False', 45),




( 'HyperText Markup Language', 46),
( 'Home Tool Markup Language', 46),
( 'Hyperlinks and Text Markup Language', 46),
( 'Hyper Transfer Markup Language', 46),

( '<a>', 47),
( '<link>', 47),
( '<href>', 47),
( '<hyperlink>', 47),

( '<img>', 48),
( '<image>', 48),
( '<pic>', 48),
( '<src>', 48),

( 'src', 49),
( 'href', 49),
( 'link', 49),
( 'url', 49),

( '<br>', 50),
( '<lb>', 50),
( '<break>', 50),
( '<line>', 50),

( 'color', 51),
( 'font-color', 51),
( 'text-color', 51),
( 'fgcolor', 51),

( '#id', 52),
( '.id', 52),
( '*id', 52),
( '&id', 52),

( 'font-size', 53),
( 'text-size', 53),
( 'size', 53),
( 'text-style', 53),

( '<link rel="stylesheet" href="style.css">', 54),
( '<style src="style.css">', 54),
( '<css href="style.css">', 54),
( '<stylesheet link="style.css">', 54),

( 'background-color', 55),
( 'bgcolor', 55),
( 'color-background', 55),
( 'background', 55),


( 'True', 56),
( 'False', 56),

( 'True', 57),
( 'False', 57),

( 'True', 58),
( 'False', 58),

( 'True', 59),
( 'False', 59),

( 'True', 60),
( 'False', 60),

( '<ul>', 61),
( '<ol>', 61),
( '<li>', 61),
( '<list>', 61),

( 'rem', 62),
( 'em', 62),
( 'px', 62),
( '%', 62),

( '<tr>', 63),
( '<td>', 63),
( '<th>', 63),
( '<table>', 63),

( 'letter-spacing', 64),
( 'word-spacing', 64),
( 'text-spacing', 64),
( 'spacing', 64),

( 'margin: 0 auto;', 65),
( 'text-align: center;', 65),
( 'align: center;', 65),
( 'display: center;', 65),

( '<script src="app.js">', 66),
( '<script href="app.js">', 66),
( '<link src="app.js">', 66),
( '<script link="app.js">', 66),

( 'let', 67),
( 'var', 67),
( 'const', 67),
( 'define', 67),

( 'JSON.parse()', 68),
( 'JSON.stringify()', 68),
( 'parseJSON()', 68),
( 'JSON.toObject()', 68),

( '===', 69),
( '==', 69),
( '=', 69),
( '!=', 69),

( 'setTimeout()', 70),
( 'delay()', 70),
( 'setInterval()', 70),
( 'timeout()', 70),

( '// comment', 71),
( '<!-- comment -->', 71),
( '# comment', 71),
( '/* comment */', 71),

( 'Boolean', 72),
( 'Character', 72),
( 'Double', 72),
( 'Decimal', 72),

( 'function myFunction() { }', 73),
( 'func myFunction() { }', 73),
( 'define myFunction() { }', 73),
( 'create function myFunction() { }', 73),

( 'push()', 74),
( 'append()', 74),
( 'insert()', 74),
( 'add()', 74),

( 'object', 75),
( 'null', 75),
( 'undefined', 75),
( 'NaN', 75),

( 'do...while', 76),
( 'for', 76),
( 'while', 76),
( 'foreach', 76),

( 'let obj = { }', 77),
( 'obj = new Object()', 77),
( 'create obj = { }', 77),
( 'make object obj = { }', 77),

( 'Document Object Model', 78),
( 'Data Object Manager', 78),
( 'Display Output Method', 78),
( 'Document Order Model', 78),

( 'document.getElementById()', 79),
( 'getElement("id")', 79),
( 'document.querySelector()', 79),
( 'selectById()', 79),

( 'Not a Number', 80),
( 'Null and None', 80),
( 'Name as Number', 80),
( 'No actual Number', 80),
( 'True', 81),
( 'False', 81),

( 'True', 82),
( 'False', 82),

( 'True', 83),
( 'False', 83),

( 'True', 84),
( 'False', 84),

( 'True', 85),
( 'False', 85),

('Building user interfaces', 86),
('Managing databases', 86),
('Writing server-side code', 86),
('Creating REST APIs', 86),

('True', 87),
('False', 87),

('class MyComponent extends React.Component', 88),
('function MyComponent() {}', 88),
('React.component()', 88),
('defineComponent(MyComponent)', 88),

('True', 89),
('False', 89),

('document.createElement()', 90),
('React.createElement()', 90),
('create.ReactElement()', 90),
('new React.Element()', 90),

('True', 91),
('False', 91),

('useState', 92),
('useEffect', 92),
('useContext', 92),
('useRef', 92),

('True', 93),
('False', 93),

('A replica of the entire browser DOM', 94),
('An in-memory representation of the real DOM', 94),
('A copy of the HTML file', 94),
('The main JavaScript runtime environment', 94),

('True', 95),
('False', 95),

('npm init react-app my-app', 96),
('npx create-react-app my-app', 96),
('react create my-app', 96),
('npm start react my-app', 96),

('True', 97),
('False', 97),

('They are used to store data locally', 98),
('They are inputs to a component.', 98),
('They represent component lifecycle methods', 98),
('They are global variables', 98),

('True', 99),
('False', 99),

('To sort the list items', 100),
('To help React identify which items have changed', 100),
('To set the style of list elements', 100),
('To generate random IDs for elements', 100),

('Building scalable network applications', 101),
('Writing SQL queries', 101),
('Designing mobile interfaces', 101),
('Managing Linux servers', 101),

('True', 102),
('False', 102),

('http', 103),
('fs', 103),
('net', 103),
('os', 103),

('True', 104),
('False', 104),

('import()', 105),
('require()', 105),
('include()', 105),
('load()', 105),

('True', 106),
('False', 106),

('POST', 107),
('GET', 107),
('DELETE', 107),
('PUT', 107),

('True', 108),
('False', 108),

('Too many arguments', 109),
('Nested callback functions', 109),
('Improper async/await usage', 109),
('Synchronous blocking code', 109),

('True', 110),
('False', 110),

('npm start project', 111),
('npm init', 111),
('npm create', 111),
('node init', 111),

('True', 112),
('False', 112),

('React', 113),
('Express', 113),
('Angular', 113),
('Django', 113),

('True', 114),
('False', 114),

('res.send()', 115),
('res.json()', 115),
('res.write()', 115),
('res.render()', 115),

('SUM', 116), ('AVERAGE', 116), ('MEAN', 116), ('MEDIAN', 116),
('True', 117), ('False', 117),
('True', 125), ('False', 125), 
('True', 127), ('False', 127),
('Searches horizontally for a value', 118), ('Searches for a value in the first column and returns a value in the same row from another column', 118), ('Sorts data in a range', 118), ('Deletes duplicate values', 118),
 ('True', 119), ('False', 119),
('#', 120), ('@', 120), ('$', 120), ('&', 120),
('Home', 122), ('Insert', 122), ('Data', 122), ('Review', 122),
('True', 123), ('False', 123),
('True', 121), ('False', 121),
('To create charts', 124), ('To analyze conditional formatting', 124), ('To summarize and analyze data', 124), ('To filter data', 124),
('COUNTA', 126), ('COUNTIF', 126), ('SUMIF', 126), ('IF', 126),
('Ctrl + 2', 128), ('Ctrl + 1', 128), ('Ctrl + Shift + F', 128), ('Ctrl + Alt + 1', 128),
('True', 129), ('False', 129),
('.xlsx', 130), ('.xls', 130), ('.xlsm', 130), ('.csv', 130),

-- Power BI MCQ Choices
('Data mining', 131), ('Business intelligence and data visualization', 131), ('Cloud storage', 131), ('App development', 131),
('True', 132), ('False', 132),
('M', 133), ('DAX', 133), ('SQL', 133), ('Power FX', 133),
('True', 134), ('False', 134),
('Visualize relationships', 135), ('Transform and clean data before loading', 135), ('Publish dashboards', 135), ('Write DAX measures', 135),
('True', 136), ('False', 136),
('Column Chart', 137), ('Line Chart', 137), ('Pie Chart', 137), ('Map', 137),
('True', 138), ('False', 138),
('Data', 139), ('Fields', 139), ('Model', 139), ('Visualizations', 139),
('True', 140), ('False', 140),
('Import', 141), ('DirectQuery', 141), ('Live Connect', 141), ('Hybrid', 141),
('True', 142), ('False', 142),
('AVERAGE', 143), ('TOTAL', 143), ('SUM', 143), ('COUNT', 143),
('True', 144), ('False', 144),
('Card', 145), ('Table', 145), ('Bookmark', 145), ('Tile', 145),

-- Python for Data Analysis MCQ Choices
('pandas', 146), ('matplotlib', 146), ('seaborn', 146), ('scikit-learn', 146),
('True', 147), ('False', 147),
('Tuple representing number of rows and columns', 148), ('List of column names', 148), ('Dictionary of datatypes', 148), ('Total number of values', 148),
('True', 149), ('False', 149),
('head()', 150), ('tail()', 150), ('info()', 150), ('describe()', 150),
('True', 151), ('False', 151),
('dropna()', 152), ('fillna()', 152), ('drop()', 152), ('replace()', 152),
('True', 153), ('False', 153),
('merge()', 154), ('join()', 154), ('concat()', 154), ('append()', 154),
('True', 155), ('False', 155),
('NumPy', 156), ('SciPy', 156), ('pandas', 156), ('matplotlib', 156),
('True', 157), ('False', 157),
('Rows', 158), ('Columns', 158), ('Cells', 158), ('Index', 158),
('True', 159), ('False', 159),
('describe()', 160), ('info()', 160), ('sum()', 160), ('max()', 160),

-- Data Visualization MCQ Choices
('matplotlib', 161), ('seaborn', 161), ('plotly', 161), ('ggplot2', 161),
('True', 162), ('False', 162),
('Pie Chart', 163), ('Bar Chart', 163), ('Line Chart', 163), ('Histogram', 163),
('True', 164), ('False', 164),
('Power BI', 165), ('Excel', 165), ('Python', 165), ('Tableau', 165),
('True', 166), ('False', 166),
('Box plot', 167), ('Histogram', 167), ('Scatter plot', 167), ('Pie chart', 167),
('True', 168), ('False', 168),
('To display gridlines', 169), ('To add labels to axes', 169), ('To explain colors or symbols used in the plot', 169), ('To change chart type', 169),
('True', 170), ('False', 170),
('Excel', 171), ('Power BI', 171), ('Python', 171), ('MySQL', 171),
('True', 172), ('False', 172),
('Bar Chart', 173), ('Histogram', 173), ('Line Chart', 173), ('Pie Chart', 173),
('True', 174), ('False', 174),
('To decorate charts', 175), ('To differentiate and highlight data elements', 175), ('To store values', 175), ('To export graphs', 175)
