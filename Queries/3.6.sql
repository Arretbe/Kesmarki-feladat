--3.6 �vente mennyit tankolnak a j�rm�vekbe?
SELECT Vehicle.Type, Vehicle.Brand, Vehicle.PlateNr, YEAR(Refueling.RefuelingDate) AS �v, SUM(Refueling.Amount) AS �sszeg
FROM Refueling
JOIN Vehicle ON Refueling.VehicleID = Vehicle.ID
GROUP BY Vehicle.Type, Vehicle.Brand, Vehicle.PlateNr, YEAR(Refueling.RefuelingDate)
