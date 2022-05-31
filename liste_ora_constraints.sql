SELECT T.name AS nomTable,

    C.name AS nomColonne,

    CHK.name AS nomContrainte,

    CHK.definition AS DefinitionContrainte

FROM sys.tables AS T -- Tables
JOIN sys.columns AS C

    ON T.object_id = C.object_id -- Colonnes

JOIN sys.check_constraints AS CHK -- contraintes CHECK  

    ON CHK.parent_object_id = T.object_id  

    AND CHK.parent_column_id = C.column_id
ORDER BY T.name;

--ou--
SELECT constraint_name, 
       constraint_type,
       search_condition
  FROM USER_CONSTRAINTS
