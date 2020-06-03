SELECT
	Id,
	[Label]

FROM Genre;

SELECT
	ArtistName,
	YearEstablished
FROM Artist
ORDER BY ArtistName;

SELECT
	song.Title,
	artist.ArtistName
FROM Song song
	JOIN Artist artist on song.ArtistId = artist.Id;

SELECT
	artist.ArtistName
From Artist artist
	JOIN Album alb on alb.ArtistId = artist.Id
	JOIN Genre gen on gen.Id = alb.GenreId
	WHERE gen.Id = 9;

SELECT
	artist.ArtistName
FROM Artist artist
	JOIN Album alb on alb.ArtistId = artist.Id
	JOIN Genre gen on gen.Id = alb.GenreId
	WHERE gen.Id = 2 OR gen.Id = 4;

SELECT
	alb.Title,
	alb.Id
FROM Album alb
	LEFT JOIN Song song ON alb.Id = song.AlbumId
	WHERE song.AlbumId IS NULL;

INSERT INTO Artist (ArtistName, YearEstablished) VALUES ('Ludovico Einaudi', '1986');

INSERT INTO Album (Title, ReleaseDate, AlbumLength, [Label], ArtistId, GenreId) VALUES ('Divenire', '11/07/2006', 3744, 'No Idea', 29, 10);

INSERT INTO Song ( Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId ) VALUES ( 'Uno', 227, '11/07/2006', 10, 29, 23 )
INSERT INTO Song ( Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId ) VALUES ( 'Divenire', 406, '11/07/2006', 10, 29, 23 )
INSERT INTO Song ( Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId ) VALUES ( 'Monday', 372, '11/07/2006', 10, 29, 23 )

SELECT
	song.Title,
	alb.Title,
	art.ArtistName
FROM Album alb
	LEFT JOIN Song song ON song.AlbumId = alb.Id
	LEFT JOIN Artist art ON art.Id = song.ArtistId
	WHERE song.ArtistId = 29;

SELECT
	album.Title,
	COUNT(song.Id) AS 'Song Count'
FROM Album album
JOIN Song song ON song.AlbumId = album.Id
GROUP BY (album.Title)

SELECT 
	artist.ArtistName, 
	Count(song.Id) AS 'Song Count'
FROM Artist artist
JOIN Song song ON song.ArtistId = artist.Id
GROUP BY (artist.ArtistName);

SELECT 
	genre.Label, 
	Count(song.Id) AS 'Song Count'
FROM Genre genre
LEFT JOIN Song song ON song.GenreId = genre.Id
GROUP BY (genre.Label);

SELECT DISTINCT
	artist.ArtistName
FROM Artist artist
JOIN Album album ON album.ArtistId = artist.Id
GROUP BY artist.ArtistName HAVING COUNT(Label) > 1; 

SELECT 
	album.Title,
	album.AlbumLength
FROM Album album
	WHERE album.AlbumLength =
	(
	SELECT MAX(AlbumLength) FROM album);

SELECT 
	song.Title,
	song.SongLength,
	album.Title
FROM Song song
	JOIN Album album ON song.AlbumId = album.Id
	WHERE song.SongLength =
	(
	SELECT MAX(SongLength) FROM song);
	