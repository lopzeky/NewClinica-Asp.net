USE [master]
GO
/****** Object:  Database [Clinica]    Script Date: 30-06-2023 23:11:01 ******/
CREATE DATABASE [Clinica]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Clinica', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Clinica.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Clinica_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Clinica_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Clinica] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Clinica].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Clinica] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Clinica] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Clinica] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Clinica] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Clinica] SET ARITHABORT OFF 
GO
ALTER DATABASE [Clinica] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Clinica] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Clinica] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Clinica] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Clinica] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Clinica] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Clinica] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Clinica] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Clinica] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Clinica] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Clinica] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Clinica] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Clinica] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Clinica] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Clinica] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Clinica] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Clinica] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Clinica] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Clinica] SET  MULTI_USER 
GO
ALTER DATABASE [Clinica] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Clinica] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Clinica] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Clinica] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Clinica] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Clinica] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Clinica] SET QUERY_STORE = ON
GO
ALTER DATABASE [Clinica] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Clinica]
GO
/****** Object:  Table [dbo].[Administrador]    Script Date: 30-06-2023 23:11:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Administrador](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Usuario] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](20) NOT NULL,
	[Rut] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Administrador] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Citas]    Script Date: 30-06-2023 23:11:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Citas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [date] NOT NULL,
	[Hora] [time](0) NOT NULL,
	[ID_Medico] [int] NULL,
	[ID_Secretario] [int] NULL,
	[ID_Paciente] [int] NOT NULL,
 CONSTRAINT [PK_Citas] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Especialidades]    Script Date: 30-06-2023 23:11:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Especialidades](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ID_medicos] [int] NOT NULL,
	[Especialidad] [nvarchar](20) NOT NULL,
	[Especialidad_opc] [nvarchar](20) NULL,
	[Especialidad_opc_2] [nvarchar](20) NULL,
 CONSTRAINT [PK_Especialidades] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Historial_Medico]    Script Date: 30-06-2023 23:11:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Historial_Medico](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Diagnostico] [nvarchar](500) NOT NULL,
	[Alergias] [nvarchar](200) NULL,
	[ID_Cita] [int] NOT NULL,
 CONSTRAINT [PK_Historial Medico] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicos]    Script Date: 30-06-2023 23:11:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [nvarchar](50) NOT NULL,
	[Apellidos] [nvarchar](50) NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[Rut] [nvarchar](10) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Disponible] [bit] NOT NULL,
	[Password] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Medicos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pacientes]    Script Date: 30-06-2023 23:11:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pacientes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [nvarchar](50) NOT NULL,
	[Apellidos] [nvarchar](50) NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[Rut] [nvarchar](10) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[Telefono] [int] NOT NULL,
 CONSTRAINT [PK_Pacientes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Secretarios]    Script Date: 30-06-2023 23:11:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Secretarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [nvarchar](50) NOT NULL,
	[Apellidos] [nvarchar](50) NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[Rut] [nvarchar](10) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Secretarios] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Telefonos]    Script Date: 30-06-2023 23:11:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Telefonos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ID_Medicos] [int] NOT NULL,
	[numero_Tel] [int] NOT NULL,
	[numero_Tel_OP] [int] NULL,
 CONSTRAINT [PK_Telefonos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Administrador] ON 

INSERT [dbo].[Administrador] ([id], [Usuario], [Password], [Rut]) VALUES (1, N'Super Admin', N'1234', N'19496210-k')
INSERT [dbo].[Administrador] ([id], [Usuario], [Password], [Rut]) VALUES (2, N'admin1', N'123456', N'12345678-9')
INSERT [dbo].[Administrador] ([id], [Usuario], [Password], [Rut]) VALUES (3, N'admin2', N'12345', N'98765432-1')
SET IDENTITY_INSERT [dbo].[Administrador] OFF
GO
SET IDENTITY_INSERT [dbo].[Citas] ON 

INSERT [dbo].[Citas] ([id], [Fecha], [Hora], [ID_Medico], [ID_Secretario], [ID_Paciente]) VALUES (1, CAST(N'2023-05-10' AS Date), CAST(N'15:30:00' AS Time), 1, 1, 1)
SET IDENTITY_INSERT [dbo].[Citas] OFF
GO
SET IDENTITY_INSERT [dbo].[Especialidades] ON 

INSERT [dbo].[Especialidades] ([id], [ID_medicos], [Especialidad], [Especialidad_opc], [Especialidad_opc_2]) VALUES (1, 1, N'Medicina General', N'Pediatria', NULL)
SET IDENTITY_INSERT [dbo].[Especialidades] OFF
GO
SET IDENTITY_INSERT [dbo].[Historial_Medico] ON 

INSERT [dbo].[Historial_Medico] ([id], [Diagnostico], [Alergias], [ID_Cita]) VALUES (1, N'Tos leve', N'Polen', 1)
SET IDENTITY_INSERT [dbo].[Historial_Medico] OFF
GO
SET IDENTITY_INSERT [dbo].[Medicos] ON 

INSERT [dbo].[Medicos] ([id], [Nombres], [Apellidos], [FechaNacimiento], [Rut], [Email], [Disponible], [Password]) VALUES (34, N'Ana', N'Torres', CAST(N'1991-04-25' AS Date), N'22532276-7', N'ana@example.com', 1, N'passwordghi')
INSERT [dbo].[Medicos] ([id], [Nombres], [Apellidos], [FechaNacimiento], [Rut], [Email], [Disponible], [Password]) VALUES (35, N'Andrés', N'Hernández', CAST(N'1993-07-08' AS Date), N'21557353-2', N'andres@example.com', 0, N'passworddef')
INSERT [dbo].[Medicos] ([id], [Nombres], [Apellidos], [FechaNacimiento], [Rut], [Email], [Disponible], [Password]) VALUES (36, N'Carlos', N'González', CAST(N'1988-11-05' AS Date), N'21557353-2', N'carlos@example.com', 1, N'password789')
INSERT [dbo].[Medicos] ([id], [Nombres], [Apellidos], [FechaNacimiento], [Rut], [Email], [Disponible], [Password]) VALUES (37, N'Ezequiel', N'Lopez', CAST(N'1990-01-16' AS Date), N'21557353-2', N'Ejemplo@email.com', 0, N'12345')
INSERT [dbo].[Medicos] ([id], [Nombres], [Apellidos], [FechaNacimiento], [Rut], [Email], [Disponible], [Password]) VALUES (38, N'Fernanda', N'Rojas', CAST(N'1998-08-18' AS Date), N'21557353-2', N'fernanda@example.com', 1, N'passwordpqr')
INSERT [dbo].[Medicos] ([id], [Nombres], [Apellidos], [FechaNacimiento], [Rut], [Email], [Disponible], [Password]) VALUES (39, N'Juan', N'Pérez', CAST(N'1985-06-20' AS Date), N'21557353-2', N'juan@example.com', 1, N'password123')
INSERT [dbo].[Medicos] ([id], [Nombres], [Apellidos], [FechaNacimiento], [Rut], [Email], [Disponible], [Password]) VALUES (40, N'Laura', N'Martínez', CAST(N'1995-09-30' AS Date), N'21557353-2', N'laura@example.com', 0, N'passwordabc')
INSERT [dbo].[Medicos] ([id], [Nombres], [Apellidos], [FechaNacimiento], [Rut], [Email], [Disponible], [Password]) VALUES (41, N'María', N'Sánchez', CAST(N'1992-03-12' AS Date), N'21557353-2', N'maria@example.com', 0, N'password456')
INSERT [dbo].[Medicos] ([id], [Nombres], [Apellidos], [FechaNacimiento], [Rut], [Email], [Disponible], [Password]) VALUES (42, N'Pedro', N'López', CAST(N'1987-02-14' AS Date), N'21557353-2', N'pedro@example.com', 1, N'passwordjkl')
INSERT [dbo].[Medicos] ([id], [Nombres], [Apellidos], [FechaNacimiento], [Rut], [Email], [Disponible], [Password]) VALUES (43, N'Sofía', N'Gómez', CAST(N'1994-12-01' AS Date), N'21557353-2', N'sofia@example.com', 1, N'passwordmno')
INSERT [dbo].[Medicos] ([id], [Nombres], [Apellidos], [FechaNacimiento], [Rut], [Email], [Disponible], [Password]) VALUES (45, N'Ezequiel', N'Torres', CAST(N'2023-06-23' AS Date), N'21222803-6', N'Loepz@gmail.com', 0, N'123456')
SET IDENTITY_INSERT [dbo].[Medicos] OFF
GO
SET IDENTITY_INSERT [dbo].[Pacientes] ON 

INSERT [dbo].[Pacientes] ([id], [Nombres], [Apellidos], [FechaNacimiento], [Rut], [Email], [Telefono]) VALUES (1, N'Cosme', N'Rando', CAST(N'1995-09-09' AS Date), N'19496210-k', N'email@gmail.com', 123456789)
INSERT [dbo].[Pacientes] ([id], [Nombres], [Apellidos], [FechaNacimiento], [Rut], [Email], [Telefono]) VALUES (2, N'Daniel', N'Smith', CAST(N'1991-04-25' AS Date), N'19789450-4', N'Daniel@.com', 987654321)
INSERT [dbo].[Pacientes] ([id], [Nombres], [Apellidos], [FechaNacimiento], [Rut], [Email], [Telefono]) VALUES (3, N'Sofia', N'Johnson', CAST(N'1993-07-08' AS Date), N'24185267-9', N'Sofia@.com', 123456789)
INSERT [dbo].[Pacientes] ([id], [Nombres], [Apellidos], [FechaNacimiento], [Rut], [Email], [Telefono]) VALUES (4, N'Lucas', N'Williams', CAST(N'1988-11-05' AS Date), N'4694448-8', N'Lucas@G.com', 876543210)
INSERT [dbo].[Pacientes] ([id], [Nombres], [Apellidos], [FechaNacimiento], [Rut], [Email], [Telefono]) VALUES (5, N'Gabriel', N'Lopez', CAST(N'1990-01-16' AS Date), N'7606876-3', N'Gabriel@email.com', 234567890)
INSERT [dbo].[Pacientes] ([id], [Nombres], [Apellidos], [FechaNacimiento], [Rut], [Email], [Telefono]) VALUES (6, N'Isabella', N'Davis', CAST(N'1998-08-18' AS Date), N'47954438-k', N'Isabella@email.com', 987012345)
INSERT [dbo].[Pacientes] ([id], [Nombres], [Apellidos], [FechaNacimiento], [Rut], [Email], [Telefono]) VALUES (7, N'Mateo', N'Martinez', CAST(N'1985-06-20' AS Date), N'3166568-K', N'Mateo@email.com', 678901234)
INSERT [dbo].[Pacientes] ([id], [Nombres], [Apellidos], [FechaNacimiento], [Rut], [Email], [Telefono]) VALUES (8, N'Camila', N'Taylor', CAST(N'1995-09-30' AS Date), N'17389715-4', N'Camila@email.com', 567890123)
INSERT [dbo].[Pacientes] ([id], [Nombres], [Apellidos], [FechaNacimiento], [Rut], [Email], [Telefono]) VALUES (9, N'Santiago', N'Anderson', CAST(N'1992-03-12' AS Date), N'22902920-7', N'Santiago@email.com', 901234567)
INSERT [dbo].[Pacientes] ([id], [Nombres], [Apellidos], [FechaNacimiento], [Rut], [Email], [Telefono]) VALUES (10, N'Emma', N'Moore', CAST(N'1987-02-14' AS Date), N'8399840-7', N'Emma@email.com', 345678901)
INSERT [dbo].[Pacientes] ([id], [Nombres], [Apellidos], [FechaNacimiento], [Rut], [Email], [Telefono]) VALUES (11, N'Sofía', N'Thomas', CAST(N'1994-12-01' AS Date), N'14958945-7', N'Sofia@email.com', 890123456)
SET IDENTITY_INSERT [dbo].[Pacientes] OFF
GO
SET IDENTITY_INSERT [dbo].[Secretarios] ON 

INSERT [dbo].[Secretarios] ([id], [Nombres], [Apellidos], [FechaNacimiento], [Rut], [Email], [Password]) VALUES (1, N'Clemente', N'Espinoza', CAST(N'1999-05-13' AS Date), N'19869582-3', N'Ejemplo@email.com', N'1234')
INSERT [dbo].[Secretarios] ([id], [Nombres], [Apellidos], [FechaNacimiento], [Rut], [Email], [Password]) VALUES (9, N'EzequielGabriel', N'LopezAyavire', CAST(N'2023-06-22' AS Date), N'19496210-k', N'Loepz@gmail.com', N'123456')
INSERT [dbo].[Secretarios] ([id], [Nombres], [Apellidos], [FechaNacimiento], [Rut], [Email], [Password]) VALUES (30, N'Andrea ', N'Ortega ', CAST(N'1995-04-25' AS Date), N'19789450-4', N'andrea.ortega@gmail.com', N'987654321')
INSERT [dbo].[Secretarios] ([id], [Nombres], [Apellidos], [FechaNacimiento], [Rut], [Email], [Password]) VALUES (31, N'Sergio ', N'Morales ', CAST(N'1991-07-08' AS Date), N'24185267-9', N'sergio.morales@gmail.com', N'123456789')
INSERT [dbo].[Secretarios] ([id], [Nombres], [Apellidos], [FechaNacimiento], [Rut], [Email], [Password]) VALUES (32, N'Natalia ', N'Paredes ', CAST(N'1987-11-05' AS Date), N'4694448-8', N'natalia.paredes@gmail.com', N'876543210')
INSERT [dbo].[Secretarios] ([id], [Nombres], [Apellidos], [FechaNacimiento], [Rut], [Email], [Password]) VALUES (33, N'Ricardo ', N'Mendoza ', CAST(N'1998-01-16' AS Date), N'7606876-3', N'ricardo.mendoza@gmail.com', N'234567890')
INSERT [dbo].[Secretarios] ([id], [Nombres], [Apellidos], [FechaNacimiento], [Rut], [Email], [Password]) VALUES (34, N'Carolina ', N'Sánchez ', CAST(N'1991-08-18' AS Date), N'47954438-k', N'carolina.sanchez@gmail.com', N'987012345')
INSERT [dbo].[Secretarios] ([id], [Nombres], [Apellidos], [FechaNacimiento], [Rut], [Email], [Password]) VALUES (35, N'Miguel ', N'Navarro ', CAST(N'1988-06-20' AS Date), N'3166568-K', N'miguel.navarro@gmail.com', N'678901234')
INSERT [dbo].[Secretarios] ([id], [Nombres], [Apellidos], [FechaNacimiento], [Rut], [Email], [Password]) VALUES (36, N'Valeria ', N'Ríos ', CAST(N'1992-09-30' AS Date), N'17389715-4', N'valeria.rios@gmail.com', N'567890123')
INSERT [dbo].[Secretarios] ([id], [Nombres], [Apellidos], [FechaNacimiento], [Rut], [Email], [Password]) VALUES (37, N'Francisco ', N'Guzmán ', CAST(N'1992-03-12' AS Date), N'22902920-7', N'francisco.guzman@gmail.com', N'901234567')
INSERT [dbo].[Secretarios] ([id], [Nombres], [Apellidos], [FechaNacimiento], [Rut], [Email], [Password]) VALUES (38, N'Paula ', N'Vargas ', CAST(N'1984-02-14' AS Date), N'8399840-7', N'paula.vargas@gmail.com', N'345678901')
INSERT [dbo].[Secretarios] ([id], [Nombres], [Apellidos], [FechaNacimiento], [Rut], [Email], [Password]) VALUES (39, N'Daniel ', N'Castro ', CAST(N'1997-12-01' AS Date), N'14958945-7', N'daniel.castro@gmail.com', N'890123456')
SET IDENTITY_INSERT [dbo].[Secretarios] OFF
GO
SET IDENTITY_INSERT [dbo].[Telefonos] ON 

INSERT [dbo].[Telefonos] ([id], [ID_Medicos], [numero_Tel], [numero_Tel_OP]) VALUES (1, 1, 12345677, NULL)
SET IDENTITY_INSERT [dbo].[Telefonos] OFF
GO
ALTER TABLE [dbo].[Citas]  WITH CHECK ADD  CONSTRAINT [FK_Citas_Pacientes] FOREIGN KEY([ID_Paciente])
REFERENCES [dbo].[Pacientes] ([id])
GO
ALTER TABLE [dbo].[Citas] CHECK CONSTRAINT [FK_Citas_Pacientes]
GO
ALTER TABLE [dbo].[Historial_Medico]  WITH CHECK ADD  CONSTRAINT [FK_Historial_Medico_Citas] FOREIGN KEY([ID_Cita])
REFERENCES [dbo].[Citas] ([id])
GO
ALTER TABLE [dbo].[Historial_Medico] CHECK CONSTRAINT [FK_Historial_Medico_Citas]
GO
USE [master]
GO
ALTER DATABASE [Clinica] SET  READ_WRITE 
GO
