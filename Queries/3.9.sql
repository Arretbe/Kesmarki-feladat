CREATE FUNCTION dbo.GetAtlagFogyasztas (
    @PlateNr VARCHAR(7),
    @Datumtol DATE,
    @Datumig DATE
)
RETURNS DECIMAL(10, 2)
AS
BEGIN
	DECLARE @Atlagfogyasztas DECIMAL(10, 2) =
	(ISNULL((SELECT AVG(Refueling.Amount)
	FROM Refueling
	JOIN Vehicle ON Refueling.VehicleID = Vehicle.ID
	WHERE Vehicle.PlateNr = @PlateNr
    AND Refueling.RefuelingDate >= @Datumtol
    AND Refueling.RefuelingDate <= @Datumig),0));

    RETURN @Atlagfogyasztas;
END;

