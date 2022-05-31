SELECT TR.name,
    TR.is_disabled AS estActif,
    CASE TR.is_instead_of_trigger
      WHEN 1 THEN 'INSTEAD OF'
      ELSE 'AFTER'
    END AS typeDeclenchement,
    TRE.type_desc AS DDLDeclencheur,
    TRE.is_first AS estPremier,
    TRE.is_last AS estDernier
FROM sys.triggers AS TR
JOIN sys.trigger_events AS TRE
  ON TR.object_id = TRE.object_id
WHERE parent_id = 0


---ou
 SELECT  
    name,
    is_instead_of_trigger
FROM 
    sys.triggers  
WHERE 
    type = 'TR';