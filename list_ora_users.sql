SELECT 
    grantee,
    granted_role,
    admin_option,
    default_role
FROM 
    DBA_ROLE_PRIVS
WHERE 
    grantee IN (SELECT username FROM all_users);
