SELECT
    table_name,
    constraint_name,
    constraint_type,
    search_condition
FROM
    user_constraints
WHERE
    table_name IN ('Clients', 'Boulangerie', 'Equipe', 'Employe', 'Vente', 'Produit', 'Pain', 'Patisserie', 'Ligne_Vente');
