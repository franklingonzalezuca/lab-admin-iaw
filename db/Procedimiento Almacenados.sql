CREATE PROCEDURE BuscarPorFecha @Fecha DATE AS SELECT
dbo.laboratorio.nombreLaboratorio AS Laboratorio,
CONCAT ( dbo.estudiante.nombreEstudiante, ' ', dbo.estudiante.apellidoEstudiante ) AS Estudiante,
dbo.carrera.descripcion AS Carrera,
dbo.facultad.descripcion AS Facultad,
dbo.reservacion.observacion AS [Observaciones de la reservación],
dbo.reservacion.horaEntrada AS [Hora de entrada],
dbo.reservacion.horaSalida AS [Hora de salida],
dbo.reservacion.fechaReservacion AS [Fecha de reservación],
CONCAT ( dbo.usuario.nombres, ' ', dbo.usuario.apellidos ) AS Creador 
FROM
	dbo.estudiante
	INNER JOIN dbo.reservacion ON dbo.estudiante.idEstudiante = dbo.reservacion.idEstudiante
	INNER JOIN dbo.usuario ON dbo.reservacion.idUsuario = dbo.usuario.idUsuario
	INNER JOIN dbo.carrera ON dbo.estudiante.idCarrera = dbo.carrera.idCarrera
	INNER JOIN dbo.facultad ON dbo.carrera.idFacultad = dbo.facultad.idFacultad
	INNER JOIN dbo.laboratorio ON dbo.reservacion.idLaboratorio = dbo.laboratorio.idLaboratorio 
WHERE
	dbo.reservacion.fechaReservacion = @Fecha 
GO
	;
CREATE 
	OR ALTER PROCEDURE BuscarPorMes @Mes VARCHAR ( 50 ) AS SELECT
	dbo.laboratorio.nombreLaboratorio AS Laboratorio,
	CONCAT ( dbo.estudiante.nombreEstudiante, ' ', dbo.estudiante.apellidoEstudiante ) AS Estudiante,
	dbo.genero.descripcion AS [Género],
	dbo.carrera.descripcion AS Carrera,
	dbo.facultad.descripcion AS Facultad,
	dbo.reservacion.observacion AS [Observaciones de la reservación],
	dbo.reservacion.horaEntrada AS [Hora de entrada],
	dbo.reservacion.horaSalida AS [Hora de salida],
	dbo.reservacion.fechaReservacion AS [Fecha de reservación],
	CONCAT ( dbo.usuario.nombres, ' ', dbo.usuario.apellidos ) AS Creador 
FROM
	dbo.estudiante
	INNER JOIN dbo.reservacion ON dbo.estudiante.idEstudiante = dbo.reservacion.idEstudiante
	INNER JOIN dbo.usuario ON dbo.reservacion.idUsuario = dbo.usuario.idUsuario
	INNER JOIN dbo.carrera ON dbo.estudiante.idCarrera = dbo.carrera.idCarrera
	INNER JOIN dbo.facultad ON dbo.carrera.idFacultad = dbo.facultad.idFacultad
	INNER JOIN dbo.laboratorio ON dbo.reservacion.idLaboratorio = dbo.laboratorio.idLaboratorio
	INNER JOIN dbo.genero ON dbo.estudiante.idGenero = dbo.genero.idGenero 
WHERE
	FORMAT ( dbo.reservacion.fechaReservacion, 'MM' ) = @Mes 
GO
	;
CREATE 
	OR ALTER PROCEDURE BuscarPorHora @Hora TIME AS SELECT
	dbo.laboratorio.nombreLaboratorio AS Laboratorio,
	CONCAT ( dbo.estudiante.nombreEstudiante, ' ', dbo.estudiante.apellidoEstudiante ) AS Estudiante,
	dbo.genero.descripcion AS [Género],
	dbo.carrera.descripcion AS Carrera,
	dbo.facultad.descripcion AS Facultad,
	dbo.reservacion.observacion AS [Observaciones de la reservación],
	dbo.reservacion.horaEntrada AS [Hora de entrada],
	dbo.reservacion.horaSalida AS [Hora de salida],
	dbo.reservacion.fechaReservacion AS [Fecha de reservación],
	CONCAT ( dbo.usuario.nombres, ' ', dbo.usuario.apellidos ) AS Creador 
