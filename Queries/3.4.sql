--3.4 Milyen tankolások voltak, ahol nem a jármû tulajdonosa tankolt?
SELECT RefuelingDate, Amount, Type, Brand, PlateNr, LastName, FirstName
FROM Refueling
INNER JOIN Vehicle ON Refueling.VehicleID = Vehicle.ID and Refueling.PersonID <> Vehicle.OwnerPersonID
JOIN Person ON Refueling.PersonID = Person.ID