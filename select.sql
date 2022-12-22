-- количество исполнителей в каждом жанре;
SELECT genre_name, count(artist_id) FROM artist_by_genre AS ag
JOIN genre g ON g.genre_id = ag.genre_id
GROUP BY genre_name;

--количество треков, вошедших в альбомы 2019-2020 годов;
SELECT album_name, album_year, count(song_id) FROM album a
JOIN album_songs s ON s.album_id = a.album_id
WHERE album_year BETWEEN 2019 AND 2020
GROUP BY album_name, album_year;

--средняя продолжительность треков по каждому альбому;
SELECT album_name, avg(song_length) FROM album a
JOIN album_songs s ON s.album_id = a.album_id 
GROUP BY album_name;

--все исполнители, которые не выпустили альбомы в 2020 году;
SELECT artist_name FROM album_by_artist aba 
JOIN artist a ON a.artist_id = aba.artist_id
JOIN album al ON al.album_id = aba.album_id
EXCEPT 
SELECT artist_name FROM album_by_artist aba2 
JOIN artist a1 ON a1.artist_id = aba2.artist_id
JOIN album al1 ON al1.album_id = aba2.album_id
WHERE album_year = 2020;

--названия сборников, в которых присутствует конкретный исполнитель (выберите сами);
SELECT compilation_name, song_name, artist_name FROM songs_in_compilations sic 
JOIN compilation c ON c.compilation_id = sic.compilation_id 
JOIN album_songs s ON s.song_id = sic.song_id 
JOIN album_by_artist aba ON aba.album_id = s.album_id 
JOIN artist a ON a.artist_id = aba.artist_id 
WHERE artist_name LIKE 'Miles Davis';

--название альбомов, в которых присутствуют исполнители более 1 жанра;
SELECT album_name FROM album a 
JOIN album_by_artist aba ON a.album_id = aba.album_id 
JOIN artist_by_genre abg ON aba.artist_id = abg.artist_id
GROUP BY album_name 
HAVING count(genre_id) > 1;

--наименование треков, которые не входят в сборники;
SELECT song_name FROM album_songs s
EXCEPT
SELECT song_name FROM album_songs as2
JOIN songs_in_compilations sic ON as2.song_id = sic.song_id;

--исполнителя(-ей), написавшего самый короткий по продолжительности трек (теоретически таких треков может быть несколько);
SELECT artist_name, song_name, song_length FROM artist a
JOIN album_by_artist aba ON aba.artist_id = a.artist_id 
JOIN album_songs s ON s.album_id = aba.album_id 
WHERE song_length = (SELECT min(song_length) FROM album_songs);

--название альбомов, содержащих наименьшее количество треков.
SELECT album_name an, count(song_id) as c1 FROM album_songs as3
JOIN album a ON a.album_id = as3.album_id 
GROUP BY album_name
HAVING count(song_id) =
	(SELECT count(song_id) c1 FROM album_songs as2
	JOIN album a ON a.album_id = as2.album_id
	GROUP BY a.album_id
	ORDER BY c1 ASC
	LIMIT 1);