FROM
	dbo.estudiante
	INNER JOIN dbo.reservacion ON dbo.estudiante.idEstudiante = dbo.reservacion.idEstudiante
	INNER JOIN dbo.usuario ON dbo.reservacion.idUsuario = dbo.usuario.idUsuario
	INNER JOIN dbo.carrera ON dbo.estudiante.idCarrera = dbo.carrera.idCarrera
	INNER JOIN dbo.facultad ON dbo.carrera.idFacultad = dbo.facultad.idFacultad
	INNER JOIN dbo.laboratorio ON dbo.reservacion.idLaboratorio = dbo.laboratorio.idLaboratorio
	INNER JOIN dbo.genero ON dbo.estudiante.idGenero = dbo.genero.idGenero 
WHERE
	dbo.reservacion.horaEntrada = @Hora 
GO
	;
CREATE 
	OR ALTER PROCEDURE BuscarPorGenero @Genero VARCHAR ( 50 ) AS SELECT
	dbo.laboratorio.nombreLaboratorio AS Laboratorio,
	CONCAT ( dbo.estudiante.nombreEstudiante, ' ', dbo.estudiante.apellidoEstudiante ) AS Estudiante,
	dbo.genero.descripcion AS [Género],
	dbo.carrera.descripcion AS Carrera,
	dbo.facultad.descripcion AS Facultad,
	dbo.reservacion.observacion AS [Observaciones de la reservación],
	dbo.reservacion.horaEntrada AS [Hora de entrada],
	dbo.reservacion.horaSalida AS [Hora de salida],
	dbo.reservacion.fechaReservacion AS [Fecha de reservación],
	CONCAT ( dbo.usuario.nombres, ' ', dbo.usuario.apellidos ) AS Creador 
FROM
	dbo.estudiante
	INNER JOIN dbo.reservacion ON dbo.estudiante.idEstudiante = dbo.reservacion.idEstudiante
	INNER JOIN dbo.usuario ON dbo.reservacion.idUsuario = dbo.usuario.idUsuario
	INNER JOIN dbo.carrera ON dbo.estudiante.idCarrera = dbo.carrera.idCarrera
	INNER JOIN dbo.facultad ON dbo.carrera.idFacultad = dbo.facultad.idFacultad
	INNER JOIN dbo.laboratorio ON dbo.reservacion.idLaboratorio = dbo.laboratorio.idLaboratorio
	INNER JOIN dbo.genero ON dbo.estudiante.idGenero = dbo.genero.idGenero 
WHERE
	dbo.genero.descripcion >= @Genero 
GO
	;
CREATE 
	OR ALTER PROCEDURE BuscarPorCarrera @Carrera VARCHAR ( 50 ) AS SELECT
	dbo.laboratorio.nombreLaboratorio AS Laboratorio,
	CONCAT ( dbo.estudiante.nombreEstudiante, ' ', dbo.estudiante.apellidoEstudiante ) AS Estudiante,
	dbo.genero.descripcion AS [Género],
	dbo.carrera.descripcion AS Carrera,
	dbo.facultad.descripcion AS Facultad,
	dbo.reservacion.observacion AS [Observaciones de la reservación],
	dbo.reservacion.horaEntrada AS [Hora de entrada],
	dbo.reservacion.horaSalida AS [Hora de salida],
	dbo.reservacion.fechaReservacion AS [Fecha de reservación],
	CONCAT ( dbo.usuario.nombres, ' ', dbo.usuario.apellidos ) AS Creador 
FROM
	dbo.estudiante
	INNER JOIN dbo.reservacion ON dbo.estudiante.idEstudiante = dbo.reservacion.idEstudiante
	INNER JOIN dbo.usuario ON dbo.reservacion.idUsuario = dbo.usuario.idUsuario
	INNER JOIN dbo.carrera ON dbo.estudiante.idCarrera = dbo.carrera.idCarrera
	INNER JOIN dbo.facultad ON dbo.carrera.idFacultad = dbo.facultad.idFacultad
	INNER JOIN dbo.laboratorio ON dbo.reservacion.idLaboratorio = dbo.laboratorio.idLaboratorio
	INNER JOIN dbo.genero ON dbo.estudiante.idGenero = dbo.genero.idGenero 
WHERE
	dbo.carrera.descripcion >= @Carrera 
GO
	;
CREATE 
	OR ALTER PROCEDURE BuscarPorFacultad @Facultad VARCHAR ( 50 ) AS SELECT
	dbo.laboratorio.nombreLaboratorio AS Laboratorio,
	CONCAT ( dbo.estudiante.nombreEstudiante, ' ', dbo.estudiante.apellidoEstudiante ) AS Estudiante,
	dbo.genero.descripcion AS [Género],
	dbo.carrera.descripcion AS Carrera,
	dbo.facultad.descripcion AS Facultad,
	dbo.reservacion.observacion AS [Observaciones de la reservación],
	dbo.reservacion.horaEntrada AS [Hora de entrada],
	dbo.reservacion.horaSalida AS [Hora de salida],
	dbo.reservacion.fechaReservacion AS [Fecha de reservación],
	CONCAT ( dbo.usuario.nombres, ' ', dbo.usuario.apellidos ) AS Creador 
