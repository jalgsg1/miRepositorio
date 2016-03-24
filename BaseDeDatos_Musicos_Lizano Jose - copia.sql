/*Crear la base de datos*/
Create database MUSICOS_BD

/*Elegir la base de datos para esta
  consulta*/
use MUSICOS_BD

/*Crear tabla Albumes
Campos:
		id -> es la llave primaria no nula
		nombreAlbum -> Cadena de caracteres 
		disquera -> Cadena de caracteres
		anno -> Numero decimal de 4 digitos
*/

CREATE TABLE ALBUMES(
	id int primary key not null,
	nombreAlbum varchar(50) not null,
	disquera varchar(50) not null,
	anno DECIMAL(4) not null,
)

/*Crear tabla Artistas
Campos:
		id -> es la llave primaria no nula
		nombre -> Cadena de caracteres 
		fechaNac -> Tipo fecha con formato AAAA-MM-DD
		biografia -> Cadena de caracteres, que puede
		ser nula.
*/

CREATE TABLE ARTISTAS(
	id int primary key not null,
	nombre varchar(50) not null,
	fechaNac date not null,
	/*Valor por defecto*/
	biografia varchar(50) default 'No hay datos reales del artista',
)

/*Crear tabla CANCIONES
Campos:
		id -> es la llave primaria no nula
		nombreCancion -> Cadena de caracteres 
		genero -> Cadena de caracteres
		idCompositor -> Numero entero
*/

CREATE TABLE CANCIONES(
	id int primary key not null,
	nombreCancion varchar(50) not null,
	genero varchar(50) not null,
	idCompositor int not null,
)

/*Crear tabla PISTAS
Campos:
		idAlbum -> Numero entero y llave parte de primaria compuesta
		numPista -> Numero entero y Parte de la llave primaria compuesta
		duracion -> Tipo time() con formato: hh:mm:ss(nano segundos)
		idCancion -> Numero entero
		idInterprete -> numero entero
*/

CREATE TABLE PISTAS(
	idAlbum int not null,
	numPista int not null,
	duracion time(0) not null,
	idCancion int not null,
	idInterprete int not null,

	/*Para definir ambos atributos como una llave compuesta*/
	primary key(idAlbum, numPista),
)

/* Definicion de las llaves foraneas 
Tabla por modificar
	Agregar restriccion relacional
		Quien referencia a otra tabla
			Tabla foranea o externa
*/

ALTER TABLE CANCIONES  
	WITH CHECK ADD CONSTRAINT FK_CANCIONES_idCompositor 
		FOREIGN KEY(idCompositor)
			REFERENCES ARTISTAS (id);

ALTER TABLE PISTAS
	WITH CHECK ADD CONSTRAINT FK_PISTAS_idAlbumes 
		FOREIGN KEY(idAlbum)
			REFERENCES ALBUMES(id);

ALTER TABLE PISTAS
	WITH CHECK ADD CONSTRAINT FK_PISTAS_idArtistas 
		FOREIGN KEY(idInterprete)
			REFERENCES ARTISTAS(id);

ALTER TABLE PISTAS
	WITH CHECK ADD CONSTRAINT FKFK_PISTAS_idCanciones 
		FOREIGN KEY(idCancion)
			REFERENCES CANCIONES(id);


