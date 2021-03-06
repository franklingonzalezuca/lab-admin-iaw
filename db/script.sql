USE [master]
GO
/****** Object:  Database [laboratorio]    Script Date: 29/09/2021 23:05:22 ******/
CREATE DATABASE [laboratorio]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'laboratorio', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\laboratorio.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'laboratorio_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\laboratorio_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [laboratorio] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [laboratorio].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [laboratorio] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [laboratorio] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [laboratorio] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [laboratorio] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [laboratorio] SET ARITHABORT OFF 
GO
ALTER DATABASE [laboratorio] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [laboratorio] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [laboratorio] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [laboratorio] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [laboratorio] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [laboratorio] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [laboratorio] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [laboratorio] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [laboratorio] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [laboratorio] SET  DISABLE_BROKER 
GO
ALTER DATABASE [laboratorio] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [laboratorio] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [laboratorio] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [laboratorio] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [laboratorio] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [laboratorio] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [laboratorio] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [laboratorio] SET RECOVERY FULL 
GO
ALTER DATABASE [laboratorio] SET  MULTI_USER 
GO
ALTER DATABASE [laboratorio] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [laboratorio] SET DB_CHAINING OFF 
GO
ALTER DATABASE [laboratorio] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [laboratorio] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [laboratorio] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [laboratorio] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'laboratorio', N'ON'
GO
ALTER DATABASE [laboratorio] SET QUERY_STORE = OFF
GO
USE [laboratorio]
GO
/****** Object:  Table [dbo].[carrera]    Script Date: 29/09/2021 23:05:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[carrera](
	[idCarrera] [int] IDENTITY(1,1) NOT NULL,
	[idFacultad] [int] NOT NULL,
	[descripcion] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_carrera] PRIMARY KEY CLUSTERED 
(
	[idCarrera] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[estadoReservacion]    Script Date: 29/09/2021 23:05:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estadoReservacion](
	[idEstadoReservacion] [int] IDENTITY(1,1) NOT NULL,
	[nombreEstado] [nvarchar](50) NOT NULL,
	[activo] [int] NULL,
 CONSTRAINT [PK_estado] PRIMARY KEY CLUSTERED 
(
	[idEstadoReservacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[estudiante]    Script Date: 29/09/2021 23:05:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estudiante](
	[idEstudiante] [int] IDENTITY(1,1) NOT NULL,
	[nombreEstudiante] [nvarchar](100) NOT NULL,
	[apellidoEstudiante] [nvarchar](100) NOT NULL,
	[idGenero] [int] NOT NULL,
	[idCarrera] [int] NOT NULL,
	[añoCurso] [int] NOT NULL,
	[email] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_estudiante] PRIMARY KEY CLUSTERED 
(
	[idEstudiante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[facultad]    Script Date: 29/09/2021 23:05:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[facultad](
	[idFacultad] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_facultad] PRIMARY KEY CLUSTERED 
(
	[idFacultad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[genero]    Script Date: 29/09/2021 23:05:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[genero](
	[idGenero] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_genero] PRIMARY KEY CLUSTERED 
(
	[idGenero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[horario]    Script Date: 29/09/2021 23:05:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[horario](
	[idHorario] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_horario] PRIMARY KEY CLUSTERED 
(
	[idHorario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[laboratorio]    Script Date: 29/09/2021 23:05:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[laboratorio](
	[idLaboratorio] [int] IDENTITY(1,1) NOT NULL,
	[nombreLaboratorio] [nvarchar](50) NOT NULL,
	[activo] [int] NOT NULL,
 CONSTRAINT [PK_laboratorio] PRIMARY KEY CLUSTERED 
(
	[idLaboratorio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[opcion]    Script Date: 29/09/2021 23:05:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[opcion](
	[idOpcion] [int] IDENTITY(1,1) NOT NULL,
	[nombreOpcion] [nvarchar](100) NOT NULL,
	[descripcionOpcion] [nvarchar](100) NOT NULL,
	[estadoOpcion] [int] NOT NULL,
 CONSTRAINT [PK_opcion] PRIMARY KEY CLUSTERED 
(
	[idOpcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reservacion]    Script Date: 29/09/2021 23:05:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reservacion](
	[idReservacion] [int] IDENTITY(1,1) NOT NULL,
	[observacion] [nvarchar](100) NULL,
	[idLaboratorio] [int] NOT NULL,
	[idUsuario] [int] NOT NULL,
	[idEstudiante] [int] NOT NULL,
	[horaEntrada] [time](7) NOT NULL,
	[horaSalida] [time](7) NOT NULL,
	[idTipoReservacion] [int] NOT NULL,
	[idEstadoReservacion] [int] NOT NULL,
	[idHorario] [int] NOT NULL,
	[fechaReservacion] [date] NOT NULL,
 CONSTRAINT [PK_reservacion] PRIMARY KEY CLUSTERED 
(
	[idReservacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rol]    Script Date: 29/09/2021 23:05:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rol](
	[idRol] [int] IDENTITY(1,1) NOT NULL,
	[nombreRol] [nvarchar](50) NOT NULL,
	[descripcion] [nvarchar](100) NULL,
	[estado] [int] NOT NULL,
 CONSTRAINT [PK_rol] PRIMARY KEY CLUSTERED 
(
	[idRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rolOpcion]    Script Date: 29/09/2021 23:05:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rolOpcion](
	[idRolOpcion] [int] IDENTITY(1,1) NOT NULL,
	[idOpcion] [int] NOT NULL,
	[idRol] [int] NOT NULL,
 CONSTRAINT [PK_rolopcion] PRIMARY KEY CLUSTERED 
(
	[idRolOpcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipoReservacion]    Script Date: 29/09/2021 23:05:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipoReservacion](
	[idTipoReservacion] [int] IDENTITY(1,1) NOT NULL,
	[nombreReservacion] [nvarchar](50) NOT NULL,
	[descripcion] [nvarchar](200) NOT NULL,
	[activo] [int] NOT NULL,
 CONSTRAINT [PK_tipoReservacion] PRIMARY KEY CLUSTERED 
(
	[idTipoReservacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 29/09/2021 23:05:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[nombres] [nvarchar](50) NOT NULL,
	[apellidos] [nvarchar](50) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[pwd] [nvarchar](500) NOT NULL,
	[estado] [int] NOT NULL,
	[idGenero] [int] NOT NULL,
 CONSTRAINT [PK_usuario] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuarioRol]    Script Date: 29/09/2021 23:05:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarioRol](
	[idUsuarioRol] [int] IDENTITY(1,1) NOT NULL,
	[idUsuario] [int] NOT NULL,
	[idRol] [int] NOT NULL,
 CONSTRAINT [PK_usuarioRol] PRIMARY KEY CLUSTERED 
(
	[idUsuarioRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[carrera]  WITH CHECK ADD  CONSTRAINT [FK_carrera_facultad] FOREIGN KEY([idFacultad])
REFERENCES [dbo].[facultad] ([idFacultad])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[carrera] CHECK CONSTRAINT [FK_carrera_facultad]
GO
ALTER TABLE [dbo].[estudiante]  WITH CHECK ADD  CONSTRAINT [FK_estudiante_carrera] FOREIGN KEY([idCarrera])
REFERENCES [dbo].[carrera] ([idCarrera])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[estudiante] CHECK CONSTRAINT [FK_estudiante_carrera]
GO
ALTER TABLE [dbo].[estudiante]  WITH CHECK ADD  CONSTRAINT [FK_estudiante_genero] FOREIGN KEY([idGenero])
REFERENCES [dbo].[genero] ([idGenero])
GO
ALTER TABLE [dbo].[estudiante] CHECK CONSTRAINT [FK_estudiante_genero]
GO
ALTER TABLE [dbo].[reservacion]  WITH CHECK ADD  CONSTRAINT [FK_reservacion_estado] FOREIGN KEY([idEstadoReservacion])
REFERENCES [dbo].[estadoReservacion] ([idEstadoReservacion])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[reservacion] CHECK CONSTRAINT [FK_reservacion_estado]
GO
ALTER TABLE [dbo].[reservacion]  WITH CHECK ADD  CONSTRAINT [FK_reservacion_estudiante] FOREIGN KEY([idEstudiante])
REFERENCES [dbo].[estudiante] ([idEstudiante])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[reservacion] CHECK CONSTRAINT [FK_reservacion_estudiante]
GO
ALTER TABLE [dbo].[reservacion]  WITH CHECK ADD  CONSTRAINT [FK_reservacion_horario] FOREIGN KEY([idHorario])
REFERENCES [dbo].[horario] ([idHorario])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[reservacion] CHECK CONSTRAINT [FK_reservacion_horario]
GO
ALTER TABLE [dbo].[reservacion]  WITH CHECK ADD  CONSTRAINT [FK_reservacion_laboratorio] FOREIGN KEY([idLaboratorio])
REFERENCES [dbo].[laboratorio] ([idLaboratorio])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[reservacion] CHECK CONSTRAINT [FK_reservacion_laboratorio]
GO
ALTER TABLE [dbo].[reservacion]  WITH CHECK ADD  CONSTRAINT [FK_reservacion_tipoReservacion] FOREIGN KEY([idTipoReservacion])
REFERENCES [dbo].[tipoReservacion] ([idTipoReservacion])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[reservacion] CHECK CONSTRAINT [FK_reservacion_tipoReservacion]
GO
ALTER TABLE [dbo].[reservacion]  WITH CHECK ADD  CONSTRAINT [FK_reservacion_usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[usuario] ([idUsuario])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[reservacion] CHECK CONSTRAINT [FK_reservacion_usuario]
GO
ALTER TABLE [dbo].[rolOpcion]  WITH CHECK ADD  CONSTRAINT [FK_rolOpcion_opcion] FOREIGN KEY([idOpcion])
REFERENCES [dbo].[opcion] ([idOpcion])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[rolOpcion] CHECK CONSTRAINT [FK_rolOpcion_opcion]
GO
ALTER TABLE [dbo].[rolOpcion]  WITH CHECK ADD  CONSTRAINT [FK_rolOpcion_rol] FOREIGN KEY([idRol])
REFERENCES [dbo].[rol] ([idRol])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[rolOpcion] CHECK CONSTRAINT [FK_rolOpcion_rol]
GO
ALTER TABLE [dbo].[usuario]  WITH CHECK ADD  CONSTRAINT [FK_usuario_genero] FOREIGN KEY([idGenero])
REFERENCES [dbo].[genero] ([idGenero])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[usuario] CHECK CONSTRAINT [FK_usuario_genero]
GO
ALTER TABLE [dbo].[usuarioRol]  WITH CHECK ADD  CONSTRAINT [FK_usuarioRol_rol] FOREIGN KEY([idRol])
REFERENCES [dbo].[rol] ([idRol])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[usuarioRol] CHECK CONSTRAINT [FK_usuarioRol_rol]
GO
ALTER TABLE [dbo].[usuarioRol]  WITH CHECK ADD  CONSTRAINT [FK_usuarioRol_usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[usuario] ([idUsuario])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[usuarioRol] CHECK CONSTRAINT [FK_usuarioRol_usuario]
GO
/****** Object:  StoredProcedure [dbo].[BuscarEstudiantePorCantidadDeReservas]    Script Date: 29/09/2021 23:05:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE 
	  PROCEDURE [dbo].[BuscarEstudiantePorCantidadDeReservas] @Cant INT AS SELECT
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
/****** Object:  StoredProcedure [dbo].[BuscarPorCarrera]    Script Date: 29/09/2021 23:05:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE 
	  PROCEDURE [dbo].[BuscarPorCarrera] @Carrera VARCHAR(50) AS SELECT
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
/****** Object:  StoredProcedure [dbo].[BuscarPorFacultad]    Script Date: 29/09/2021 23:05:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE 
	  PROCEDURE [dbo].[BuscarPorFacultad] @Facultad VARCHAR(50) AS SELECT
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
/****** Object:  StoredProcedure [dbo].[BuscarPorFecha]    Script Date: 29/09/2021 23:05:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BuscarPorFecha] @Fecha DATE AS SELECT
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
/****** Object:  StoredProcedure [dbo].[BuscarPorGenero]    Script Date: 29/09/2021 23:05:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE 
	  PROCEDURE [dbo].[BuscarPorGenero] @Genero VARCHAR(50) AS SELECT
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
/****** Object:  StoredProcedure [dbo].[BuscarPorHora]    Script Date: 29/09/2021 23:05:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE 
	  PROCEDURE [dbo].[BuscarPorHora] @Hora TIME AS SELECT
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
	INNER JOIN dbo.genero ON dbo.estudiante.idGenero LIKE dbo.genero.idGenero
WHERE
	dbo.reservacion.horaEntrada = @Hora
GO
/****** Object:  StoredProcedure [dbo].[BuscarPorMes]    Script Date: 29/09/2021 23:05:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE 
	  PROCEDURE [dbo].[BuscarPorMes] @Mes VARCHAR ( 50 ) AS SELECT
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
/****** Object:  StoredProcedure [dbo].[BuscarPorUsuario]    Script Date: 29/09/2021 23:05:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE 
	  PROCEDURE [dbo].[BuscarPorUsuario] @Usuario VARCHAR(50) AS SELECT
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
	dbo.usuario.nombres >= @Usuario OR dbo.usuario.apellidos >= @Usuario OR dbo.usuario.username >= @Usuario
GO
USE [master]
GO
ALTER DATABASE [laboratorio] SET  READ_WRITE 
GO