FROM
	dbo.estudiante
	INNER JOIN dbo.reservacion ON dbo.estudiante.idEstudiante = dbo.reservacion.idEstudiante
	INNER JOIN dbo.usuario ON dbo.reservacion.idUsuario = dbo.usuario.idUsuario
	INNER JOIN dbo.carrera ON dbo.estudiante.idCarrera = dbo.carrera.idCarrera
	INNER JOIN dbo.facultad ON dbo.carrera.idFacultad = dbo.facultad.idFacultad
	INNER JOIN dbo.laboratorio ON dbo.reservacion.idLaboratorio = dbo.laboratorio.idLaboratorio
	INNER JOIN dbo.genero ON dbo.estudiante.idGenero = dbo.genero.idGenero 
WHERE
	dbo.facultad.descripcion >= @Facultad 
GO
	;
CREATE 
	OR ALTER PROCEDURE BuscarPorUsuario @Usuario VARCHAR ( 50 ) AS SELECT
	dbo.laboratorio.nombreLaboratorio AS Laboratorio,
	CONCAT ( dbo.estudiante.nombreEstudiante, ' ', dbo.estudiante.apellidoEstudiante ) AS Estudiante,
	dbo.genero.descripcion AS [Género],
	dbo.carrera.descripcion AS Carrera,
	dbo.facultad.descripcion AS Facultad,
	dbo.reservacion.observacion AS [Observaciones de la reservación],
	dbo.reservacion.horaEntrada AS [Hora de entrada],
	dbo.reservacion.horaSalida AS [Hora de salida],
	dbo.reservacion.fechaReservacion AS [Fecha de reservación],
	CONCAT ( dbo.usuario.nombres, ' ', dbo.usuario.apellidos ) AS Creador 
FROM
	dbo.estudiante
	INNER JOIN dbo.reservacion ON dbo.estudiante.idEstudiante = dbo.reservacion.idEstudiante
	INNER JOIN dbo.usuario ON dbo.reservacion.idUsuario = dbo.usuario.idUsuario
	INNER JOIN dbo.carrera ON dbo.estudiante.idCarrera = dbo.carrera.idCarrera
	INNER JOIN dbo.facultad ON dbo.carrera.idFacultad = dbo.facultad.idFacultad
	INNER JOIN dbo.laboratorio ON dbo.reservacion.idLaboratorio = dbo.laboratorio.idLaboratorio
	INNER JOIN dbo.genero ON dbo.estudiante.idGenero = dbo.genero.idGenero 
WHERE
	dbo.usuario.nombres >= @Usuario 
	OR dbo.usuario.apellidos >= @Usuario 
	OR dbo.usuario.username >= @Usuario 
GO
	;
CREATE 
	OR ALTER PROCEDURE BuscarEstudiantePorCantidadDeReservas @Cant INT AS SELECT
	CONCAT ( estudiante.nombreEstudiante, '', estudiante.apellidoEstudiante ) AS Estudiante,
	COUNT ( reservacion.idReservacion ) AS [Cantidad de reservaciones],
	genero.descripcion AS [Género],
	carrera.descripcion AS Carrera,
	facultad.descripcion AS Facultad 
FROM
	dbo.estudiante
	INNER JOIN dbo.reservacion ON estudiante.idEstudiante = reservacion.idEstudiante
	INNER JOIN dbo.genero ON estudiante.idGenero = genero.idGenero
	INNER JOIN dbo.carrera ON estudiante.idCarrera = carrera.idCarrera
	INNER JOIN dbo.facultad ON carrera.idFacultad = facultad.idFacultad 
GROUP BY
	estudiante.nombreEstudiante,
	estudiante.apellidoEstudiante,
	genero.descripcion,
	carrera.descripcion,
	facultad.descripcion 
HAVING
	COUNT ( reservacion.idReservacion ) = @Cant
GO
	;
EXECUTE BuscarPorFecha '2021-09-21';
EXECUTE BuscarPorMes '01';
EXECUTE BuscarPorHora '03:00';
EXECUTE BuscarPorGenero '';
EXECUTE BuscarPorCarrera 'ing';
EXECUTE BuscarPorFacultad 'cienc';
EXECUTE BuscarPorUsuario 'Jorge';
EXECUTE BuscarEstudiantePorCantidadDeReservas 1;