/*******************************************************************************
 * TRABAJO PRACTICO - GESTION DE DATOS
 *
 * Nombre del Grupo: FOR_Y_UN_IF
 * Base de Datos: GD2C2025
 ******************************************************************************/

USE GD2C2025
GO

/*******************************************************************************
 * PARTE 0 (TESTING): ELIMINACION DE OBJETOS EXISTENTES
 ******************************************************************************/

PRINT '========================================='
PRINT 'INICIANDO LIMPIEZA DE OBJETOS EXISTENTES'
PRINT '========================================='
GO

-- Eliminar stored procedures si existen
IF OBJECT_ID('NOMBRE_GRUPO.migrar_respuesta_encuesta', 'P') IS NOT NULL DROP PROCEDURE FOR_Y_UN_IF.migrar_respuesta_encuesta;
IF OBJECT_ID('FOR_Y_UN_IF.migrar_encuesta', 'P') IS NOT NULL DROP PROCEDURE FOR_Y_UN_IF.migrar_encuesta;
IF OBJECT_ID('FOR_Y_UN_IF.migrar_pago', 'P') IS NOT NULL DROP PROCEDURE FOR_Y_UN_IF.migrar_pago;
IF OBJECT_ID('FOR_Y_UN_IF.migrar_detalle_factura', 'P') IS NOT NULL DROP PROCEDURE FOR_Y_UN_IF.migrar_detalle_factura;
IF OBJECT_ID('FOR_Y_UN_IF.migrar_factura', 'P') IS NOT NULL DROP PROCEDURE FOR_Y_UN_IF.migrar_factura;
IF OBJECT_ID('FOR_Y_UN_IF.migrar_evaluacion_final', 'P') IS NOT NULL DROP PROCEDURE FOR_Y_UN_IF.migrar_evaluacion_final;
IF OBJECT_ID('FOR_Y_UN_IF.migrar_inscripcion_final', 'P') IS NOT NULL DROP PROCEDURE FOR_Y_UN_IF.migrar_inscripcion_final;
IF OBJECT_ID('FOR_Y_UN_IF.migrar_examen_final', 'P') IS NOT NULL DROP PROCEDURE FOR_Y_UN_IF.migrar_examen_final;
IF OBJECT_ID('FOR_Y_UN_IF.migrar_trabajo_practico', 'P') IS NOT NULL DROP PROCEDURE FOR_Y_UN_IF.migrar_trabajo_practico;
IF OBJECT_ID('FOR_Y_UN_IF.migrar_evaluacion_curso', 'P') IS NOT NULL DROP PROCEDURE FOR_Y_UN_IF.migrar_evaluacion_curso;
IF OBJECT_ID('FOR_Y_UN_IF.migrar_inscripcion', 'P') IS NOT NULL DROP PROCEDURE FOR_Y_UN_IF.migrar_inscripcion;
IF OBJECT_ID('FOR_Y_UN_IF.migrar_modulo', 'P') IS NOT NULL DROP PROCEDURE FOR_Y_UN_IF.migrar_modulo;
IF OBJECT_ID('FOR_Y_UN_IF.migrar_curso_dia', 'P') IS NOT NULL DROP PROCEDURE FOR_Y_UN_IF.migrar_curso_dia;
IF OBJECT_ID('FOR_Y_UN_IF.migrar_curso', 'P') IS NOT NULL DROP PROCEDURE FOR_Y_UN_IF.migrar_curso;
IF OBJECT_ID('FOR_Y_UN_IF.migrar_alumno', 'P') IS NOT NULL DROP PROCEDURE FOR_Y_UN_IF.migrar_alumno;
IF OBJECT_ID('FOR_Y_UN_IF.migrar_profesor', 'P') IS NOT NULL DROP PROCEDURE FOR_Y_UN_IF.migrar_profesor;
IF OBJECT_ID('FOR_Y_UN_IF.migrar_sede', 'P') IS NOT NULL DROP PROCEDURE FOR_Y_UN_IF.migrar_sede;
IF OBJECT_ID('FOR_Y_UN_IF.migrar_institucion', 'P') IS NOT NULL DROP PROCEDURE FOR_Y_UN_IF.migrar_institucion;
IF OBJECT_ID('FOR_Y_UN_IF.migrar_localidad', 'P') IS NOT NULL DROP PROCEDURE FOR_Y_UN_IF.migrar_localidad;
IF OBJECT_ID('FOR_Y_UN_IF.migrar_provincia', 'P') IS NOT NULL DROP PROCEDURE FOR_Y_UN_IF.migrar_provincia;
IF OBJECT_ID('FOR_Y_UN_IF.migrar_catalogos', 'P') IS NOT NULL DROP PROCEDURE FOR_Y_UN_IF.migrar_catalogos;
GO

-- Eliminar tablas en orden inverso de dependencias
IF OBJECT_ID('FOR_Y_UN_IF.respuesta_encuesta', 'U') IS NOT NULL DROP TABLE FOR_Y_UN_IF.respuesta_encuesta;
IF OBJECT_ID('FOR_Y_UN_IF.encuesta', 'U') IS NOT NULL DROP TABLE FOR_Y_UN_IF.encuesta;
IF OBJECT_ID('FOR_Y_UN_IF.pago', 'U') IS NOT NULL DROP TABLE FOR_Y_UN_IF.pago;
IF OBJECT_ID('FOR_Y_UN_IF.detalle_factura', 'U') IS NOT NULL DROP TABLE FOR_Y_UN_IF.detalle_factura;
IF OBJECT_ID('FOR_Y_UN_IF.factura', 'U') IS NOT NULL DROP TABLE FOR_Y_UN_IF.factura;
IF OBJECT_ID('FOR_Y_UN_IF.evaluacion_final', 'U') IS NOT NULL DROP TABLE FOR_Y_UN_IF.evaluacion_final;
IF OBJECT_ID('FOR_Y_UN_IF.inscripcion_final', 'U') IS NOT NULL DROP TABLE FOR_Y_UN_IF.inscripcion_final;
IF OBJECT_ID('FOR_Y_UN_IF.examen_final', 'U') IS NOT NULL DROP TABLE FOR_Y_UN_IF.examen_final;
IF OBJECT_ID('FOR_Y_UN_IF.trabajo_practico', 'U') IS NOT NULL DROP TABLE FOR_Y_UN_IF.trabajo_practico;
IF OBJECT_ID('FOR_Y_UN_IF.evaluacion_curso', 'U') IS NOT NULL DROP TABLE FOR_Y_UN_IF.evaluacion_curso;
IF OBJECT_ID('FOR_Y_UN_IF.inscripcion', 'U') IS NOT NULL DROP TABLE FOR_Y_UN_IF.inscripcion;
IF OBJECT_ID('FOR_Y_UN_IF.modulo', 'U') IS NOT NULL DROP TABLE FOR_Y_UN_IF.modulo;
IF OBJECT_ID('FOR_Y_UN_IF.curso_dia', 'U') IS NOT NULL DROP TABLE FOR_Y_UN_IF.curso_dia;
IF OBJECT_ID('FOR_Y_UN_IF.curso', 'U') IS NOT NULL DROP TABLE FOR_Y_UN_IF.curso;
IF OBJECT_ID('FOR_Y_UN_IF.alumno', 'U') IS NOT NULL DROP TABLE FOR_Y_UN_IF.alumno;
IF OBJECT_ID('FOR_Y_UN_IF.profesor', 'U') IS NOT NULL DROP TABLE FOR_Y_UN_IF.profesor;
IF OBJECT_ID('FOR_Y_UN_IF.sede', 'U') IS NOT NULL DROP TABLE FOR_Y_UN_IF.sede;
IF OBJECT_ID('FOR_Y_UN_IF.institucion', 'U') IS NOT NULL DROP TABLE FOR_Y_UN_IF.institucion;
IF OBJECT_ID('FOR_Y_UN_IF.localidad', 'U') IS NOT NULL DROP TABLE FOR_Y_UN_IF.localidad;
IF OBJECT_ID('FOR_Y_UN_IF.provincia', 'U') IS NOT NULL DROP TABLE FOR_Y_UN_IF.provincia;
IF OBJECT_ID('FOR_Y_UN_IF.pregunta_encuesta', 'U') IS NOT NULL DROP TABLE FOR_Y_UN_IF.pregunta_encuesta;
IF OBJECT_ID('FOR_Y_UN_IF.periodo', 'U') IS NOT NULL DROP TABLE FOR_Y_UN_IF.periodo;
IF OBJECT_ID('FOR_Y_UN_IF.medio_pago', 'U') IS NOT NULL DROP TABLE FOR_Y_UN_IF.medio_pago;
IF OBJECT_ID('FOR_Y_UN_IF.dia', 'U') IS NOT NULL DROP TABLE FOR_Y_UN_IF.dia;
IF OBJECT_ID('FOR_Y_UN_IF.turno', 'U') IS NOT NULL DROP TABLE FOR_Y_UN_IF.turno;
IF OBJECT_ID('FOR_Y_UN_IF.categoria', 'U') IS NOT NULL DROP TABLE FOR_Y_UN_IF.categoria;
GO

-- Eliminar esquema si existe
IF EXISTS (SELECT * FROM sys.schemas WHERE name = 'FOR_Y_UN_IF')
BEGIN
    DROP SCHEMA FOR_Y_UN_IF
    PRINT 'Esquema existente eliminado'
END
GO

PRINT 'Limpieza completada'
GO

