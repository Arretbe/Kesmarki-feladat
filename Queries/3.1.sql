--3.1 Kinek milyen j�rm�ve van a tulajdon�ban?
SELECT LastName, FirstName, Type, Brand, PlateNr
FROM Person
INNER JOIN Vehicle ON Vehicle.OwnerPersonID = Person.ID