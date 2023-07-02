--3.7 Melyik jármûbe tankoltak a legtöbbet 2017-ben?
SELECT TOP 1 Vehicle.Type, Vehicle.Brand, Vehicle.PlateNr, SUM(Refueling.Amount) AS Összeg
FROM Refueling JOIN Vehicle ON Refueling.VehicleID = Vehicle.ID
WHERE YEAR(Refueling.RefuelingDate) = 2023
GROUP BY Vehicle.Type, Vehicle.Brand, Vehicle.PlateNr
ORDER BY SUM(Refueling.Amount) DESC
