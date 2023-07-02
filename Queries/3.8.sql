--3.8 Kik azok a személyek, akik nem csak a saját jármûvükbe tankolnak, és melyek ezek a jármûvek?
SELECT Person.LastName, Person.FirstName, Vehicle.Type, Vehicle.Brand, Vehicle.PlateNr
FROM Person
JOIN Refueling ON Person.ID = Refueling.PersonID
JOIN Vehicle ON Refueling.VehicleID = Vehicle.ID
WHERE Vehicle.OwnerPersonID <> Person.ID
