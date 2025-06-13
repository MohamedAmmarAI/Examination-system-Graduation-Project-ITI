DROP DATABASE ExaminationSystem;


ALTER DATABASE ExaminationSystem
SET SINGLE_USER WITH ROLLBACK IMMEDIATE;



--Finding Constraints


SELECT 
    CONSTRAINT_NAME, 
    CONSTRAINT_TYPE 
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'YourTableName';


SELECT 
    t.name AS TableName,
    c.name AS ConstraintName,
    c.type_desc AS ConstraintType
FROM sys.objects t
JOIN sys.objects c ON t.object_id = c.parent_object_id
WHERE t.name = 'YourTableName';









-- --Finding Triggers

SELECT 
    t.name AS TriggerName,
    s.name AS SchemaName,
    tbl.name AS TableName,
    t.is_disabled,
    t.create_date,
    t.modify_date
FROM sys.triggers t
JOIN sys.tables tbl ON t.parent_id = tbl.object_id
JOIN sys.schemas s ON tbl.schema_id = s.schema_id;

