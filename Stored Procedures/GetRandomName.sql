CREATE PROCEDURE dbo.GetRandomNev
AS
BEGIN
    SELECT TOP 1 lastname, firstname
    FROM (
        SELECT lastname, firstname
        FROM (
            VALUES 
            (1, 'Artemon'),
            (2, 'Artin'),
            (3, 'Artúr'),
            (4, 'Arus'), 
            (5, 'Arvéd'),
            (6, 'Arvid'),
            (7, 'Árvin'),
            (8, 'Arzén'),
            (9, 'Aser'),
            (10, 'Áser'),
            (11, 'Ashraf'),
            (12, 'Asur'),
            (13, 'Aszáf'),
            (14, 'Ászlán'),
            (15, 'Aszmet'),
            (16, 'Aszter'),
            (17, 'Asztor'),
            (18, 'Asztrik'),
            (19, 'Ata'),
            (20, 'Atád'),
            (21, 'Atakám'),
            (22, 'Atanáz'),
            (23, 'Atilla'),
            (24, 'Atlasz'),
            (25, 'Aton'),
            (26, 'Atos'),
            (27, 'Atosz'),
            (28, 'Attila'),
            (29, 'Auguszt'),
            (30, 'Augusztin'),
            (31, 'Augusztusz'),
            (32, 'Aurél'),
            (33, 'Aurélián'),
            (34, 'Avenár'),
            (35, 'Avidan'),
            (36, 'Avner'),
            (37, 'Axel'),
            (38, 'Azár'),
            (39, 'Azarél'),
            (40, 'Azim')
        ) AS names(id, firstname)
        CROSS JOIN (
            SELECT lastname
            FROM (
                VALUES
                (1, 'Kovács'),
                (2, 'Szabó'),
                (3, 'Illés'),
                (4, 'Nagy'),
                (5, 'Kis'),
                (6, 'Lakatos'),
                (7, 'Ágoston'),
                (8, 'Gál'),
                (9, 'Gaál'),
                (10, 'Horváth'),
                (11, 'Gáspár'),
                (12, 'Kelemen'),
                (13, 'Bogdányi'),
                (14, 'Varga'),
                (15, 'Timár')
            ) AS last_names(id, lastname)
            WHERE id = CAST((RAND() * 15) + 1 AS INT)
        ) AS last_names
        WHERE names.id = CAST((RAND() * 40) + 1 AS INT)
    ) AS random_name;
END;
