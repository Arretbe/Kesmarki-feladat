--3.1 Kinek milyen járműve van a tulajdonában?
SELECT LastName, FirstName, Type, Brand, PlateNr
FROM Person
INNER JOIN Vehicle ON Vehicle.OwnerPersonID = Person.ID