/*******************************************************************************
 * PARTE 1: CREACI�N DEL ESQUEMA
 ******************************************************************************/

PRINT '========================================='
PRINT 'CREANDO ESQUEMA'
PRINT '========================================='
GO

CREATE SCHEMA FOR_Y_UN_IF
GO

PRINT 'Esquema FOR_Y_UN_IF creado correctamente'
GO

/*******************************************************************************
 * PARTE 2: CREACI�N DE TABLAS - ENTIDADES PRINCIPALES
 ******************************************************************************/

PRINT '========================================='
PRINT 'CREANDO TABLAS PRINCIPALES'
PRINT '========================================='
GO

-- Tabla: SEDE
CREATE TABLE FOR_Y_UN_IF.sede (
    sede_id INT IDENTITY(1,1) PRIMARY KEY,
    sede_nombre NVARCHAR(255) NOT NULL,
    sede_direccion NVARCHAR(255) NULL,
    sede_telefono NVARCHAR(255) NULL,
    sede_mail NVARCHAR(255) NULL,
    localidad_id INT NOT NULL,
    institucion_cuit NVARCHAR(255) NOT NULL,
    CONSTRAINT FK_sede_localidad FOREIGN KEY (localidad_id)
        REFERENCES FOR_Y_UN_IF.localidad(localidad_id),
    CONSTRAINT FK_sede_institucion FOREIGN KEY (institucion_cuit)
        REFERENCES FOR_Y_UN_IF.institucion(institucion_cuit)
)
PRINT 'Tabla sede creada'
GO

-- Tabla: PROFESOR
CREATE TABLE FOR_Y_UN_IF.profesor (
    profesor_dni NVARCHAR(255) PRIMARY KEY,
    profesor_nombre NVARCHAR(255) NOT NULL,
    profesor_apellido NVARCHAR(255) NOT NULL,
    profesor_fecha_nacimiento DATETIME2(6) NULL,
    profesor_mail NVARCHAR(255) NULL,
    profesor_direccion NVARCHAR(255) NULL,
    profesor_telefono NVARCHAR(255) NULL,
    localidad_id INT NULL,
    CONSTRAINT FK_profesor_localidad FOREIGN KEY (localidad_id)
        REFERENCES FOR_Y_UN_IF.localidad(localidad_id)
)
PRINT 'Tabla profesor creada'
GO

-- Tabla: ALUMNO
CREATE TABLE FOR_Y_UN_IF.alumno (
    alumno_legajo BIGINT PRIMARY KEY,
    alumno_dni BIGINT NULL,
    alumno_nombre VARCHAR(255) NOT NULL,
    alumno_apellido VARCHAR(255) NOT NULL,
    alumno_fecha_nacimiento DATETIME2(6) NULL,
    alumno_mail VARCHAR(255) NULL,
    alumno_direccion VARCHAR(255) NULL,
    alumno_telefono VARCHAR(255) NULL,
    localidad_id INT NULL,
    CONSTRAINT FK_alumno_localidad FOREIGN KEY (localidad_id)
        REFERENCES FOR_Y_UN_IF.localidad(localidad_id)
)
PRINT 'Tabla alumno creada'
GO

-- Tabla: CURSO
CREATE TABLE FOR_Y_UN_IF.curso (
    curso_codigo BIGINT PRIMARY KEY,
    curso_nombre VARCHAR(255) NOT NULL,
    curso_descripcion VARCHAR(255) NULL,
    curso_fecha_inicio DATETIME2(6) NULL,
    curso_fecha_fin DATETIME2(6) NULL,
    curso_duracion_meses BIGINT NULL,
    curso_precio_mensual DECIMAL(38, 2) NULL,
    sede_id INT NOT NULL,
    categoria_id INT NOT NULL,
    turno_id INT NOT NULL,
    profesor_dni NVARCHAR(255) NOT NULL,
    CONSTRAINT FK_curso_sede FOREIGN KEY (sede_id)
        REFERENCES FOR_Y_UN_IF.sede(sede_id),
    CONSTRAINT FK_curso_categoria FOREIGN KEY (categoria_id)
        REFERENCES FOR_Y_UN_IF.categoria(categoria_id),
    CONSTRAINT FK_curso_turno FOREIGN KEY (turno_id)
        REFERENCES FOR_Y_UN_IF.turno(turno_id),
    CONSTRAINT FK_curso_profesor FOREIGN KEY (profesor_dni)
        REFERENCES FOR_Y_UN_IF.profesor(profesor_dni)
)
PRINT 'Tabla curso creada'
GO

-- Tabla: CURSO_DIA (relaci�n N:M)
CREATE TABLE FOR_Y_UN_IF.curso_dia (
    curso_dia_id INT IDENTITY(1,1) PRIMARY KEY,
    curso_codigo BIGINT NOT NULL,
    dia_id INT NOT NULL,
    CONSTRAINT FK_curso_dia_curso FOREIGN KEY (curso_codigo)
        REFERENCES FOR_Y_UN_IF.curso(curso_codigo),
    CONSTRAINT FK_curso_dia_dia FOREIGN KEY (dia_id)
        REFERENCES FOR_Y_UN_IF.dia(dia_id),
    CONSTRAINT UQ_curso_dia UNIQUE (curso_codigo, dia_id)
)
PRINT 'Tabla curso_dia creada'
GO

-- Tabla: MODULO
CREATE TABLE FOR_Y_UN_IF.modulo (
    modulo_id INT IDENTITY(1,1) PRIMARY KEY,
    modulo_nombre VARCHAR(255) NOT NULL,
    modulo_descripcion VARCHAR(255) NULL,
    curso_codigo BIGINT NOT NULL,
    CONSTRAINT FK_modulo_curso FOREIGN KEY (curso_codigo)
        REFERENCES FOR_Y_UN_IF.curso(curso_codigo)
)
PRINT 'Tabla modulo creada'
GO

/*******************************************************************************
 * PARTE 3: CREACI�N DE TABLAS - INSCRIPCIONES Y EVALUACIONES
 ******************************************************************************/

PRINT '========================================='
PRINT 'CREANDO TABLAS DE INSCRIPCIONES'
PRINT '========================================='
GO

-- Tabla: INSCRIPCION
CREATE TABLE FOR_Y_UN_IF.inscripcion (
    inscripcion_numero BIGINT PRIMARY KEY,
    inscripcion_fecha DATETIME2(6) NOT NULL,
    inscripcion_estado VARCHAR(255) NULL,
    inscripcion_fecha_respuesta DATETIME2(6) NULL,
    alumno_legajo BIGINT NOT NULL,
    curso_codigo BIGINT NOT NULL,
    CONSTRAINT FK_inscripcion_alumno FOREIGN KEY (alumno_legajo)
        REFERENCES FOR_Y_UN_IF.alumno(alumno_legajo),
    CONSTRAINT FK_inscripcion_curso FOREIGN KEY (curso_codigo)
        REFERENCES FOR_Y_UN_IF.curso(curso_codigo)
)
PRINT 'Tabla inscripcion creada'
GO

-- Tabla: EVALUACION_CURSO
CREATE TABLE FOR_Y_UN_IF.evaluacion_curso (
    evaluacion_id INT IDENTITY(1,1) PRIMARY KEY,
    evaluacion_nota BIGINT NULL,
    evaluacion_fecha DATETIME2(6) NULL,
    evaluacion_instancia BIGINT NULL,
    evaluacion_presente BIT NULL,
    inscripcion_numero BIGINT NOT NULL,
    modulo_id INT NOT NULL,
    CONSTRAINT FK_evaluacion_curso_inscripcion FOREIGN KEY (inscripcion_numero)
        REFERENCES FOR_Y_UN_IF.inscripcion(inscripcion_numero),
    CONSTRAINT FK_evaluacion_curso_modulo FOREIGN KEY (modulo_id)
        REFERENCES FOR_Y_UN_IF.modulo(modulo_id)
)
PRINT 'Tabla evaluacion_curso creada'
GO

-- Tabla: TRABAJO_PRACTICO
CREATE TABLE FOR_Y_UN_IF.trabajo_practico (
    trabajo_practico_id INT IDENTITY(1,1) PRIMARY KEY,
    trabajo_practico_nota BIGINT NULL,
    trabajo_practico_fecha_evaluacion DATETIME2(6) NULL,
    inscripcion_numero BIGINT NOT NULL,
    CONSTRAINT FK_trabajo_practico_inscripcion FOREIGN KEY (inscripcion_numero)
        REFERENCES FOR_Y_UN_IF.inscripcion(inscripcion_numero)
)
PRINT 'Tabla trabajo_practico creada'
GO

-- Tabla: PROVINCIA
CREATE TABLE FOR_Y_UN_IF.provincia (
    provincia_id INT IDENTITY(1,1) PRIMARY KEY,
    provincia_nombre NVARCHAR(255) NOT NULL
)
PRINT 'Tabla provincia creada'
GO

-- Tabla: LOCALIDAD
CREATE TABLE FOR_Y_UN_IF.localidad (
    localidad_id INT IDENTITY(1,1) PRIMARY KEY,
    localidad_nombre NVARCHAR(255) NOT NULL,
    provincia_id INT NOT NULL,
    CONSTRAINT FK_localidad_provincia FOREIGN KEY (provincia_id)
        REFERENCES FOR_Y_UN_IF.provincia(provincia_id)
)
PRINT 'Tabla localidad creada'
GO

