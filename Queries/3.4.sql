--3.4 Milyen tankol�sok voltak, ahol nem a j�rm� tulajdonosa tankolt?
SELECT RefuelingDate, Amount, Type, Brand, PlateNr, LastName, FirstName
FROM Refueling
INNER JOIN Vehicle ON Refueling.VehicleID = Vehicle.ID and Refueling.PersonID <> Vehicle.OwnerPersonID
JOIN Person ON Refueling.PersonID = Person.ID