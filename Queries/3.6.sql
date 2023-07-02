--3.6 Évente mennyit tankolnak a jármûvekbe?
SELECT Vehicle.Type, Vehicle.Brand, Vehicle.PlateNr, YEAR(Refueling.RefuelingDate) AS Év, SUM(Refueling.Amount) AS Összeg
FROM Refueling
JOIN Vehicle ON Refueling.VehicleID = Vehicle.ID
GROUP BY Vehicle.Type, Vehicle.Brand, Vehicle.PlateNr, YEAR(Refueling.RefuelingDate)