-- Tabla: INSTITUCION
CREATE TABLE FOR_Y_UN_IF.institucion (
    institucion_cuit NVARCHAR(255) PRIMARY KEY,
    institucion_nombre NVARCHAR(255) NOT NULL,
    institucion_razon_social NVARCHAR(255) NULL
)
PRINT 'Tabla institucion creada'
GO

-- Tabla: CATEGORIA
CREATE TABLE FOR_Y_UN_IF.categoria (
    categoria_id INT IDENTITY(1,1) PRIMARY KEY,
    categoria_nombre VARCHAR(255) NOT NULL UNIQUE
)
PRINT 'Tabla categoria creada'
GO

-- Tabla: TURNO
CREATE TABLE FOR_Y_UN_IF.turno (
    turno_id INT IDENTITY(1,1) PRIMARY KEY,
    turno_nombre VARCHAR(255) NOT NULL UNIQUE
)
PRINT 'Tabla turno creada'
GO

-- Tabla: DIA
CREATE TABLE FOR_Y_UN_IF.dia (
    dia_id INT IDENTITY(1,1) PRIMARY KEY,
    dia_nombre VARCHAR(50) NOT NULL UNIQUE
)
PRINT 'Tabla dia creada'
GO


/*******************************************************************************
 * PARTE 4: CREACI�N DE TABLAS - FINALES
 ******************************************************************************/

PRINT '========================================='
PRINT 'CREANDO TABLAS DE FINALES'
PRINT '========================================='
GO

-- Tabla: EXAMEN_FINAL
CREATE TABLE FOR_Y_UN_IF.examen_final (
    examen_final_id INT IDENTITY(1,1) PRIMARY KEY,
    examen_final_fecha DATETIME2(6) NOT NULL,
    examen_final_hora VARCHAR(255) NULL,
    examen_final_descripcion VARCHAR(255) NULL,
    curso_codigo BIGINT NOT NULL,
    CONSTRAINT FK_examen_final_curso FOREIGN KEY (curso_codigo)
        REFERENCES FOR_Y_UN_IF.curso(curso_codigo)
)
PRINT 'Tabla examen_final creada'
GO

-- Tabla: INSCRIPCION_FINAL
CREATE TABLE FOR_Y_UN_IF.inscripcion_final (
    inscripcion_final_nro BIGINT PRIMARY KEY,
    inscripcion_final_fecha DATETIME2(6) NOT NULL,
    alumno_legajo BIGINT NOT NULL,
    examen_final_id INT NOT NULL,
    CONSTRAINT FK_inscripcion_final_alumno FOREIGN KEY (alumno_legajo)
        REFERENCES FOR_Y_UN_IF.alumno(alumno_legajo),
    CONSTRAINT FK_inscripcion_final_examen FOREIGN KEY (examen_final_id)
        REFERENCES FOR_Y_UN_IF.examen_final(examen_final_id)
)
PRINT 'Tabla inscripcion_final creada'
GO

-- Tabla: EVALUACION_FINAL
CREATE TABLE FOR_Y_UN_IF.evaluacion_final (
    evaluacion_final_id INT IDENTITY(1,1) PRIMARY KEY,
    evaluacion_final_nota BIGINT NULL,
    evaluacion_final_presente BIT NULL,
    inscripcion_final_nro BIGINT NOT NULL,
    profesor_dni NVARCHAR(255) NOT NULL,
    CONSTRAINT FK_evaluacion_final_inscripcion FOREIGN KEY (inscripcion_final_nro)
        REFERENCES FOR_Y_UN_IF.inscripcion_final(inscripcion_final_nro),
    CONSTRAINT FK_evaluacion_final_profesor FOREIGN KEY (profesor_dni)
        REFERENCES FOR_Y_UN_IF.profesor(profesor_dni)
)
PRINT 'Tabla evaluacion_final creada'
GO

/*******************************************************************************
 * PARTE 5: CREACI�N DE TABLAS - PAGOS Y FACTURACI�N
 ******************************************************************************/

PRINT '========================================='
PRINT 'CREANDO TABLAS DE PAGOS'
PRINT '========================================='
GO

-- Tabla: FACTURA
CREATE TABLE FOR_Y_UN_IF.factura (
    factura_numero BIGINT PRIMARY KEY,
    factura_fecha_emision DATETIME2(6) NOT NULL,
    factura_fecha_vencimiento DATETIME2(6) NULL,
    factura_total DECIMAL(18, 2) NULL,
    alumno_legajo BIGINT NOT NULL,
    CONSTRAINT FK_factura_alumno FOREIGN KEY (alumno_legajo)
        REFERENCES FOR_Y_UN_IF.alumno(alumno_legajo)
)
PRINT 'Tabla factura creada'
GO

-- Tabla: DETALLE_FACTURA
CREATE TABLE FOR_Y_UN_IF.detalle_factura (
    detalle_id INT IDENTITY(1,1) PRIMARY KEY,
    detalle_importe DECIMAL(18, 2) NULL,
    factura_numero BIGINT NOT NULL,
    curso_codigo BIGINT NOT NULL,
    periodo_id INT NOT NULL,
    CONSTRAINT FK_detalle_factura_factura FOREIGN KEY (factura_numero)
        REFERENCES FOR_Y_UN_IF.factura(factura_numero),
    CONSTRAINT FK_detalle_factura_curso FOREIGN KEY (curso_codigo)
        REFERENCES FOR_Y_UN_IF.curso(curso_codigo),
    CONSTRAINT FK_detalle_factura_periodo FOREIGN KEY (periodo_id)
        REFERENCES FOR_Y_UN_IF.periodo(periodo_id)
)
PRINT 'Tabla detalle_factura creada'
GO

-- Tabla: PAGO
CREATE TABLE FOR_Y_UN_IF.pago (
    pago_id INT IDENTITY(1,1) PRIMARY KEY,
    pago_fecha DATETIME2(6) NOT NULL,
    pago_importe DECIMAL(18, 2) NULL,
    factura_numero BIGINT NOT NULL,
    medio_pago_id INT NOT NULL,
    CONSTRAINT FK_pago_factura FOREIGN KEY (factura_numero)
        REFERENCES FOR_Y_UN_IF.factura(factura_numero),
    CONSTRAINT FK_pago_medio_pago FOREIGN KEY (medio_pago_id)
        REFERENCES FOR_Y_UN_IF.medio_pago(medio_pago_id)
)
PRINT 'Tabla pago creada'
GO

-- Tabla: MEDIO_PAGO
CREATE TABLE FOR_Y_UN_IF.medio_pago (
    medio_pago_id INT IDENTITY(1,1) PRIMARY KEY,
    medio_pago_nombre VARCHAR(255) NOT NULL UNIQUE
)
PRINT 'Tabla medio_pago creada'
GO

-- Tabla: PERIODO
CREATE TABLE FOR_Y_UN_IF.periodo (
    periodo_id INT IDENTITY(1,1) PRIMARY KEY,
    periodo_anio BIGINT NOT NULL,
    periodo_mes BIGINT NOT NULL,
    CONSTRAINT UQ_periodo_anio_mes UNIQUE (periodo_anio, periodo_mes),
    CONSTRAINT CHK_periodo_mes CHECK (periodo_mes BETWEEN 1 AND 12)
)
PRINT 'Tabla periodo creada'
GO


/*******************************************************************************
 * PARTE 6: CREACI�N DE TABLAS - ENCUESTAS
 ******************************************************************************/

PRINT '========================================='
PRINT 'CREANDO TABLAS DE ENCUESTAS'
PRINT '========================================='
GO

-- Tabla: ENCUESTA
CREATE TABLE FOR_Y_UN_IF.encuesta (
    encuesta_id INT IDENTITY(1,1) PRIMARY KEY,
    encuesta_fecha_registro DATETIME2(6) NOT NULL,
    encuesta_observacion VARCHAR(255) NULL,
    curso_codigo BIGINT NOT NULL,
    CONSTRAINT FK_encuesta_curso FOREIGN KEY (curso_codigo)
        REFERENCES FOR_Y_UN_IF.curso(curso_codigo)
)
PRINT 'Tabla encuesta creada'
GO

-- Tabla: RESPUESTA_ENCUESTA
CREATE TABLE FOR_Y_UN_IF.respuesta_encuesta (
    respuesta_id INT IDENTITY(1,1) PRIMARY KEY,
    respuesta_nota BIGINT NOT NULL,
    encuesta_id INT NOT NULL,
    pregunta_id INT NOT NULL,
    CONSTRAINT FK_respuesta_encuesta_encuesta FOREIGN KEY (encuesta_id)
        REFERENCES FOR_Y_UN_IF.encuesta(encuesta_id),
    CONSTRAINT FK_respuesta_encuesta_pregunta FOREIGN KEY (pregunta_id)
        REFERENCES FOR_Y_UN_IF.pregunta_encuesta(pregunta_id)
)
PRINT 'Tabla respuesta_encuesta creada'
GO

-- Tabla: PREGUNTA_ENCUESTA
CREATE TABLE FOR_Y_UN_IF.pregunta_encuesta (
    pregunta_id INT IDENTITY(1,1) PRIMARY KEY,
    pregunta_texto VARCHAR(255) NOT NULL UNIQUE
)
PRINT 'Tabla pregunta_encuesta creada'
GO


PRINT '========================================='
PRINT 'TODAS LAS TABLAS CREADAS EXITOSAMENTE'
PRINT 'Total: 24 tablas'
PRINT '========================================='
GO


/*******************************************************************************
 * PARTE 7: CREACION DE INDICES - Investigar si hace falta!!!!
 ******************************************************************************/

