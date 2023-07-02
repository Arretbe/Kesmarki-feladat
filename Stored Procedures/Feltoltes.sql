CREATE PROCEDURE dbo.Feltoltes
AS
BEGIN
	DECLARE @PersonCount INT = 2;
	DECLARE @RandomName TABLE (
		RandomLastName VARCHAR(50),
		RandomFirstname VARCHAR(50)
	);
	DECLARE @Rendszam VARCHAR(6);
	DECLARE @Tipus VARCHAR(5);
	DECLARE @Brand VARCHAR(5);
    DECLARE @VehicleCount INT;
    DECLARE @PersonID INT;
    DECLARE @VehicleID INT;
    DECLARE @RefuelingCount INT;
    DECLARE @RefuelingDate DATETIME;
    DECLARE @Amount NUMERIC(10, 2);

	WHILE @PersonCount > 0
	BEGIN
		SET @VehicleCount = 10;

		INSERT INTO Person (Lastname, FirstName)
		EXEC GetRandomNev;

		WHILE @VehicleCount > 0
		BEGIN
			SET @PersonID = (SELECT TOP 1 ID FROM Person ORDER BY Person.ID DESC);
			EXEC dbo.GetRandomRendszam @Rendszam OUTPUT;
			IF @Rendszam not in(SELECT PlateNr FROM Vehicle) BEGIN
				SELECT TOP 1 @Tipus = Tipus
				FROM (
					SELECT 'Motor' AS Tipus
					UNION ALL
					SELECT 'Autó' AS Tipus
				) AS tmp
				ORDER BY NEWID();
			
				EXEC dbo.GetRandomBrand @Brand OUTPUT;
				INSERT INTO Vehicle (Type, Brand, PlateNr, OwnerPersonID)
				VALUES (@Tipus,@Brand,@Rendszam,@PersonID);

				SET @VehicleID = (SELECT TOP 1 ID FROM Vehicle ORDER BY ID DESC);
				INSERT INTO HasLicence(PersonID,VehicleID)
				VALUES (@PersonID,@VehicleID);
				SET @RefuelingCount = 5;
				WHILE @RefuelingCount > 0
				BEGIN
					SET @RefuelingDate = DATEADD(DAY, -FLOOR(RAND() * 10), GETDATE());
					SET @Amount = ROUND(RAND() * 50, 2);

					INSERT INTO Refueling (VehicleID, PersonID, RefuelingDate, Amount)
					VALUES (@VehicleID, @PersonID, @RefuelingDate, @Amount);

					SET @RefuelingCount = @RefuelingCount - 1;
				END

				SET @VehicleCount = @VehicleCount - 1;
			END
		END
		SET @PersonCount = @PersonCount - 1;
	END
END
