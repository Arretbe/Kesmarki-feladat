CREATE PROCEDURE dbo.GetRandomBrand
    @RandomBrand VARCHAR(6) OUTPUT
AS
BEGIN
    SET @RandomBrand = (SELECT TOP 1 Brands
        FROM (
            VALUES 
            (1, 'BMW'),
            (2, 'Honda'),
            (3, 'Suzuki'),
            (4, 'Yamaha'),
            (5, 'Kawasaki'),
            (6, 'Ducati'),
            (7, 'KTM'),
            (8, 'Mercedes-Benz'),
            (9, 'Audi'),
            (10, 'Chevrolet'),
            (11, 'Ford'),
            (12, 'Jaguar'),
            (13, 'Kia'),
            (14, 'Lamborghini'),
            (15, 'Nissan'),
            (16, 'Porsche'),
            (17, 'Subaru'),
            (18, 'Toyota'),
            (19, 'Volkswagen')
        ) AS Brands(ID, Brands)
        WHERE id = CAST((RAND() * 19) + 1 AS INT)
    );
END;