PRINT '========================================='
PRINT 'CREANDO INDICES'
PRINT '========================================='
GO

CREATE NONCLUSTERED INDEX IX_localidad_provincia ON FOR_Y_UN_IF.localidad(provincia_id);
CREATE NONCLUSTERED INDEX IX_sede_localidad ON FOR_Y_UN_IF.sede(localidad_id);
CREATE NONCLUSTERED INDEX IX_sede_institucion ON FOR_Y_UN_IF.sede(institucion_cuit);
CREATE NONCLUSTERED INDEX IX_profesor_localidad ON FOR_Y_UN_IF.profesor(localidad_id);
CREATE NONCLUSTERED INDEX IX_alumno_localidad ON FOR_Y_UN_IF.alumno(localidad_id);
CREATE NONCLUSTERED INDEX IX_curso_sede ON FOR_Y_UN_IF.curso(sede_id);
CREATE NONCLUSTERED INDEX IX_curso_categoria ON FOR_Y_UN_IF.curso(categoria_id);
CREATE NONCLUSTERED INDEX IX_curso_turno ON FOR_Y_UN_IF.curso(turno_id);
CREATE NONCLUSTERED INDEX IX_curso_profesor ON FOR_Y_UN_IF.curso(profesor_dni);
CREATE NONCLUSTERED INDEX IX_curso_dia_curso ON FOR_Y_UN_IF.curso_dia(curso_codigo);
CREATE NONCLUSTERED INDEX IX_curso_dia_dia ON FOR_Y_UN_IF.curso_dia(dia_id);
CREATE NONCLUSTERED INDEX IX_modulo_curso ON FOR_Y_UN_IF.modulo(curso_codigo);
CREATE NONCLUSTERED INDEX IX_inscripcion_alumno ON FOR_Y_UN_IF.inscripcion(alumno_legajo);
CREATE NONCLUSTERED INDEX IX_inscripcion_curso ON FOR_Y_UN_IF.inscripcion(curso_codigo);
CREATE NONCLUSTERED INDEX IX_evaluacion_curso_inscripcion ON FOR_Y_UN_IF.evaluacion_curso(inscripcion_numero);
CREATE NONCLUSTERED INDEX IX_evaluacion_curso_modulo ON FOR_Y_UN_IF.evaluacion_curso(modulo_id);
CREATE NONCLUSTERED INDEX IX_trabajo_practico_inscripcion ON FOR_Y_UN_IF.trabajo_practico(inscripcion_numero);
CREATE NONCLUSTERED INDEX IX_examen_final_curso ON FOR_Y_UN_IF.examen_final(curso_codigo);
CREATE NONCLUSTERED INDEX IX_inscripcion_final_alumno ON FOR_Y_UN_IF.inscripcion_final(alumno_legajo);
CREATE NONCLUSTERED INDEX IX_inscripcion_final_examen ON FOR_Y_UN_IF.inscripcion_final(examen_final_id);
CREATE NONCLUSTERED INDEX IX_evaluacion_final_inscripcion ON FOR_Y_UN_IF.evaluacion_final(inscripcion_final_nro);
CREATE NONCLUSTERED INDEX IX_evaluacion_final_profesor ON FOR_Y_UN_IF.evaluacion_final(profesor_dni);
CREATE NONCLUSTERED INDEX IX_factura_alumno ON FOR_Y_UN_IF.factura(alumno_legajo);
CREATE NONCLUSTERED INDEX IX_detalle_factura_factura ON FOR_Y_UN_IF.detalle_factura(factura_numero);
CREATE NONCLUSTERED INDEX IX_detalle_factura_curso ON FOR_Y_UN_IF.detalle_factura(curso_codigo);
CREATE NONCLUSTERED INDEX IX_detalle_factura_periodo ON FOR_Y_UN_IF.detalle_factura(periodo_id);
CREATE NONCLUSTERED INDEX IX_pago_factura ON FOR_Y_UN_IF.pago(factura_numero);
CREATE NONCLUSTERED INDEX IX_pago_medio_pago ON FOR_Y_UN_IF.pago(medio_pago_id);
CREATE NONCLUSTERED INDEX IX_encuesta_curso ON FOR_Y_UN_IF.encuesta(curso_codigo);
CREATE NONCLUSTERED INDEX IX_respuesta_encuesta_encuesta ON FOR_Y_UN_IF.respuesta_encuesta(encuesta_id);
CREATE NONCLUSTERED INDEX IX_respuesta_encuesta_pregunta ON FOR_Y_UN_IF.respuesta_encuesta(pregunta_id);

PRINT 'Indices en FKs creados: 31 Indices'
GO

-- Indices compuestos para consultas frecuentes
CREATE NONCLUSTERED INDEX IX_inscripcion_alumno_curso ON FOR_Y_UN_IF.inscripcion(alumno_legajo, curso_codigo);
CREATE NONCLUSTERED INDEX IX_detalle_factura_numero_curso ON FOR_Y_UN_IF.detalle_factura(factura_numero, curso_codigo);

PRINT 'Indices compuestos creados: 2 Indices'
PRINT 'Total Indices: 33'
GO

PRINT '========================================='
PRINT 'CREACION DE LAS ENTIDADES COMPLETADA'
PRINT '========================================='
GO


PRINT '========================================='
PRINT 'INICIANDO MIGRACION DE DATOS'
PRINT '========================================='
GO

/*******************************************************************************
 * SP 1: MIGRACION DE CATALOGOS
 ******************************************************************************/

CREATE PROCEDURE NOMBRE_GRUPO.migrar_catalogos
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        PRINT 'Migrando cat�logos...'

        -- CATEGORIA
        INSERT INTO NOMBRE_GRUPO.categoria (categoria_nombre)
        SELECT DISTINCT Curso_Categoria
        FROM gd_esquema.Maestra
        WHERE Curso_Categoria IS NOT NULL

        PRINT 'Categor�as migradas: ' + CAST(@@ROWCOUNT AS VARCHAR)

        -- TURNO
        INSERT INTO NOMBRE_GRUPO.turno (turno_nombre)
        SELECT DISTINCT Curso_Turno
        FROM gd_esquema.Maestra
        WHERE Curso_Turno IS NOT NULL

        PRINT 'Turnos migrados: ' + CAST(@@ROWCOUNT AS VARCHAR)

        -- DIA
        INSERT INTO NOMBRE_GRUPO.dia (dia_nombre)
        SELECT DISTINCT TRIM(value)
        FROM gd_esquema.Maestra
        CROSS APPLY STRING_SPLIT(Curso_Dia, ',')
        WHERE Curso_Dia IS NOT NULL

        PRINT 'D�as migrados: ' + CAST(@@ROWCOUNT AS VARCHAR)

        -- MEDIO_PAGO
        INSERT INTO NOMBRE_GRUPO.medio_pago (medio_pago_nombre)
        SELECT DISTINCT Pago_MedioPago
        FROM gd_esquema.Maestra
        WHERE Pago_MedioPago IS NOT NULL

        PRINT 'Medios de pago migrados: ' + CAST(@@ROWCOUNT AS VARCHAR)

        -- PERIODO
        INSERT INTO NOMBRE_GRUPO.periodo (periodo_anio, periodo_mes)
        SELECT DISTINCT Periodo_Anio, Periodo_Mes
        FROM gd_esquema.Maestra
        WHERE Periodo_Anio IS NOT NULL
          AND Periodo_Mes IS NOT NULL
        ORDER BY Periodo_Anio, Periodo_Mes

        PRINT 'Per�odos migrados: ' + CAST(@@ROWCOUNT AS VARCHAR)

        -- PREGUNTA_ENCUESTA
        INSERT INTO NOMBRE_GRUPO.pregunta_encuesta (pregunta_texto)
        SELECT DISTINCT pregunta
        FROM (
            SELECT Encuesta_Pregunta1 AS pregunta FROM gd_esquema.Maestra WHERE Encuesta_Pregunta1 IS NOT NULL
            UNION
            SELECT Encuesta_Pregunta2 FROM gd_esquema.Maestra WHERE Encuesta_Pregunta2 IS NOT NULL
            UNION
            SELECT Encuesta_Pregunta3 FROM gd_esquema.Maestra WHERE Encuesta_Pregunta3 IS NOT NULL
            UNION
            SELECT Encuesta_Pregunta4 FROM gd_esquema.Maestra WHERE Encuesta_Pregunta4 IS NOT NULL
        ) AS preguntas

        PRINT 'Preguntas de encuesta migradas: ' + CAST(@@ROWCOUNT AS VARCHAR)
        PRINT 'Cat�logos migrados exitosamente'

    END TRY
    BEGIN CATCH
        PRINT 'ERROR en migrar_catalogos: ' + ERROR_MESSAGE()
        THROW;
    END CATCH
END
GO

/*******************************************************************************
 * SP 2: MIGRACI�N DE PROVINCIA
 ******************************************************************************/

CREATE PROCEDURE NOMBRE_GRUPO.migrar_provincia
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        PRINT 'Migrando provincias...'

        INSERT INTO NOMBRE_GRUPO.provincia (provincia_nombre)
        SELECT DISTINCT provincia
        FROM (
            SELECT Alumno_Provincia AS provincia
            FROM gd_esquema.Maestra
            WHERE Alumno_Provincia IS NOT NULL
            UNION
            SELECT Profesor_Provincia
            FROM gd_esquema.Maestra
            WHERE Profesor_Provincia IS NOT NULL
            UNION
            SELECT Sede_Provincia
            FROM gd_esquema.Maestra
            WHERE Sede_Provincia IS NOT NULL
        ) AS provincias

        PRINT 'Provincias migradas: ' + CAST(@@ROWCOUNT AS VARCHAR)

    END TRY
    BEGIN CATCH
        PRINT 'ERROR en migrar_provincia: ' + ERROR_MESSAGE()
        THROW;
    END CATCH
