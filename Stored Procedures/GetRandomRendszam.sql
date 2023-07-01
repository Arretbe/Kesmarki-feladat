CREATE PROCEDURE dbo.GetRandomRendszam
    @RandomRendszam VARCHAR(6) OUTPUT
AS
BEGIN
    DECLARE @RandomKarakterek VARCHAR(3)
    DECLARE @RandomSzamok VARCHAR(3)
    
    SET @RandomKarakterek = CONCAT(CHAR(65 + ROUND(RAND() * 25, 0)),CHAR(65 + ROUND(RAND() * 25, 0)),CHAR(65 + ROUND(RAND() * 25, 0)));
    SET @RandomSzamok = CONCAT(CAST(ROUND(RAND() * 9, 0) AS VARCHAR(1)),CAST(ROUND(RAND() * 9, 0) AS VARCHAR(1)),CAST(ROUND(RAND() * 9, 0) AS VARCHAR(1)));
    
    SET @RandomRendszam = CONCAT(@RandomKarakterek,@RandomSzamok);
END
