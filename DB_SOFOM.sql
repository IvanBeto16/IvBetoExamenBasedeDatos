CREATE DATABASE DB_SofomSW

USE DB_SofomSW

CREATE TABLE Region(
IdRegion INT PRIMARY KEY IDENTITY(1,1),
NombreTipo VARCHAR(60)
)


INSERT INTO Region VALUES('Mundos del Nucleo')
INSERT INTO Region VALUES('Borde Exterior')
INSERT INTO Region VALUES('Borde Medio')

SELECT * FROM Region


CREATE TABLE Planeta(
IdPlaneta INT PRIMARY KEY IDENTITY(1,1),
NombrePlaneta VARCHAR(50),
IdRegion INT FOREIGN KEY REFERENCES Region(IdRegion)
)

INSERT INTO Planeta VALUES('Dantooine',2)
INSERT INTO Planeta VALUES('Honoghr',2)
INSERT INTO Planeta VALUES('Corellia',1)
INSERT INTO Planeta VALUES('Kashyyk',1)
INSERT INTO Planeta VALUES('Chandrila',1)
INSERT INTO Planeta VALUES('Tatooine',2)
INSERT INTO Planeta VALUES('Alderaan',1)
INSERT INTO Planeta VALUES('Haruun Kal',3)


CREATE TABLE Especie(
IdEspecie INT PRIMARY KEY IDENTITY(1,1),
NombreEspecie VARCHAR(30)
)

INSERT INTO Especie VALUES('Ewok')
INSERT INTO Especie VALUES('Hutt')
INSERT INTO Especie VALUES('Jawa')
INSERT INTO Especie VALUES('Humano')
INSERT INTO Especie VALUES('Umbarano')
INSERT INTO Especie VALUES('Nautolano')
INSERT INTO Especie VALUES('Kel Dor')
INSERT INTO Especie VALUES('Ortolano')
INSERT INTO Especie VALUES('Wookie')
INSERT INTO Especie VALUES('Especie de Yoda')

CREATE TABLE Rango(
IdRango INT PRIMARY KEY IDENTITY(1,1),
NombreRango VARCHAR(30)
)

INSERT INTO Rango VALUES('Iniciado')
INSERT INTO Rango VALUES('Padawan')
INSERT INTO Rango VALUES('Caballero')
INSERT INTO Rango VALUES('Maestro')


CREATE TABLE MiembroOrden(
IdMiembro INT PRIMARY KEY IDENTITY(1,1),
Nombre VARCHAR(60),
IdEspecie INT FOREIGN KEY REFERENCES Especie(IdEspecie),
IdPlaneta INT FOREIGN KEY REFERENCES Planeta(IdPlaneta),
IdRango INT FOREIGN KEY REFERENCES Rango(IdRango),
Midiclorianos INT,
Edad INT
)

INSERT INTO MiembroOrden VALUES('Tyvokka',9,4,4,8750,90)
INSERT INTO MiembroOrden VALUES('Yoda',	10,5,4,17700,900)
INSERT INTO MiembroOrden VALUES('Anakin Skywalker',4,6,2,27700,23)
INSERT INTO MiembroOrden VALUES('Kam Solusar',3,1,1,10100,3)
INSERT INTO MiembroOrden VALUES('Plo Koon',7,2,4,11100,170)
INSERT INTO MiembroOrden VALUES('Obi-Wan Kenobi',4,6,3,13400,46)
INSERT INTO MiembroOrden VALUES('Mace Windu',4,8,4,12000,75)
INSERT INTO MiembroOrden VALUES('Mara Jade',5,3,2,11000,21)
INSERT INTO MiembroOrden VALUES('Padme Amidala',4,4,2,9700,28)
INSERT INTO MiembroOrden VALUES('Aenon Jurtis',6,2,3,19000,34)
INSERT INTO MiembroOrden VALUES('Kana Jinis',7,6,2,17900,301)
INSERT INTO MiembroOrden VALUES('Aleco Stusea',8,8,3,18100,500)
INSERT INTO MiembroOrden VALUES('Kavar',6,6,1,17800,25)


/*Consulta Nombre de los miembros del Consejo Jedi (Rangos Caballero y Maestro)*/
SELECT MiembroOrden.Nombre, Rango.NombreRango
FROM MiembroOrden
INNER JOIN Rango 
ON MiembroOrden.IdRango = Rango.IdRango 
WHERE MiembroOrden.IdRango >= 3


/*Consulta de los miembros de la orden que proceden de sistemas que se encuentran 
más allá del límite exterior de la república.*/
SELECT MiembroOrden.Nombre,
		Planeta.NombrePlaneta,
		Rango.NombreRango,
		MiembroOrden.Midiclorianos,
		MiembroOrden.Edad,
		Region.NombreTipo
FROM MiembroOrden 
INNER JOIN Planeta ON MiembroOrden.IdPlaneta = Planeta.IdPlaneta
INNER JOIN Rango ON MiembroOrden.IdRango = Rango.IdRango
INNER JOIN Region ON Planeta.IdRegion = Region.IdRegion
WHERE Region.IdRegion = 2


/*Consulta miembros de la orden que procedentes de Tatooine tienen un nivel 
de midiciorianos mayor que el maestro Yoda.*/
SELECT MiembroOrden.Nombre, MiembroOrden.Midiclorianos, Planeta.NombrePlaneta 
FROM MiembroOrden
JOIN Planeta ON
MiembroOrden.IdPlaneta = Planeta.IdPlaneta
WHERE Planeta.IdPlaneta = 6
AND Midiclorianos > (SELECT Midiclorianos 
						FROM MiembroOrden 
						WHERE Nombre LIKE 'Yoda')