END
GO

/*******************************************************************************
 * SP 3: MIGRACI�N DE LOCALIDAD
 ******************************************************************************/

CREATE PROCEDURE NOMBRE_GRUPO.migrar_localidad
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        PRINT 'Migrando localidades...'

        INSERT INTO NOMBRE_GRUPO.localidad (localidad_nombre, provincia_id)
        SELECT DISTINCT
            loc.localidad,
            p.provincia_id
        FROM (
            SELECT Alumno_Localidad AS localidad, Alumno_Provincia AS provincia
            FROM gd_esquema.Maestra
            WHERE Alumno_Localidad IS NOT NULL AND Alumno_Provincia IS NOT NULL
            UNION
            SELECT Profesor_Localidad, Profesor_Provincia
            FROM gd_esquema.Maestra
            WHERE Profesor_Localidad IS NOT NULL AND Profesor_Provincia IS NOT NULL
            UNION
            SELECT Sede_Localidad, Sede_Provincia
            FROM gd_esquema.Maestra
            WHERE Sede_Localidad IS NOT NULL AND Sede_Provincia IS NOT NULL
        ) AS loc
        JOIN NOMBRE_GRUPO.provincia p ON loc.provincia = p.provincia_nombre

        PRINT 'Localidades migradas: ' + CAST(@@ROWCOUNT AS VARCHAR)

    END TRY
    BEGIN CATCH
        PRINT 'ERROR en migrar_localidad: ' + ERROR_MESSAGE()
        THROW;
    END CATCH
END
GO

/*******************************************************************************
 * SP 4: MIGRACI�N DE INSTITUCI�N
 ******************************************************************************/

CREATE PROCEDURE NOMBRE_GRUPO.migrar_institucion
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        PRINT 'Migrando instituciones...'

        INSERT INTO NOMBRE_GRUPO.institucion (institucion_cuit, institucion_nombre, institucion_razon_social)
        SELECT DISTINCT
            Institucion_Cuit,
            Institucion_Nombre,
            Institucion_RazonSocial
        FROM gd_esquema.Maestra
        WHERE Institucion_Cuit IS NOT NULL

        PRINT 'Instituciones migradas: ' + CAST(@@ROWCOUNT AS VARCHAR)

    END TRY
    BEGIN CATCH
        PRINT 'ERROR en migrar_institucion: ' + ERROR_MESSAGE()
        THROW;
    END CATCH
END
GO

/*******************************************************************************
 * SP 5: MIGRACI�N DE SEDE
 ******************************************************************************/

CREATE PROCEDURE NOMBRE_GRUPO.migrar_sede
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        PRINT 'Migrando sedes...'

        INSERT INTO NOMBRE_GRUPO.sede (
            sede_nombre,
            sede_direccion,
            sede_telefono,
            sede_mail,
            localidad_id,
            institucion_cuit
        )
        SELECT DISTINCT
            m.Sede_Nombre,
            m.Sede_Direccion,
            m.Sede_Telefono,
            m.Sede_Mail,
            l.localidad_id,
            m.Institucion_Cuit
        FROM gd_esquema.Maestra m
        JOIN NOMBRE_GRUPO.localidad l
            ON m.Sede_Localidad = l.localidad_nombre
        JOIN NOMBRE_GRUPO.provincia p
            ON m.Sede_Provincia = p.provincia_nombre
            AND l.provincia_id = p.provincia_id
        WHERE m.Sede_Nombre IS NOT NULL
          AND m.Institucion_Cuit IS NOT NULL

        PRINT 'Sedes migradas: ' + CAST(@@ROWCOUNT AS VARCHAR)

    END TRY
    BEGIN CATCH
        PRINT 'ERROR en migrar_sede: ' + ERROR_MESSAGE()
        THROW;
    END CATCH
END
GO

/*******************************************************************************
 * SP 6: MIGRACI�N DE PROFESOR
 ******************************************************************************/

CREATE PROCEDURE NOMBRE_GRUPO.migrar_profesor
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        PRINT 'Migrando profesores...'

        INSERT INTO NOMBRE_GRUPO.profesor (
            profesor_dni,
            profesor_nombre,
            profesor_apellido,
            profesor_fecha_nacimiento,
            profesor_mail,
            profesor_direccion,
            profesor_telefono,
            localidad_id
        )
        SELECT DISTINCT
            m.Profesor_Dni,
            m.Profesor_nombre,
            m.Profesor_Apellido,
            m.Profesor_FechaNacimiento,
            m.Profesor_Mail,
            m.Profesor_Direccion,
            m.Profesor_Telefono,
            l.localidad_id
        FROM gd_esquema.Maestra m
        LEFT JOIN NOMBRE_GRUPO.localidad l
            ON m.Profesor_Localidad = l.localidad_nombre
        LEFT JOIN NOMBRE_GRUPO.provincia p
            ON m.Profesor_Provincia = p.provincia_nombre
            AND l.provincia_id = p.provincia_id
        WHERE m.Profesor_Dni IS NOT NULL

        PRINT 'Profesores migrados: ' + CAST(@@ROWCOUNT AS VARCHAR)

    END TRY
    BEGIN CATCH
        PRINT 'ERROR en migrar_profesor: ' + ERROR_MESSAGE()
        THROW;
    END CATCH
END
GO

/*******************************************************************************
 * SP 7: MIGRACI�N DE ALUMNO
 ******************************************************************************/

CREATE PROCEDURE NOMBRE_GRUPO.migrar_alumno
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        PRINT 'Migrando alumnos...'

        INSERT INTO NOMBRE_GRUPO.alumno (
            alumno_legajo,
            alumno_dni,
            alumno_nombre,
            alumno_apellido,
            alumno_fecha_nacimiento,
            alumno_mail,
            alumno_direccion,
            alumno_telefono,
            localidad_id
        )
        SELECT DISTINCT
            m.Alumno_Legajo,
            m.Alumno_Dni,
            m.Alumno_Nombre,
            m.Alumno_Apellido,
            m.Alumno_FechaNacimiento,
            m.Alumno_Mail,
            m.Alumno_Direccion,
            m.Alumno_Telefono,
            l.localidad_id
        FROM gd_esquema.Maestra m
        LEFT JOIN NOMBRE_GRUPO.localidad l
            ON m.Alumno_Localidad = l.localidad_nombre
        LEFT JOIN NOMBRE_GRUPO.provincia p
            ON m.Alumno_Provincia = p.provincia_nombre
            AND l.provincia_id = p.provincia_id
        WHERE m.Alumno_Legajo IS NOT NULL

        PRINT 'Alumnos migrados: ' + CAST(@@ROWCOUNT AS VARCHAR)

    END TRY
    BEGIN CATCH
        PRINT 'ERROR en migrar_alumno: ' + ERROR_MESSAGE()
        THROW;
    END CATCH
END
GO

/*******************************************************************************
 * SP 8: MIGRACI�N DE CURSO
 ******************************************************************************/

CREATE PROCEDURE NOMBRE_GRUPO.migrar_curso
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        PRINT 'Migrando cursos...'

        INSERT INTO NOMBRE_GRUPO.curso (
            curso_codigo,
            curso_nombre,
            curso_descripcion,
            curso_fecha_inicio,
            curso_fecha_fin,
            curso_duracion_meses,
            curso_precio_mensual,
            sede_id,
            categoria_id,
            turno_id,
            profesor_dni
        )
        SELECT DISTINCT
            m.Curso_Codigo,
            m.Curso_Nombre,
            m.Curso_Descripcion,
            m.Curso_FechaInicio,
            m.Curso_FechaFin,
            m.Curso_DuracionMeses,
            m.Curso_PrecioMensual,
            s.sede_id,
            c.categoria_id,
            t.turno_id,
            m.Profesor_Dni
        FROM gd_esquema.Maestra m
        JOIN NOMBRE_GRUPO.sede s
            ON m.Sede_Nombre = s.sede_nombre
        JOIN NOMBRE_GRUPO.categoria c
            ON m.Curso_Categoria = c.categoria_nombre
        JOIN NOMBRE_GRUPO.turno t
            ON m.Curso_Turno = t.turno_nombre
        WHERE m.Curso_Codigo IS NOT NULL
          AND m.Profesor_Dni IS NOT NULL

        PRINT 'Cursos migrados: ' + CAST(@@ROWCOUNT AS VARCHAR)

    END TRY
    BEGIN CATCH
        PRINT 'ERROR en migrar_curso: ' + ERROR_MESSAGE()
        THROW;
    END CATCH
END
GO

/*******************************************************************************
 * SP 9: MIGRACI�N DE CURSO_DIA
 ******************************************************************************/

