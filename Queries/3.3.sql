--3.3 Ki nem vezetheti az egyes jármûveket?
SELECT LastName, FirstName, Type, Brand, PlateNr
FROM Person
INNER JOIN HasLicence ON Person.ID <> HasLicence.PersonID
JOIN Vehicle ON HasLicence.VehicleID = Vehicle.ID
ORDER BY Person.ID ASC