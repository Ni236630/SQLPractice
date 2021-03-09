SELECT * From Artist a order by a.ArtistName;

Select s.Title,
		a.ArtistName
		from Song s 
		left join artist a on s.ArtistId = a.id;

Select a.ArtistName,
		a2.Id
	from Artist a 
	inner join Album a2 on  a.Id = a2.ArtistId where a2.GenreId = 7;

Select Artist.ArtistName,
		Album.Id
from Artist 
	inner join Album  on  Artist.Id = Album.ArtistId where Album.GenreId = 4;

Select a.ArtistName,
		a2.Id
from Artist a 
	inner join Album a2 on  a.Id = a2.ArtistId where a2.GenreId = 4 or a2.GenreId = 2 ;

Select a.Title
	from Album a
	left join Song s on a.Id = s.AlbumId where  s.AlbumId is null;

insert into Artist Values ('The Time', 1981); 

select * from Artist;

insert into Album values ('Ice Cream Castle', 1984, 2280, 'Warner Bros', 28, 7);
select * from Album;

insert into Song values ('Ice Cream Castles', 360, 1984, 7, 28, 23 );
select *  from Song where Song.Title = 'Ice Cream Castles';

SELECT Artist.ArtistName, Album.Title, Song.Title 
	FROM Album  
		Left JOIN Song  
			ON Song.AlbumId = Album.Id
		left JOIN Artist
			on Album.ArtistId = Artist.Id
				Where Album.Title = 'Ice Cream Castle' and Artist.ArtistName = 'The Time';

Select  count(Song.AlbumId), Album.Title From Album left join Song on Album.Id = Song.AlbumId group by Album.Title;

Select  count(Song.ArtistId), Artist.ArtistName from Artist left join Song on Artist.Id = Song.ArtistId group by Artist.ArtistName;

Select  count(Song.GenreId), Genre.Label from Genre left join Song on Genre.Id = Song.GenreId group by Genre.Label;

Select count(Album.Label), Artist.ArtistName from Artist left join Album on Artist.Id = Album.ArtistId group by Artist.ArtistName having(count(Album.Label))> 1;

Select max(Album.AlbumLength) as LongestAlbum from Album;