CREATE PROCEDURE NOMBRE_GRUPO.migrar_curso_dia
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        PRINT 'Migrando relaci�n curso-d�a...'

        INSERT INTO NOMBRE_GRUPO.curso_dia (curso_codigo, dia_id)
        SELECT DISTINCT
            m.Curso_Codigo,
            d.dia_id
        FROM gd_esquema.Maestra m
        CROSS APPLY STRING_SPLIT(m.Curso_Dia, ',') AS split_dias
        JOIN NOMBRE_GRUPO.dia d
            ON TRIM(split_dias.value) = d.dia_nombre
        WHERE m.Curso_Codigo IS NOT NULL
          AND m.Curso_Dia IS NOT NULL

        PRINT 'Relaciones curso-d�a migradas: ' + CAST(@@ROWCOUNT AS VARCHAR)

    END TRY
    BEGIN CATCH
        PRINT 'ERROR en migrar_curso_dia: ' + ERROR_MESSAGE()
        THROW;
    END CATCH
END
GO

/*******************************************************************************
 * SP 10: MIGRACI�N DE M�DULO
 ******************************************************************************/

CREATE PROCEDURE NOMBRE_GRUPO.migrar_modulo
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        PRINT 'Migrando m�dulos...'

        INSERT INTO NOMBRE_GRUPO.modulo (
            modulo_nombre,
            modulo_descripcion,
            curso_codigo
        )
        SELECT DISTINCT
            m.Modulo_Nombre,
            m.Modulo_Descripcion,
            m.Curso_Codigo
        FROM gd_esquema.Maestra m
        WHERE m.Modulo_Nombre IS NOT NULL
          AND m.Curso_Codigo IS NOT NULL

        PRINT 'M�dulos migrados: ' + CAST(@@ROWCOUNT AS VARCHAR)

    END TRY
    BEGIN CATCH
        PRINT 'ERROR en migrar_modulo: ' + ERROR_MESSAGE()
        THROW;
    END CATCH
END
GO

/*******************************************************************************
 * SP 11: MIGRACI�N DE INSCRIPCI�N
 ******************************************************************************/

CREATE PROCEDURE NOMBRE_GRUPO.migrar_inscripcion
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        PRINT 'Migrando inscripciones...'

        INSERT INTO NOMBRE_GRUPO.inscripcion (
            inscripcion_numero,
            inscripcion_fecha,
            inscripcion_estado,
            inscripcion_fecha_respuesta,
            alumno_legajo,
            curso_codigo
        )
        SELECT DISTINCT
            m.Inscripcion_Numero,
            m.Inscripcion_Fecha,
            m.Inscripcion_Estado,
            m.Inscripcion_FechaRespuesta,
            m.Alumno_Legajo,
            m.Curso_Codigo
        FROM gd_esquema.Maestra m
        WHERE m.Inscripcion_Numero IS NOT NULL
          AND m.Alumno_Legajo IS NOT NULL
          AND m.Curso_Codigo IS NOT NULL

        PRINT 'Inscripciones migradas: ' + CAST(@@ROWCOUNT AS VARCHAR)

    END TRY
    BEGIN CATCH
        PRINT 'ERROR en migrar_inscripcion: ' + ERROR_MESSAGE()
        THROW;
    END CATCH
END
GO

/*******************************************************************************
 * SP 12: MIGRACI�N DE EVALUACI�N CURSO
 ******************************************************************************/

CREATE PROCEDURE NOMBRE_GRUPO.migrar_evaluacion_curso
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        PRINT 'Migrando evaluaciones de curso...'

        INSERT INTO NOMBRE_GRUPO.evaluacion_curso (
            evaluacion_nota,
            evaluacion_fecha,
            evaluacion_instancia,
            evaluacion_presente,
            inscripcion_numero,
            modulo_id
        )
        SELECT
            m.Evaluacion_Curso_Nota,
            m.Evaluacion_Curso_fechaEvaluacion,
            m.Evaluacion_Curso_Instancia,
            m.Evaluacion_Curso_Presente,
            m.Inscripcion_Numero,
            mo.modulo_id
        FROM gd_esquema.Maestra m
        JOIN NOMBRE_GRUPO.modulo mo
            ON m.Modulo_Nombre = mo.modulo_nombre
            AND m.Curso_Codigo = mo.curso_codigo
        WHERE m.Evaluacion_Curso_fechaEvaluacion IS NOT NULL
          AND m.Inscripcion_Numero IS NOT NULL
          AND m.Modulo_Nombre IS NOT NULL

        PRINT 'Evaluaciones de curso migradas: ' + CAST(@@ROWCOUNT AS VARCHAR)

    END TRY
    BEGIN CATCH
        PRINT 'ERROR en migrar_evaluacion_curso: ' + ERROR_MESSAGE()
        THROW;
    END CATCH
END
GO

/*******************************************************************************
 * SP 13: MIGRACI�N DE TRABAJO PR�CTICO
 ******************************************************************************/

CREATE PROCEDURE NOMBRE_GRUPO.migrar_trabajo_practico
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        PRINT 'Migrando trabajos pr�cticos...'

        INSERT INTO NOMBRE_GRUPO.trabajo_practico (
            trabajo_practico_nota,
            trabajo_practico_fecha_evaluacion,
            inscripcion_numero
        )
        SELECT DISTINCT
            m.Trabajo_Practico_Nota,
            m.Trabajo_Practico_FechaEvaluacion,
            m.Inscripcion_Numero
        FROM gd_esquema.Maestra m
        WHERE m.Trabajo_Practico_FechaEvaluacion IS NOT NULL
          AND m.Inscripcion_Numero IS NOT NULL

        PRINT 'Trabajos pr�cticos migrados: ' + CAST(@@ROWCOUNT AS VARCHAR)

    END TRY
    BEGIN CATCH
        PRINT 'ERROR en migrar_trabajo_practico: ' + ERROR_MESSAGE()
        THROW;
    END CATCH
END
GO

/*******************************************************************************
 * SP 14: MIGRACI�N DE EXAMEN FINAL
 ******************************************************************************/

CREATE PROCEDURE NOMBRE_GRUPO.migrar_examen_final
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        PRINT 'Migrando ex�menes finales...'

        INSERT INTO NOMBRE_GRUPO.examen_final (
            examen_final_fecha,
            examen_final_hora,
            examen_final_descripcion,
            curso_codigo
        )
        SELECT DISTINCT
            m.Examen_Final_Fecha,
            m.Examen_Final_Hora,
            m.Examen_Final_Descripcion,
            m.Curso_Codigo
        FROM gd_esquema.Maestra m
        WHERE m.Examen_Final_Fecha IS NOT NULL
          AND m.Curso_Codigo IS NOT NULL

        PRINT 'Ex�menes finales migrados: ' + CAST(@@ROWCOUNT AS VARCHAR)

    END TRY
    BEGIN CATCH
        PRINT 'ERROR en migrar_examen_final: ' + ERROR_MESSAGE()
        THROW;
    END CATCH
END
GO

/*******************************************************************************
 * SP 15: MIGRACI�N DE INSCRIPCI�N FINAL
 ******************************************************************************/

CREATE PROCEDURE NOMBRE_GRUPO.migrar_inscripcion_final
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        PRINT 'Migrando inscripciones a finales...'

        INSERT INTO NOMBRE_GRUPO.inscripcion_final (
            inscripcion_final_nro,
            inscripcion_final_fecha,
            alumno_legajo,
            examen_final_id
        )
        SELECT DISTINCT
            m.Inscripcion_Final_Nro,
            m.Inscripcion_Final_Fecha,
            m.Alumno_Legajo,
            ef.examen_final_id
        FROM gd_esquema.Maestra m
        JOIN NOMBRE_GRUPO.examen_final ef
            ON m.Examen_Final_Fecha = ef.examen_final_fecha
            AND m.Curso_Codigo = ef.curso_codigo
            AND ISNULL(m.Examen_Final_Hora, '') = ISNULL(ef.examen_final_hora, '')
        WHERE m.Inscripcion_Final_Nro IS NOT NULL
          AND m.Alumno_Legajo IS NOT NULL

        PRINT 'Inscripciones a finales migradas: ' + CAST(@@ROWCOUNT AS VARCHAR)

    END TRY
    BEGIN CATCH
        PRINT 'ERROR en migrar_inscripcion_final: ' + ERROR_MESSAGE()
        THROW;
    END CATCH
END
GO

/*******************************************************************************
 * SP 16: MIGRACI�N DE EVALUACI�N FINAL
 ******************************************************************************/

CREATE PROCEDURE NOMBRE_GRUPO.migrar_evaluacion_final
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        PRINT 'Migrando evaluaciones de finales...'

        INSERT INTO NOMBRE_GRUPO.evaluacion_final (
            evaluacion_final_nota,
            evaluacion_final_presente,
            inscripcion_final_nro,
            profesor_dni
        )
        SELECT DISTINCT
            m.Evaluacion_Final_Nota,
            m.Evaluacion_Final_Presente,
            m.Inscripcion_Final_Nro,
            m.Profesor_Dni
        FROM gd_esquema.Maestra m
        WHERE m.Inscripcion_Final_Nro IS NOT NULL
          AND m.Profesor_Dni IS NOT NULL
          AND (m.Evaluacion_Final_Nota IS NOT NULL
               OR m.Evaluacion_Final_Presente IS NOT NULL)

        PRINT 'Evaluaciones de finales migradas: ' + CAST(@@ROWCOUNT AS VARCHAR)

    END TRY
    BEGIN CATCH
        PRINT 'ERROR en migrar_evaluacion_final: ' + ERROR_MESSAGE()
        THROW;
    END CATCH
END
GO

/*******************************************************************************
 * SP 17: MIGRACI�N DE FACTURA
 ******************************************************************************/

