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
            (3, 'Art�r'),
            (4, 'Arus'), 
            (5, 'Arv�d'),
            (6, 'Arvid'),
            (7, '�rvin'),
            (8, 'Arz�n'),
            (9, 'Aser'),
            (10, '�ser'),
            (11, 'Ashraf'),
            (12, 'Asur'),
            (13, 'Asz�f'),
            (14, '�szl�n'),
            (15, 'Aszmet'),
            (16, 'Aszter'),
            (17, 'Asztor'),
            (18, 'Asztrik'),
            (19, 'Ata'),
            (20, 'At�d'),
            (21, 'Atak�m'),
            (22, 'Atan�z'),
            (23, 'Atilla'),
            (24, 'Atlasz'),
            (25, 'Aton'),
            (26, 'Atos'),
            (27, 'Atosz'),
            (28, 'Attila'),
            (29, 'Auguszt'),
            (30, 'Augusztin'),
            (31, 'Augusztusz'),
            (32, 'Aur�l'),
            (33, 'Aur�li�n'),
            (34, 'Aven�r'),
            (35, 'Avidan'),
            (36, 'Avner'),
            (37, 'Axel'),
            (38, 'Az�r'),
            (39, 'Azar�l'),
            (40, 'Azim')
        ) AS names(id, firstname)
        CROSS JOIN (
            SELECT lastname
            FROM (
                VALUES
                (1, 'Kov�cs'),
                (2, 'Szab�'),
                (3, 'Ill�s'),
                (4, 'Nagy'),
                (5, 'Kis'),
                (6, 'Lakatos'),
                (7, '�goston'),
                (8, 'G�l'),
                (9, 'Ga�l'),
                (10, 'Horv�th'),
                (11, 'G�sp�r'),
                (12, 'Kelemen'),
                (13, 'Bogd�nyi'),
                (14, 'Varga'),
                (15, 'Tim�r')
            ) AS last_names(id, lastname)
            WHERE id = CAST((RAND() * 15) + 1 AS INT)
        ) AS last_names
        WHERE names.id = CAST((RAND() * 40) + 1 AS INT)
    ) AS random_name;
END;
