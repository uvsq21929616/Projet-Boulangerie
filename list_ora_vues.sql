SELECT 
    table_name,
    column_name,
    data_type
FROM     
    USER_TAB_COLUMNS
WHERE 
    table_name IN (SELECT view_name FROM USER_VIEWS)
ORDER BY
    table_name;