CREATE PROCEDURE NOMBRE_GRUPO.migrar_factura
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        PRINT 'Migrando facturas...'

        INSERT INTO NOMBRE_GRUPO.factura (
            factura_numero,
            factura_fecha_emision,
            factura_fecha_vencimiento,
            factura_total,
            alumno_legajo
        )
        SELECT DISTINCT
            m.Factura_Numero,
            m.Factura_FechaEmision,
            m.Factura_FechaVencimiento,
            m.Factura_Total,
            m.Alumno_Legajo
        FROM gd_esquema.Maestra m
        WHERE m.Factura_Numero IS NOT NULL
          AND m.Alumno_Legajo IS NOT NULL

        PRINT 'Facturas migradas: ' + CAST(@@ROWCOUNT AS VARCHAR)

    END TRY
    BEGIN CATCH
        PRINT 'ERROR en migrar_factura: ' + ERROR_MESSAGE()
        THROW;
    END CATCH
END
GO

/*******************************************************************************
 * SP 18: MIGRACI�N DE DETALLE FACTURA
 ******************************************************************************/

CREATE PROCEDURE NOMBRE_GRUPO.migrar_detalle_factura
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        PRINT 'Migrando detalles de factura...'

        INSERT INTO NOMBRE_GRUPO.detalle_factura (
            detalle_importe,
            factura_numero,
            curso_codigo,
            periodo_id
        )
        SELECT
            m.Detalle_Factura_Importe,
            m.Factura_Numero,
            m.Curso_Codigo,
            p.periodo_id
        FROM gd_esquema.Maestra m
        JOIN NOMBRE_GRUPO.periodo p
            ON m.Periodo_Anio = p.periodo_anio
            AND m.Periodo_Mes = p.periodo_mes
        WHERE m.Factura_Numero IS NOT NULL
          AND m.Curso_Codigo IS NOT NULL
          AND m.Periodo_Anio IS NOT NULL
          AND m.Periodo_Mes IS NOT NULL

        PRINT 'Detalles de factura migrados: ' + CAST(@@ROWCOUNT AS VARCHAR)

    END TRY
    BEGIN CATCH
        PRINT 'ERROR en migrar_detalle_factura: ' + ERROR_MESSAGE()
        THROW;
    END CATCH
END
GO

/*******************************************************************************
 * SP 19: MIGRACI�N DE PAGO
 ******************************************************************************/

CREATE PROCEDURE NOMBRE_GRUPO.migrar_pago
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        PRINT 'Migrando pagos...'

        INSERT INTO NOMBRE_GRUPO.pago (
            pago_fecha,
            pago_importe,
            factura_numero,
            medio_pago_id
        )
        SELECT
            m.Pago_Fecha,
            m.Pago_Importe,
            m.Factura_Numero,
            mp.medio_pago_id
        FROM gd_esquema.Maestra m
        JOIN NOMBRE_GRUPO.medio_pago mp
            ON m.Pago_MedioPago = mp.medio_pago_nombre
        WHERE m.Pago_Fecha IS NOT NULL
          AND m.Factura_Numero IS NOT NULL

        PRINT 'Pagos migrados: ' + CAST(@@ROWCOUNT AS VARCHAR)

    END TRY
    BEGIN CATCH
        PRINT 'ERROR en migrar_pago: ' + ERROR_MESSAGE()
        THROW;
    END CATCH
END
GO

/*******************************************************************************
 * SP 20: MIGRACI�N DE ENCUESTA
 ******************************************************************************/

CREATE PROCEDURE NOMBRE_GRUPO.migrar_encuesta
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        PRINT 'Migrando encuestas...'

        -- Crear tabla temporal para identificar encuestas �nicas
        CREATE TABLE #EncuestasTemporal (
            encuesta_temp_id INT IDENTITY(1,1),
            curso_codigo BIGINT,
            fecha_registro DATETIME2(6),
            observacion VARCHAR(255)
        )

        INSERT INTO #EncuestasTemporal (curso_codigo, fecha_registro, observacion)
        SELECT DISTINCT
            Curso_Codigo,
            Encuesta_FechaRegistro,
            Encuesta_Observacion
        FROM gd_esquema.Maestra
        WHERE Encuesta_FechaRegistro IS NOT NULL
          AND Curso_Codigo IS NOT NULL

        INSERT INTO NOMBRE_GRUPO.encuesta (
            encuesta_fecha_registro,
            encuesta_observacion,
            curso_codigo
        )
        SELECT
            fecha_registro,
            observacion,
            curso_codigo
        FROM #EncuestasTemporal

        PRINT 'Encuestas migradas: ' + CAST(@@ROWCOUNT AS VARCHAR)

        DROP TABLE #EncuestasTemporal

    END TRY
    BEGIN CATCH
        IF OBJECT_ID('tempdb..#EncuestasTemporal') IS NOT NULL
            DROP TABLE #EncuestasTemporal
        PRINT 'ERROR en migrar_encuesta: ' + ERROR_MESSAGE()
        THROW;
    END CATCH
END
GO

/*******************************************************************************
 * SP 21: MIGRACI�N DE RESPUESTA ENCUESTA
 ******************************************************************************/

CREATE PROCEDURE NOMBRE_GRUPO.migrar_respuesta_encuesta
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        PRINT 'Migrando respuestas de encuestas...'

        -- Migrar respuestas de pregunta 1
        INSERT INTO NOMBRE_GRUPO.respuesta_encuesta (respuesta_nota, encuesta_id, pregunta_id)
        SELECT
            m.Encuesta_Nota1,
            e.encuesta_id,
            p.pregunta_id
        FROM gd_esquema.Maestra m
        JOIN NOMBRE_GRUPO.encuesta e
            ON m.Curso_Codigo = e.curso_codigo
            AND m.Encuesta_FechaRegistro = e.encuesta_fecha_registro
            AND ISNULL(m.Encuesta_Observacion, '') = ISNULL(e.encuesta_observacion, '')
        JOIN NOMBRE_GRUPO.pregunta_encuesta p
            ON m.Encuesta_Pregunta1 = p.pregunta_texto
        WHERE m.Encuesta_Pregunta1 IS NOT NULL
          AND m.Encuesta_Nota1 IS NOT NULL

        PRINT 'Respuestas pregunta 1 migradas: ' + CAST(@@ROWCOUNT AS VARCHAR)

        -- Migrar respuestas de pregunta 2
        INSERT INTO NOMBRE_GRUPO.respuesta_encuesta (respuesta_nota, encuesta_id, pregunta_id)
        SELECT
            m.Encuesta_Nota2,
            e.encuesta_id,
            p.pregunta_id
        FROM gd_esquema.Maestra m
        JOIN NOMBRE_GRUPO.encuesta e
            ON m.Curso_Codigo = e.curso_codigo
            AND m.Encuesta_FechaRegistro = e.encuesta_fecha_registro
            AND ISNULL(m.Encuesta_Observacion, '') = ISNULL(e.encuesta_observacion, '')
        JOIN NOMBRE_GRUPO.pregunta_encuesta p
            ON m.Encuesta_Pregunta2 = p.pregunta_texto
        WHERE m.Encuesta_Pregunta2 IS NOT NULL
          AND m.Encuesta_Nota2 IS NOT NULL

        PRINT 'Respuestas pregunta 2 migradas: ' + CAST(@@ROWCOUNT AS VARCHAR)

        -- Migrar respuestas de pregunta 3
        INSERT INTO NOMBRE_GRUPO.respuesta_encuesta (respuesta_nota, encuesta_id, pregunta_id)
        SELECT
            m.Encuesta_Nota3,
            e.encuesta_id,
            p.pregunta_id
        FROM gd_esquema.Maestra m
        JOIN NOMBRE_GRUPO.encuesta e
            ON m.Curso_Codigo = e.curso_codigo
            AND m.Encuesta_FechaRegistro = e.encuesta_fecha_registro
            AND ISNULL(m.Encuesta_Observacion, '') = ISNULL(e.encuesta_observacion, '')
        JOIN NOMBRE_GRUPO.pregunta_encuesta p
            ON m.Encuesta_Pregunta3 = p.pregunta_texto
        WHERE m.Encuesta_Pregunta3 IS NOT NULL
          AND m.Encuesta_Nota3 IS NOT NULL

        PRINT 'Respuestas pregunta 3 migradas: ' + CAST(@@ROWCOUNT AS VARCHAR)

        -- Migrar respuestas de pregunta 4
        INSERT INTO NOMBRE_GRUPO.respuesta_encuesta (respuesta_nota, encuesta_id, pregunta_id)
        SELECT
            m.Encuesta_Nota4,
            e.encuesta_id,
            p.pregunta_id
        FROM gd_esquema.Maestra m
        JOIN NOMBRE_GRUPO.encuesta e
            ON m.Curso_Codigo = e.curso_codigo
            AND m.Encuesta_FechaRegistro = e.encuesta_fecha_registro
            AND ISNULL(m.Encuesta_Observacion, '') = ISNULL(e.encuesta_observacion, '')
        JOIN NOMBRE_GRUPO.pregunta_encuesta p
            ON m.Encuesta_Pregunta4 = p.pregunta_texto
        WHERE m.Encuesta_Pregunta4 IS NOT NULL
          AND m.Encuesta_Nota4 IS NOT NULL

        PRINT 'Respuestas pregunta 4 migradas: ' + CAST(@@ROWCOUNT AS VARCHAR)
        PRINT 'Total respuestas de encuestas migradas'

    END TRY
    BEGIN CATCH
        PRINT 'ERROR en migrar_respuesta_encuesta: ' + ERROR_MESSAGE()
        THROW;
    END CATCH
