--3.10Készítsen tárolt eljárást (stored procedure), ami egy adott jármûhöz generál tankolási adatokat, megadott idõszakban, megadott intenzitással, de véletlenszerû eltolással.
CREATE PROCEDURE dbo.TankolasiAdatGeneralas
    @PlateNr VARCHAR(6),
    @Datumtol DATE,
    @Datumig DATE,
    @Intenzitas INT
AS
BEGIN
    DECLARE @VehicleID INT
    SET @VehicleID = (SELECT ID FROM Vehicle WHERE PlateNr = @PlateNr)

    IF @VehicleID IS NOT NULL
    BEGIN
        DECLARE @RefuelingDate DATE
        DECLARE @Amount NUMERIC(10, 2)
        DECLARE @PersonID INT
		DECLARE @Napelteres INT

        WHILE @Datumtol < @Datumig
        BEGIN
            IF @Intenzitas = 1 
            BEGIN
                SET @RefuelingDate = DATEADD(WEEK, DATEDIFF(WEEK, 0, @Datumtol), 0)
                SET @Datumtol = DATEADD(WEEK, 1, @Datumtol)
            END
            ELSE IF @Intenzitas = 2
            BEGIN
                SET @RefuelingDate = DATEADD(MONTH, DATEDIFF(MONTH, 0, @Datumtol), 0)
                SET @Datumtol = DATEADD(MONTH, 1, @Datumtol)
            END
            ELSE IF @Intenzitas = 3
            BEGIN
                SET @RefuelingDate = DATEADD(MONTH, (DATEDIFF(MONTH, 0, @Datumtol) / 3) * 3, 0)
                SET @Datumtol = DATEADD(MONTH, 3, @Datumtol)
            END

            SET @Napelteres = DATEDIFF(DAY, @RefuelingDate, DATEADD(DAY, 1, @Datumtol))

            IF @Napelteres > 0
            BEGIN
                SET @RefuelingDate = DATEADD(DAY, ROUND(RAND() * @Napelteres, 0), @RefuelingDate)
                SET @Amount = ROUND(RAND() * 50, 2)
                SET @PersonID = (SELECT TOP 1 ID FROM Person ORDER BY NEWID())

                INSERT INTO Refueling (VehicleID, PersonID, RefuelingDate, Amount)
                VALUES (@VehicleID, @PersonID, @RefuelingDate, @Amount)
            END
        END
    END
END
