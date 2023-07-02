--3.8 Kik azok a szem�lyek, akik nem csak a saj�t j�rm�v�kbe tankolnak, �s melyek ezek a j�rm�vek?
SELECT Person.LastName, Person.FirstName, Vehicle.Type, Vehicle.Brand, Vehicle.PlateNr
FROM Person
JOIN Refueling ON Person.ID = Refueling.PersonID
JOIN Vehicle ON Refueling.VehicleID = Vehicle.ID
WHERE Vehicle.OwnerPersonID <> Person.ID