END
GO

/*******************************************************************************
 * PARTE 10: EJECUCI�N DE LA MIGRACI�N EN ORDEN
 ******************************************************************************/

PRINT '========================================='
PRINT 'EJECUTANDO MIGRACI�N COMPLETA'
PRINT '========================================='
GO

-- Paso 1: Cat�logos independientes
PRINT ''
PRINT '--- PASO 1: CAT�LOGOS ---'
EXEC NOMBRE_GRUPO.migrar_catalogos
GO

-- Paso 2: Provincias
PRINT ''
PRINT '--- PASO 2: PROVINCIAS ---'
EXEC NOMBRE_GRUPO.migrar_provincia
GO

-- Paso 3: Localidades
PRINT ''
PRINT '--- PASO 3: LOCALIDADES ---'
EXEC NOMBRE_GRUPO.migrar_localidad
GO

-- Paso 4: Instituciones
PRINT ''
PRINT '--- PASO 4: INSTITUCIONES ---'
EXEC NOMBRE_GRUPO.migrar_institucion
GO

-- Paso 5: Sedes
PRINT ''
PRINT '--- PASO 5: SEDES ---'
EXEC NOMBRE_GRUPO.migrar_sede
GO

-- Paso 6: Profesores
PRINT ''
PRINT '--- PASO 6: PROFESORES ---'
EXEC NOMBRE_GRUPO.migrar_profesor
GO

-- Paso 7: Alumnos
PRINT ''
PRINT '--- PASO 7: ALUMNOS ---'
EXEC NOMBRE_GRUPO.migrar_alumno
GO

-- Paso 8: Cursos
PRINT ''
PRINT '--- PASO 8: CURSOS ---'
EXEC NOMBRE_GRUPO.migrar_curso
GO

-- Paso 9: Curso-D�a
PRINT ''
PRINT '--- PASO 9: CURSO-D�A ---'
EXEC NOMBRE_GRUPO.migrar_curso_dia
GO

-- Paso 10: M�dulos
PRINT ''
PRINT '--- PASO 10: M�DULOS ---'
EXEC NOMBRE_GRUPO.migrar_modulo
GO

-- Paso 11: Inscripciones
PRINT ''
PRINT '--- PASO 11: INSCRIPCIONES ---'
EXEC NOMBRE_GRUPO.migrar_inscripcion
GO

-- Paso 12: Evaluaciones de Curso
PRINT ''
PRINT '--- PASO 12: EVALUACIONES DE CURSO ---'
EXEC NOMBRE_GRUPO.migrar_evaluacion_curso
GO

-- Paso 13: Trabajos Pr�cticos
PRINT ''
PRINT '--- PASO 13: TRABAJOS PR�CTICOS ---'
EXEC NOMBRE_GRUPO.migrar_trabajo_practico
GO

-- Paso 14: Ex�menes Finales
PRINT ''
PRINT '--- PASO 14: EX�MENES FINALES ---'
EXEC NOMBRE_GRUPO.migrar_examen_final
GO

-- Paso 15: Inscripciones a Finales
PRINT ''
PRINT '--- PASO 15: INSCRIPCIONES A FINALES ---'
EXEC NOMBRE_GRUPO.migrar_inscripcion_final
GO

-- Paso 16: Evaluaciones de Finales
PRINT ''
PRINT '--- PASO 16: EVALUACIONES DE FINALES ---'
EXEC NOMBRE_GRUPO.migrar_evaluacion_final
GO

-- Paso 17: Facturas
PRINT ''
PRINT '--- PASO 17: FACTURAS ---'
EXEC NOMBRE_GRUPO.migrar_factura
GO

-- Paso 18: Detalles de Factura
PRINT ''
PRINT '--- PASO 18: DETALLES DE FACTURA ---'
EXEC NOMBRE_GRUPO.migrar_detalle_factura
GO

-- Paso 19: Pagos
PRINT ''
PRINT '--- PASO 19: PAGOS ---'
EXEC NOMBRE_GRUPO.migrar_pago
GO

-- Paso 20: Encuestas
PRINT ''
PRINT '--- PASO 20: ENCUESTAS ---'
EXEC NOMBRE_GRUPO.migrar_encuesta
GO

-- Paso 21: Respuestas de Encuestas
PRINT ''
PRINT '--- PASO 21: RESPUESTAS DE ENCUESTAS ---'
EXEC NOMBRE_GRUPO.migrar_respuesta_encuesta
GO

/*******************************************************************************
 * PARTE 11: VALIDACI�N DE LA MIGRACI�N
 ******************************************************************************/

PRINT ''
PRINT '========================================='
PRINT 'VALIDACI�N DE LA MIGRACI�N'
PRINT '========================================='
GO

-- Contar registros en cada tabla
PRINT 'Registros migrados por tabla:'
PRINT ''

DECLARE @count INT

SELECT @count = COUNT(*) FROM NOMBRE_GRUPO.provincia
PRINT 'Provincias: ' + CAST(@count AS VARCHAR)

SELECT @count = COUNT(*) FROM NOMBRE_GRUPO.localidad
PRINT 'Localidades: ' + CAST(@count AS VARCHAR)

SELECT @count = COUNT(*) FROM NOMBRE_GRUPO.institucion
PRINT 'Instituciones: ' + CAST(@count AS VARCHAR)

SELECT @count = COUNT(*) FROM NOMBRE_GRUPO.sede
PRINT 'Sedes: ' + CAST(@count AS VARCHAR)

SELECT @count = COUNT(*) FROM NOMBRE_GRUPO.categoria
PRINT 'Categor�as: ' + CAST(@count AS VARCHAR)

SELECT @count = COUNT(*) FROM NOMBRE_GRUPO.turno
PRINT 'Turnos: ' + CAST(@count AS VARCHAR)

SELECT @count = COUNT(*) FROM NOMBRE_GRUPO.dia
PRINT 'D�as: ' + CAST(@count AS VARCHAR)

SELECT @count = COUNT(*) FROM NOMBRE_GRUPO.medio_pago
PRINT 'Medios de pago: ' + CAST(@count AS VARCHAR)

SELECT @count = COUNT(*) FROM NOMBRE_GRUPO.periodo
PRINT 'Per�odos: ' + CAST(@count AS VARCHAR)

SELECT @count = COUNT(*) FROM NOMBRE_GRUPO.pregunta_encuesta
PRINT 'Preguntas encuesta: ' + CAST(@count AS VARCHAR)

SELECT @count = COUNT(*) FROM NOMBRE_GRUPO.profesor
PRINT 'Profesores: ' + CAST(@count AS VARCHAR)

SELECT @count = COUNT(*) FROM NOMBRE_GRUPO.alumno
PRINT 'Alumnos: ' + CAST(@count AS VARCHAR)

SELECT @count = COUNT(*) FROM NOMBRE_GRUPO.curso
PRINT 'Cursos: ' + CAST(@count AS VARCHAR)

SELECT @count = COUNT(*) FROM NOMBRE_GRUPO.curso_dia
PRINT 'Curso-D�a: ' + CAST(@count AS VARCHAR)

SELECT @count = COUNT(*) FROM NOMBRE_GRUPO.modulo
PRINT 'M�dulos: ' + CAST(@count AS VARCHAR)

SELECT @count = COUNT(*) FROM NOMBRE_GRUPO.inscripcion
PRINT 'Inscripciones: ' + CAST(@count AS VARCHAR)

SELECT @count = COUNT(*) FROM NOMBRE_GRUPO.evaluacion_curso
PRINT 'Evaluaciones curso: ' + CAST(@count AS VARCHAR)

SELECT @count = COUNT(*) FROM NOMBRE_GRUPO.trabajo_practico
PRINT 'Trabajos pr�cticos: ' + CAST(@count AS VARCHAR)

SELECT @count = COUNT(*) FROM NOMBRE_GRUPO.examen_final
PRINT 'Ex�menes finales: ' + CAST(@count AS VARCHAR)

SELECT @count = COUNT(*) FROM NOMBRE_GRUPO.inscripcion_final
PRINT 'Inscripciones finales: ' + CAST(@count AS VARCHAR)

SELECT @count = COUNT(*) FROM NOMBRE_GRUPO.evaluacion_final
PRINT 'Evaluaciones finales: ' + CAST(@count AS VARCHAR)

SELECT @count = COUNT(*) FROM NOMBRE_GRUPO.factura
PRINT 'Facturas: ' + CAST(@count AS VARCHAR)

SELECT @count = COUNT(*) FROM NOMBRE_GRUPO.detalle_factura
PRINT 'Detalles factura: ' + CAST(@count AS VARCHAR)

SELECT @count = COUNT(*) FROM NOMBRE_GRUPO.pago
PRINT 'Pagos: ' + CAST(@count AS VARCHAR)

SELECT @count = COUNT(*) FROM NOMBRE_GRUPO.encuesta
PRINT 'Encuestas: ' + CAST(@count AS VARCHAR)

SELECT @count = COUNT(*) FROM NOMBRE_GRUPO.respuesta_encuesta
PRINT 'Respuestas encuesta: ' + CAST(@count AS VARCHAR)

PRINT ''
PRINT '========================================='
PRINT 'MIGRACI�N COMPLETADA EXITOSAMENTE'
PRINT 'Fecha/Hora: ' + CONVERT(VARCHAR, GETDATE(), 120)
PRINT '========================================='
GO

/*******************************************************************************
 * FIN DEL SCRIPT DE MIGRACI�N
 ******************************************************************************/