SELECT * FROM Region

SELECT * FROM MiembroOrden
WHERE IdRango BETWEEN 1 AND 2

SELECT * FROM MiembroOrden
WHERE IdRango BETWEEN 3 AND 4


CREATE TABLE SistemaEstelar(
IdSistema INT PRIMARY KEY IDENTITY(1,1),
NombreSistema VARCHAR(50),
IdRegion INT FOREIGN KEY REFERENCES Region(IdRegion)
)

INSERT INTO SistemaEstelar VALUES('Sistema Coruscant',1)
INSERT INTO SistemaEstelar VALUES('Sistema Kashyyyk',3)
INSERT INTO SistemaEstelar VALUES('Sistema Eberon',3)
INSERT INTO SistemaEstelar VALUES('Sistema Metellos',1)
INSERT INTO SistemaEstelar VALUES('Sistema Arkanis',2)
INSERT INTO SistemaEstelar VALUES('Sistema Tatoo',2)

SELECT * FROM MiembroOrden
WHERE IdRango BETWEEN 3 AND 4

SELECT SistemaEstelar.NombreSistema, Region.NombreTipo 
FROM SistemaEstelar JOIN Region ON SistemaEstelar.IdRegion = Region.IdRegion


CREATE TABLE MaestroJedi(
IdMaestro INT PRIMARY KEY IDENTITY(1,1),
IdMiembro INT FOREIGN KEY REFERENCES MiembroOrden(IdMiembro),
IdSistema INT FOREIGN KEY REFERENCES SistemaEstelar(IdSistema)
)

CREATE TABLE Padawan(
IdPadawan INT FOREIGN KEY REFERENCES MiembroOrden(IdMiembro),
IdMaestro INT FOREIGN KEY REFERENCES MaestroJedi(IdMaestro),
PRIMARY KEY(IdPadawan,IdMaestro)
)


INSERT INTO MaestroJedi VALUES('1',4)
INSERT INTO MaestroJedi VALUES('2',2)
INSERT INTO MaestroJedi VALUES('5',3)
INSERT INTO MaestroJedi VALUES('6',5)
INSERT INTO MaestroJedi VALUES('7',1)
INSERT INTO MaestroJedi VALUES('10',2)
INSERT INTO MaestroJedi VALUES('12',6)


INSERT INTO Padawan VALUES(3,6)
INSERT INTO Padawan VALUES(11,2)
INSERT INTO Padawan VALUES(8,2)
INSERT INTO Padawan VALUES(9,5)

SELECT Padawan.IdPadawan, 
       (SELECT Nombre FROM MiembroOrden WHERE IdMiembro = MaestroJedi.IdMiembro) AS NombreMaestroJedi,
       (SELECT Nombre FROM MiembroOrden WHERE IdMiembro = Padawan.IdPadawan) AS NombrePadawan
FROM Padawan
INNER JOIN MaestroJedi ON Padawan.IdMaestro = MaestroJedi.IdMaestro
WHERE Padawan.IdMaestro = 2;

/*Consulta de Padawans que tiene asignados el maestro Yoda*/
SELECT MiembroOrden.Nombre AS NombrePadawan,MiembroOrden.Edad,Rango.NombreRango,MaestroJedi.IdMaestro,
	(SELECT Nombre FROM MiembroOrden WHERE IdMiembro = MaestroJedi.IdMiembro) AS NombreMaestro
FROM MiembroOrden
INNER JOIN Rango ON MiembroOrden.IdRango = Rango.IdRango
INNER JOIN Padawan ON MiembroOrden.IdMiembro = Padawan.IdPadawan
INNER JOIN MaestroJedi ON MaestroJedi.IdMaestro = Padawan.IdMaestro 
WHERE Padawan.IdMaestro = 2 


/*Consulta informe sobre Caballeros que pelean en sistemas amenazados*/
SELECT MiembroOrden.Nombre AS Caballero, 
		Rango.NombreRango AS RangoMaestro,
		SistemaEstelar.NombreSistema AS 'Sistema en el que combate'
FROM MiembroOrden
INNER JOIN MaestroJedi ON MiembroOrden.IdMiembro = MaestroJedi.IdMiembro
INNER JOIN Rango ON MiembroOrden.IdRango = Rango.IdRango
INNER JOIN SistemaEstelar ON MaestroJedi.IdSistema = SistemaEstelar.IdSistema
ORDER BY MiembroOrden.Nombre ASC

CREATE PROCEDURE InformeJedi
AS
	
	/*Consulta informe sobre Caballeros que pelean en sistemas amenazados*/
	SELECT MiembroOrden.Nombre AS Caballero, 
			Rango.NombreRango AS RangoMaestro,
			SistemaEstelar.NombreSistema AS 'Sistema en el que combate'
	FROM MiembroOrden
	INNER JOIN MaestroJedi ON MiembroOrden.IdMiembro = MaestroJedi.IdMiembro
	INNER JOIN Rango ON MiembroOrden.IdRango = Rango.IdRango
	INNER JOIN SistemaEstelar ON MaestroJedi.IdSistema = SistemaEstelar.IdSistema
	ORDER BY MiembroOrden.Nombre ASC


InformeJedi