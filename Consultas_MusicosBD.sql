Use MUSICOS_BD

INSERT INTO ARTISTAS VALUES(21, 'Andre Matos', '1971-09-14', 'De los fundadores.. '),
							(42, 'Edu Falaschi', '1972/05/18', '...Exvocalista de .. ahora...'),
							(84, 'Fabio Lione', '1973/10/09', 'Actualmente... por ahi anda'),
							(77, 'Chuck Norris', '1934/5/7', null),
							(78, 'Ennio Morricone', '1934/5/8', 'Viene del horizonte... sigue ahi...');

INSERT INTO ALBUMES VALUES(93, 'Angels Cry', 'Victor Entertainment', 1993),
						  (94, 'Mezcla', 'Victor Entertainment', 2016),
						  (95, '4 One dollar more', 'Disquera X', 1965);
INSERT INTO ALBUMES VALUES(96, 'Pollo', 'Disquera PY', 2015);


INSERT INTO CANCIONES VALUES(1, 'carry on', 'power metal', 21),
							(2, 'rebirth', 'power metal', 42),
							(3, 'LA MUERTE TENÍA UN PRECIO', 'western xD', 78);

INSERT INTO PISTAS VALUES(94, 1, '0:5:30', 1, 21),
						 (94, 2, '0:5:30', 1, 42),
						 (94, 3, '0:5:30', 1, 84),

						 (93, 1, '0:4:30', 1, 21),
						 (93, 2, '0:4:30', 2, 42),

						 (95, 1, '0:3:30', 3, 78);

/*a
Dar los nombres y las biografías 
de los intérpretes que 
no "componen" nada.
*/
select a.nombre, a.biografia 
	FROM ARTISTAS a
	 where a.id NOT IN (select idCompositor from CANCIONES)

/*b
Dar el nombre del intérprete que
en un mismo álbum 
haya cantado canciones rancheras de
tres o más compositores distintos.

Tambien nombre del álbum y el año.
*/
select AL.nombreAlbum, AL.anno
	FROM ALBUMES AL
	INNER JOIN PISTAS P ON Al.id = P.idAlbum
	INNER JOIN ARTISTAS AR ON P.idInterprete = AR.id



/*c
Dar el nombre, disquera y duración total 
de los álbumes del 2015 
que tienen más de 10 pistas.
*/
Select al.id, al.nombreAlbum, al.disquera, 
	duracion_total = RTRIM(SUM(DATEDIFF(SECOND, '0:00:00', p.duracion))/60) +':'+RTRIM(SUM(DATEDIFF(SECOND, '0:00:00', p.duracion))%60)
	FROM ALBUMES al
		INNER JOIN PISTAS p ON al.id = p.idAlbum
		where
			al.anno > 1992
			GROUP BY al.id, al.nombreAlbum, al.disquera
		Having
			count(p.idAlbum) > 1

/*d
Dar el nombre y la fecha de nacimiento de 
los artistas que han compuesto e interpretado una 
misma cancion.
*/
select a.nombre, a.fechaNac
	from ARTISTAS a 
		INNER JOIN CANCIONES c On c.idCompositor = a.id
		INNER JOIN PISTAS p On p.idInterprete = a.id
	group by a.nombre, a.fechaNac