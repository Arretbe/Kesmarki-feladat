--3.5 Milyen tankol�sok voltak, ahol olyan szem�ly tankolt, aki nem is jogosult a j�rm� vezet�s�re?
SELECT RefuelingDate, Amount, Type, Brand, PlateNr, LastName, FirstName
FROM Refueling
LEFT JOIN HasLicence ON Refueling.PersonID = HasLicence.PersonID AND Refueling.VehicleID = HasLicence.VehicleID
JOIN Vehicle ON Refueling.VehicleID = Vehicle.ID
JOIN Person ON Refueling.PersonID = Person.ID
WHERE HasLicence.PersonID IS NULL