-- Joins 
SELECT * FROM Invoice i
JOIN InvoiceLine il ON i.InvoiceId = il.InvoiceId
WHERE UnitPrice > .99

SELECT i.InvoiceDate, i.Total, c.FirstName, c.LastName 
FROM Invoice i
JOIN Customer c ON c.CustomerId = i.CustomerId

SELECT c.FirstName, c.LastName, e.FirstName, e.LastName
FROM Customer c
JOIN Employee e ON c.SupportRepId = e.EmployeeId

SELECT a.Title, ar.Name
FROM Album a
JOIN Artist ar ON a.ArtistId = ar.ArtistId

SELECT pt.TrackId
FROM PlaylistTrack pt
JOIN Playlist p ON p.PlaylistId = pt.PlaylistId
WHERE p.Name = 'Music'

SELECT t.Name
FROM Track t
JOIN PlaylistTrack pt ON pt.TrackId = t.TrackId
WHERE pt.PlaylistId = 5

SELECT t.Name, p.Name
FROM Track t
JOIN PlaylistTrack pt ON pt.TrackId = t.TrackId
JOIN Playlist p ON pt.PlaylistId = p.PlaylistId

SELECT t.Name, a.Title
FROM Track t
JOIN Genre g ON g.GenreId = t.GenreId
JOIN Album a ON a.AlbumId = t.AlbumId
WHERE g.Name = 'Alternative'

SELECT t.Name, al.Title, a.Name, g.Name
FROM Track t
JOIN PlaylistTrack pt ON pt.TrackId = t.TrackId
JOIN Playlist p ON p.PlaylistId = pt.PlaylistId
JOIN Genre g ON g.GenreId = t.GenreId
JOIN Album al ON al.AlbumId = t.AlbumId
JOIN Artist a ON a.ArtistId = al.ArtistId
WHERE p.Name = 'Music'

-- Nested queries 

SELECT * 
FROM Invoice 
WHERE InvoiceId IN (SELECT InvoiceId FROM InvoiceLine WHERE UnitPrice > .99)

SELECT * 
FROM PlaylistTrack 
WHERE PlaylistId = (SELECT PlaylistId FROM Playlist WHERE Name = 'Music')

SELECT Name
FROM Track 
WHERE TrackId IN (SELECT TrackId FROM PlaylistTrack WHERE PlaylistId = 5)

SELECT *
FROM Track 
WHERE GenreId IN (SELECT GenreId FROM Genre WHERE Name = 'Comedy')

SELECT *
FROM Track 
WHERE AlbumId IN (SELECT AlbumId FROM Album WHERE Title = 'Fireball')

SELECT *
FROM Track 
WHERE AlbumId IN 
    (SELECT AlbumId FROM Album WHERE ArtistId IN 
        (SELECT ArtistId FROM Artist WHERE Name = 'Queen'))

-- Updating rows

UPDATE Customer 
SET Fax = NULL 
WHERE Fax IS NOT NULL

UPDATE Customer 
SET Company = 'Self' 
WHERE Company IS NULL;

UPDATE Customer 
SET LastName = 'Thompson' 
WHERE FirstName = 'Julia' AND LastName = 'Barnett';

UPDATE Customer 
SET SupportRepId = 4 
WHERE Email = 'luisrojas@yahoo.cl';

UPDATE Track 
SET Composer = "The darkness around us" 
WHERE Composer IS NULL AND GenreId = (SELECT GenreId FROM Genre WHERE Name = 'Metal');

-- Group by 

SELECT g.Name, count(*)
FROM Track t
JOIN Genre g ON t.GenreId = g.GenreId
GROUP BY g.GenreId

SELECT g.Name, count(*)
FROM Track t
JOIN Genre g ON t.GenreId = g.GenreId
GROUP BY g.GenreId
HAVING g.Name = 'Pop' OR g.Name = 'Rock'

SELECT a.Name, count(*)
FROM Artist a
JOIN Album al ON a.ArtistId = al.ArtistId
GROUP BY al.ArtistId

-- Distinct 

SELECT DISTINCT Composer
FROM Track 

SELECT DISTINCT BillingPostalCode
FROM Invoice 

SELECT DISTINCT Company
FROM Customer 

-- Delete rows



-- Ecommmerce simulation 


