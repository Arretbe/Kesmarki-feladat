--3.2 Ki milyen jármûvet vezethet?
SELECT LastName, FirstName, Type, Brand, PlateNr
FROM Person
INNER JOIN HasLicence ON Person.ID = HasLicence.PersonID
JOIN Vehicle ON HasLicence.VehicleID = Vehicle.ID