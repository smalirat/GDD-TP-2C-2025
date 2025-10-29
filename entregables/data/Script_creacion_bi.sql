/*******************************************************************************
 * TRABAJO PRACTICO - GESTION DE DATOS - BUSINESS INTELLIGENCE
 *
 * Nombre del Grupo: FOR_Y_UN_IF
 * Base de Datos: GD2C2025
 * Modelo: Data Warehouse - Esquema Estrella
 ******************************************************************************/

USE GD2C2025
GO

/*******************************************************************************
 * PARTE 0: LIMPIEZA DE OBJETOS EXISTENTES
 ******************************************************************************/

PRINT '========================================='
PRINT 'INICIANDO LIMPIEZA DE OBJETOS DE BI'
PRINT '========================================='
GO

-- Eliminar vistas
IF OBJECT_ID('FOR_Y_UN_IF.vw_categorias_turnos_solicitados', 'V') IS NOT NULL DROP VIEW FOR_Y_UN_IF.vw_categorias_turnos_solicitados;
IF OBJECT_ID('FOR_Y_UN_IF.vw_tasa_rechazo_inscripciones', 'V') IS NOT NULL DROP VIEW FOR_Y_UN_IF.vw_tasa_rechazo_inscripciones;
IF OBJECT_ID('FOR_Y_UN_IF.vw_desempeno_cursada', 'V') IS NOT NULL DROP VIEW FOR_Y_UN_IF.vw_desempeno_cursada;
IF OBJECT_ID('FOR_Y_UN_IF.vw_tiempo_finalizacion_curso', 'V') IS NOT NULL DROP VIEW FOR_Y_UN_IF.vw_tiempo_finalizacion_curso;
IF OBJECT_ID('FOR_Y_UN_IF.vw_nota_promedio_finales', 'V') IS NOT NULL DROP VIEW FOR_Y_UN_IF.vw_nota_promedio_finales;
IF OBJECT_ID('FOR_Y_UN_IF.vw_ausentismo_finales', 'V') IS NOT NULL DROP VIEW FOR_Y_UN_IF.vw_ausentismo_finales;
IF OBJECT_ID('FOR_Y_UN_IF.vw_desvio_pagos', 'V') IS NOT NULL DROP VIEW FOR_Y_UN_IF.vw_desvio_pagos;
IF OBJECT_ID('FOR_Y_UN_IF.vw_morosidad_financiera', 'V') IS NOT NULL DROP VIEW FOR_Y_UN_IF.vw_morosidad_financiera;
IF OBJECT_ID('FOR_Y_UN_IF.vw_ingresos_categoria', 'V') IS NOT NULL DROP VIEW FOR_Y_UN_IF.vw_ingresos_categoria;
IF OBJECT_ID('FOR_Y_UN_IF.vw_indice_satisfaccion', 'V') IS NOT NULL DROP VIEW FOR_Y_UN_IF.vw_indice_satisfaccion;
GO

-- Eliminar tablas de hechos
IF OBJECT_ID('FOR_Y_UN_IF.hecho_inscripciones', 'U') IS NOT NULL DROP TABLE FOR_Y_UN_IF.hecho_inscripciones;
IF OBJECT_ID('FOR_Y_UN_IF.hecho_cursada', 'U') IS NOT NULL DROP TABLE FOR_Y_UN_IF.hecho_cursada;
IF OBJECT_ID('FOR_Y_UN_IF.hecho_finales', 'U') IS NOT NULL DROP TABLE FOR_Y_UN_IF.hecho_finales;
IF OBJECT_ID('FOR_Y_UN_IF.hecho_pagos', 'U') IS NOT NULL DROP TABLE FOR_Y_UN_IF.hecho_pagos;
IF OBJECT_ID('FOR_Y_UN_IF.hecho_facturacion', 'U') IS NOT NULL DROP TABLE FOR_Y_UN_IF.hecho_facturacion;
IF OBJECT_ID('FOR_Y_UN_IF.hecho_satisfaccion', 'U') IS NOT NULL DROP TABLE FOR_Y_UN_IF.hecho_satisfaccion;
GO

-- Eliminar dimensiones
IF OBJECT_ID('FOR_Y_UN_IF.dim_tiempo', 'U') IS NOT NULL DROP TABLE FOR_Y_UN_IF.dim_tiempo;
IF OBJECT_ID('FOR_Y_UN_IF.dim_sede', 'U') IS NOT NULL DROP TABLE FOR_Y_UN_IF.dim_sede;
IF OBJECT_ID('FOR_Y_UN_IF.dim_rango_etario_alumno', 'U') IS NOT NULL DROP TABLE FOR_Y_UN_IF.dim_rango_etario_alumno;
IF OBJECT_ID('FOR_Y_UN_IF.dim_rango_etario_profesor', 'U') IS NOT NULL DROP TABLE FOR_Y_UN_IF.dim_rango_etario_profesor;
IF OBJECT_ID('FOR_Y_UN_IF.dim_turno', 'U') IS NOT NULL DROP TABLE FOR_Y_UN_IF.dim_turno;
IF OBJECT_ID('FOR_Y_UN_IF.dim_categoria', 'U') IS NOT NULL DROP TABLE FOR_Y_UN_IF.dim_categoria;
IF OBJECT_ID('FOR_Y_UN_IF.dim_medio_pago', 'U') IS NOT NULL DROP TABLE FOR_Y_UN_IF.dim_medio_pago;
IF OBJECT_ID('FOR_Y_UN_IF.dim_satisfaccion', 'U') IS NOT NULL DROP TABLE FOR_Y_UN_IF.dim_satisfaccion;
GO

PRINT 'Limpieza completada'
GO

/*******************************************************************************
 * PARTE 1: CREACION DE DIMENSIONES
 ******************************************************************************/

PRINT '========================================='
PRINT 'CREANDO DIMENSIONES'
PRINT '========================================='
GO

-- DIMENSION TIEMPO
CREATE TABLE FOR_Y_UN_IF.dim_tiempo (
    tiempo_id INT IDENTITY(1,1) PRIMARY KEY,
    fecha DATE NOT NULL,
    anio INT NOT NULL,
    mes INT NOT NULL,
    cuatrimestre INT NOT NULL,
    semestre INT NOT NULL,
    nombre_mes VARCHAR(20) NOT NULL,
    CONSTRAINT UQ_dim_tiempo_fecha UNIQUE (fecha)
)
PRINT 'Dimension dim_tiempo creada'
GO

-- DIMENSION SEDE
CREATE TABLE FOR_Y_UN_IF.dim_sede (
    sede_id INT PRIMARY KEY,
    sede_nombre NVARCHAR(255) NOT NULL,
    provincia NVARCHAR(255) NOT NULL,
    localidad NVARCHAR(255) NOT NULL,
    institucion_nombre NVARCHAR(255) NOT NULL
)
PRINT 'Dimension dim_sede creada'
GO

-- DIMENSION RANGO ETARIO ALUMNO
CREATE TABLE FOR_Y_UN_IF.dim_rango_etario_alumno (
    rango_etario_alumno_id INT IDENTITY(1,1) PRIMARY KEY,
    rango_descripcion VARCHAR(20) NOT NULL UNIQUE
)
PRINT 'Dimension dim_rango_etario_alumno creada'
GO

-- DIMENSION RANGO ETARIO PROFESOR
CREATE TABLE FOR_Y_UN_IF.dim_rango_etario_profesor (
    rango_etario_profesor_id INT IDENTITY(1,1) PRIMARY KEY,
    rango_descripcion VARCHAR(20) NOT NULL UNIQUE
)
PRINT 'Dimension dim_rango_etario_profesor creada'
GO

-- DIMENSION TURNO
CREATE TABLE FOR_Y_UN_IF.dim_turno (
    turno_id INT PRIMARY KEY,
    turno_nombre VARCHAR(255) NOT NULL
)
PRINT 'Dimension dim_turno creada'
GO

-- DIMENSION CATEGORIA
CREATE TABLE FOR_Y_UN_IF.dim_categoria (
    categoria_id INT PRIMARY KEY,
    categoria_nombre VARCHAR(255) NOT NULL
)
PRINT 'Dimension dim_categoria creada'
GO

-- DIMENSION MEDIO PAGO
CREATE TABLE FOR_Y_UN_IF.dim_medio_pago (
    medio_pago_id INT PRIMARY KEY,
    medio_pago_nombre VARCHAR(255) NOT NULL
)
PRINT 'Dimension dim_medio_pago creada'
GO

-- DIMENSION SATISFACCION
CREATE TABLE FOR_Y_UN_IF.dim_satisfaccion (
    satisfaccion_id INT IDENTITY(1,1) PRIMARY KEY,
    bloque_descripcion VARCHAR(20) NOT NULL UNIQUE,
    rango_min INT NOT NULL,
    rango_max INT NOT NULL
)
PRINT 'Dimension dim_satisfaccion creada'
GO

/*******************************************************************************
 * PARTE 2: CREACION DE TABLAS DE HECHOS
 ******************************************************************************/

PRINT '========================================='
PRINT 'CREANDO TABLAS DE HECHOS'
PRINT '========================================='
GO

-- HECHO INSCRIPCIONES (Indicadores 1 y 2)
CREATE TABLE FOR_Y_UN_IF.hecho_inscripciones (
    inscripcion_id INT IDENTITY(1,1) PRIMARY KEY,
    tiempo_id INT NOT NULL,
    sede_id INT NOT NULL,
    turno_id INT NOT NULL,
    categoria_id INT NOT NULL,
    cantidad_inscripciones INT NOT NULL DEFAULT 0,
    cantidad_rechazadas INT NOT NULL DEFAULT 0,
    cantidad_aceptadas INT NOT NULL DEFAULT 0,
    CONSTRAINT FK_hecho_inscripciones_tiempo FOREIGN KEY (tiempo_id)
        REFERENCES FOR_Y_UN_IF.dim_tiempo(tiempo_id),
    CONSTRAINT FK_hecho_inscripciones_sede FOREIGN KEY (sede_id)
        REFERENCES FOR_Y_UN_IF.dim_sede(sede_id),
    CONSTRAINT FK_hecho_inscripciones_turno FOREIGN KEY (turno_id)
        REFERENCES FOR_Y_UN_IF.dim_turno(turno_id),
    CONSTRAINT FK_hecho_inscripciones_categoria FOREIGN KEY (categoria_id)
        REFERENCES FOR_Y_UN_IF.dim_categoria(categoria_id)
)
PRINT 'Tabla hecho_inscripciones creada'
GO

-- HECHO CURSADA (Indicador 3)
CREATE TABLE FOR_Y_UN_IF.hecho_cursada (
    cursada_id INT IDENTITY(1,1) PRIMARY KEY,
    tiempo_id INT NOT NULL,
    sede_id INT NOT NULL,
    categoria_id INT NOT NULL,
    cantidad_alumnos INT NOT NULL DEFAULT 0,
    cantidad_aprobados INT NOT NULL DEFAULT 0,
    CONSTRAINT FK_hecho_cursada_tiempo FOREIGN KEY (tiempo_id)
        REFERENCES FOR_Y_UN_IF.dim_tiempo(tiempo_id),
    CONSTRAINT FK_hecho_cursada_sede FOREIGN KEY (sede_id)
        REFERENCES FOR_Y_UN_IF.dim_sede(sede_id),
    CONSTRAINT FK_hecho_cursada_categoria FOREIGN KEY (categoria_id)
        REFERENCES FOR_Y_UN_IF.dim_categoria(categoria_id)
)
PRINT 'Tabla hecho_cursada creada'
GO

-- HECHO FINALES (Indicadores 4, 5 y 6)
CREATE TABLE FOR_Y_UN_IF.hecho_finales (
    final_id INT IDENTITY(1,1) PRIMARY KEY,
    tiempo_id INT NOT NULL,
    sede_id INT NOT NULL,
    categoria_id INT NOT NULL,
    rango_etario_alumno_id INT NOT NULL,
    cantidad_inscriptos INT NOT NULL DEFAULT 0,
    cantidad_presentes INT NOT NULL DEFAULT 0,
    cantidad_ausentes INT NOT NULL DEFAULT 0,
    suma_notas DECIMAL(18,2) NOT NULL DEFAULT 0,
    suma_dias_finalizacion INT NOT NULL DEFAULT 0,
    CONSTRAINT FK_hecho_finales_tiempo FOREIGN KEY (tiempo_id)
        REFERENCES FOR_Y_UN_IF.dim_tiempo(tiempo_id),
    CONSTRAINT FK_hecho_finales_sede FOREIGN KEY (sede_id)
        REFERENCES FOR_Y_UN_IF.dim_sede(sede_id),
    CONSTRAINT FK_hecho_finales_categoria FOREIGN KEY (categoria_id)
        REFERENCES FOR_Y_UN_IF.dim_categoria(categoria_id),
    CONSTRAINT FK_hecho_finales_rango_etario_alumno FOREIGN KEY (rango_etario_alumno_id)
        REFERENCES FOR_Y_UN_IF.dim_rango_etario_alumno(rango_etario_alumno_id)
)
PRINT 'Tabla hecho_finales creada'
GO

-- HECHO PAGOS (Indicador 7)
CREATE TABLE FOR_Y_UN_IF.hecho_pagos (
    pago_id INT IDENTITY(1,1) PRIMARY KEY,
    tiempo_id INT NOT NULL,
    sede_id INT NOT NULL,
    medio_pago_id INT NOT NULL,
    cantidad_pagos INT NOT NULL DEFAULT 0,
    cantidad_pagos_fuera_termino INT NOT NULL DEFAULT 0,
    importe_total DECIMAL(18,2) NOT NULL DEFAULT 0,
    CONSTRAINT FK_hecho_pagos_tiempo FOREIGN KEY (tiempo_id)
        REFERENCES FOR_Y_UN_IF.dim_tiempo(tiempo_id),
    CONSTRAINT FK_hecho_pagos_sede FOREIGN KEY (sede_id)
        REFERENCES FOR_Y_UN_IF.dim_sede(sede_id),
    CONSTRAINT FK_hecho_pagos_medio_pago FOREIGN KEY (medio_pago_id)
        REFERENCES FOR_Y_UN_IF.dim_medio_pago(medio_pago_id)
)
PRINT 'Tabla hecho_pagos creada'
GO

-- HECHO FACTURACION (Indicadores 8 y 9)
CREATE TABLE FOR_Y_UN_IF.hecho_facturacion (
    facturacion_id INT IDENTITY(1,1) PRIMARY KEY,
    tiempo_id INT NOT NULL,
    sede_id INT NOT NULL,
    categoria_id INT NOT NULL,
    importe_facturado DECIMAL(18,2) NOT NULL DEFAULT 0,
    importe_pagado DECIMAL(18,2) NOT NULL DEFAULT 0,
    importe_adeudado DECIMAL(18,2) NOT NULL DEFAULT 0,
    cantidad_facturas INT NOT NULL DEFAULT 0,
    CONSTRAINT FK_hecho_facturacion_tiempo FOREIGN KEY (tiempo_id)
        REFERENCES FOR_Y_UN_IF.dim_tiempo(tiempo_id),
    CONSTRAINT FK_hecho_facturacion_sede FOREIGN KEY (sede_id)
        REFERENCES FOR_Y_UN_IF.dim_sede(sede_id),
    CONSTRAINT FK_hecho_facturacion_categoria FOREIGN KEY (categoria_id)
        REFERENCES FOR_Y_UN_IF.dim_categoria(categoria_id)
)
PRINT 'Tabla hecho_facturacion creada'
GO

-- HECHO SATISFACCION (Indicador 10)
CREATE TABLE FOR_Y_UN_IF.hecho_satisfaccion (
    satisfaccion_id INT IDENTITY(1,1) PRIMARY KEY,
    tiempo_id INT NOT NULL,
    sede_id INT NOT NULL,
    rango_etario_profesor_id INT NOT NULL,
    bloque_satisfaccion_id INT NOT NULL,
    cantidad_respuestas INT NOT NULL DEFAULT 0,
    CONSTRAINT FK_hecho_satisfaccion_tiempo FOREIGN KEY (tiempo_id)
        REFERENCES FOR_Y_UN_IF.dim_tiempo(tiempo_id),
    CONSTRAINT FK_hecho_satisfaccion_sede FOREIGN KEY (sede_id)
        REFERENCES FOR_Y_UN_IF.dim_sede(sede_id),
    CONSTRAINT FK_hecho_satisfaccion_rango_profesor FOREIGN KEY (rango_etario_profesor_id)
        REFERENCES FOR_Y_UN_IF.dim_rango_etario_profesor(rango_etario_profesor_id),
    CONSTRAINT FK_hecho_satisfaccion_bloque FOREIGN KEY (bloque_satisfaccion_id)
        REFERENCES FOR_Y_UN_IF.dim_satisfaccion(satisfaccion_id)
)
PRINT 'Tabla hecho_satisfaccion creada'
GO

/*******************************************************************************
 * PARTE 3: CARGA DE DIMENSIONES
 ******************************************************************************/

PRINT '========================================='
PRINT 'CARGANDO DIMENSIONES'
PRINT '========================================='
GO

-- CARGA DIMENSION TIEMPO
PRINT 'Cargando dimension tiempo...'

DECLARE @FechaInicio DATE = '2020-01-01'
DECLARE @FechaFin DATE = '2030-12-31'
DECLARE @FechaActual DATE = @FechaInicio

WHILE @FechaActual <= @FechaFin
BEGIN
    INSERT INTO FOR_Y_UN_IF.dim_tiempo (fecha, anio, mes, cuatrimestre, semestre, nombre_mes)
    VALUES (
        @FechaActual,
        YEAR(@FechaActual),
        MONTH(@FechaActual),
        CASE
            WHEN MONTH(@FechaActual) BETWEEN 1 AND 4 THEN 1
            WHEN MONTH(@FechaActual) BETWEEN 5 AND 8 THEN 2
            ELSE 3
        END,
        CASE
            WHEN MONTH(@FechaActual) BETWEEN 1 AND 6 THEN 1
            ELSE 2
        END,
        CASE MONTH(@FechaActual)
            WHEN 1 THEN 'Enero'
            WHEN 2 THEN 'Febrero'
            WHEN 3 THEN 'Marzo'
            WHEN 4 THEN 'Abril'
            WHEN 5 THEN 'Mayo'
            WHEN 6 THEN 'Junio'
            WHEN 7 THEN 'Julio'
            WHEN 8 THEN 'Agosto'
            WHEN 9 THEN 'Septiembre'
            WHEN 10 THEN 'Octubre'
            WHEN 11 THEN 'Noviembre'
            WHEN 12 THEN 'Diciembre'
        END
    )
    SET @FechaActual = DATEADD(DAY, 1, @FechaActual)
END

PRINT 'Dimension tiempo cargada: ' + CAST((SELECT COUNT(*) FROM FOR_Y_UN_IF.dim_tiempo) AS VARCHAR) + ' registros'
GO

-- CARGA DIMENSION SEDE
PRINT 'Cargando dimension sede...'

INSERT INTO FOR_Y_UN_IF.dim_sede (sede_id, sede_nombre, provincia, localidad, institucion_nombre)
SELECT DISTINCT
    s.sede_id,
    s.sede_nombre,
    p.provincia_nombre,
    l.localidad_nombre,
    i.institucion_nombre
FROM FOR_Y_UN_IF.sede s
JOIN FOR_Y_UN_IF.localidad l ON s.localidad_id = l.localidad_id
JOIN FOR_Y_UN_IF.provincia p ON l.provincia_id = p.provincia_id
JOIN FOR_Y_UN_IF.institucion i ON s.institucion_cuit = i.institucion_cuit

PRINT 'Dimension sede cargada: ' + CAST(@@ROWCOUNT AS VARCHAR) + ' registros'
GO

-- CARGA DIMENSION RANGO ETARIO ALUMNO
PRINT 'Cargando dimension rango etario alumno...'

INSERT INTO FOR_Y_UN_IF.dim_rango_etario_alumno (rango_descripcion)
VALUES ('< 25'), ('25 - 35'), ('35 - 50'), ('> 50')

PRINT 'Dimension rango etario alumno cargada: ' + CAST(@@ROWCOUNT AS VARCHAR) + ' registros'
GO

-- CARGA DIMENSION RANGO ETARIO PROFESOR
PRINT 'Cargando dimension rango etario profesor...'

INSERT INTO FOR_Y_UN_IF.dim_rango_etario_profesor (rango_descripcion)
VALUES ('25 - 35'), ('35 - 50'), ('> 50')

PRINT 'Dimension rango etario profesor cargada: ' + CAST(@@ROWCOUNT AS VARCHAR) + ' registros'
GO

-- CARGA DIMENSION TURNO
PRINT 'Cargando dimension turno...'

INSERT INTO FOR_Y_UN_IF.dim_turno (turno_id, turno_nombre)
SELECT turno_id, turno_nombre
FROM FOR_Y_UN_IF.turno

PRINT 'Dimension turno cargada: ' + CAST(@@ROWCOUNT AS VARCHAR) + ' registros'
GO

-- CARGA DIMENSION CATEGORIA
PRINT 'Cargando dimension categoria...'

INSERT INTO FOR_Y_UN_IF.dim_categoria (categoria_id, categoria_nombre)
SELECT categoria_id, categoria_nombre
FROM FOR_Y_UN_IF.categoria

PRINT 'Dimension categoria cargada: ' + CAST(@@ROWCOUNT AS VARCHAR) + ' registros'
GO

-- CARGA DIMENSION MEDIO PAGO
PRINT 'Cargando dimension medio pago...'

INSERT INTO FOR_Y_UN_IF.dim_medio_pago (medio_pago_id, medio_pago_nombre)
SELECT medio_pago_id, medio_pago_nombre
FROM FOR_Y_UN_IF.medio_pago

PRINT 'Dimension medio pago cargada: ' + CAST(@@ROWCOUNT AS VARCHAR) + ' registros'
GO

-- CARGA DIMENSION SATISFACCION
PRINT 'Cargando dimension satisfaccion...'

INSERT INTO FOR_Y_UN_IF.dim_satisfaccion (bloque_descripcion, rango_min, rango_max)
VALUES
    ('Satisfechos', 7, 10),
    ('Neutrales', 5, 6),
    ('Insatisfechos', 1, 4)

PRINT 'Dimension satisfaccion cargada: ' + CAST(@@ROWCOUNT AS VARCHAR) + ' registros'
GO

/*******************************************************************************
 * PARTE 4: FUNCIONES AUXILIARES
 ******************************************************************************/

PRINT '========================================='
PRINT 'CREANDO FUNCIONES AUXILIARES'
PRINT '========================================='
GO

-- Función para calcular rango etario de alumno
CREATE FUNCTION FOR_Y_UN_IF.fn_obtener_rango_etario_alumno(@edad INT)
RETURNS INT
AS
BEGIN
    DECLARE @rango_id INT

    SELECT @rango_id = rango_etario_alumno_id
    FROM FOR_Y_UN_IF.dim_rango_etario_alumno
    WHERE (@edad < 25 AND rango_descripcion = '< 25')
       OR (@edad BETWEEN 25 AND 35 AND rango_descripcion = '25 - 35')
       OR (@edad BETWEEN 36 AND 50 AND rango_descripcion = '35 - 50')
       OR (@edad > 50 AND rango_descripcion = '> 50')

    RETURN @rango_id
END
GO
PRINT 'Funcion fn_obtener_rango_etario_alumno creada'
GO

-- Función para calcular rango etario de profesor
CREATE FUNCTION FOR_Y_UN_IF.fn_obtener_rango_etario_profesor(@edad INT)
RETURNS INT
AS
BEGIN
    DECLARE @rango_id INT

    SELECT @rango_id = rango_etario_profesor_id
    FROM FOR_Y_UN_IF.dim_rango_etario_profesor
    WHERE (@edad BETWEEN 25 AND 35 AND rango_descripcion = '25 - 35')
       OR (@edad BETWEEN 36 AND 50 AND rango_descripcion = '35 - 50')
       OR (@edad > 50 AND rango_descripcion = '> 50')

    RETURN @rango_id
END
GO
PRINT 'Funcion fn_obtener_rango_etario_profesor creada'
GO

-- Función para obtener bloque de satisfacción
CREATE FUNCTION FOR_Y_UN_IF.fn_obtener_bloque_satisfaccion(@nota INT)
RETURNS INT
AS
BEGIN
    DECLARE @bloque_id INT

    SELECT @bloque_id = satisfaccion_id
    FROM FOR_Y_UN_IF.dim_satisfaccion
    WHERE @nota BETWEEN rango_min AND rango_max

    RETURN @bloque_id
END
GO
PRINT 'Funcion fn_obtener_bloque_satisfaccion creada'
GO

/*******************************************************************************
 * PARTE 5: CARGA DE HECHOS
 ******************************************************************************/

PRINT '========================================='
PRINT 'CARGANDO TABLAS DE HECHOS'
PRINT '========================================='
GO

-- CARGA HECHO INSCRIPCIONES
PRINT 'Cargando hecho inscripciones...'

INSERT INTO FOR_Y_UN_IF.hecho_inscripciones (
    tiempo_id,
    sede_id,
    turno_id,
    categoria_id,
    cantidad_inscripciones,
    cantidad_rechazadas,
    cantidad_aceptadas
)
SELECT
    t.tiempo_id,
    c.sede_id,
    c.turno_id,
    c.categoria_id,
    COUNT(*) AS cantidad_inscripciones,
    SUM(CASE WHEN i.inscripcion_estado = 'Rechazada' THEN 1 ELSE 0 END) AS cantidad_rechazadas,
    SUM(CASE WHEN i.inscripcion_estado = 'Aceptada' THEN 1 ELSE 0 END) AS cantidad_aceptadas
FROM FOR_Y_UN_IF.inscripcion i
JOIN FOR_Y_UN_IF.curso c ON i.curso_codigo = c.curso_codigo
JOIN FOR_Y_UN_IF.dim_tiempo t ON CAST(i.inscripcion_fecha AS DATE) = t.fecha
GROUP BY t.tiempo_id, c.sede_id, c.turno_id, c.categoria_id

PRINT 'Hecho inscripciones cargado: ' + CAST(@@ROWCOUNT AS VARCHAR) + ' registros'
GO

-- CARGA HECHO CURSADA
PRINT 'Cargando hecho cursada...'

INSERT INTO FOR_Y_UN_IF.hecho_cursada (
    tiempo_id,
    sede_id,
    categoria_id,
    cantidad_alumnos,
    cantidad_aprobados
)
SELECT
    t.tiempo_id,
    c.sede_id,
    c.categoria_id,
    COUNT(DISTINCT i.alumno_legajo) AS cantidad_alumnos,
    SUM(CASE
        WHEN aprobado.alumno_legajo IS NOT NULL THEN 1
        ELSE 0
    END) AS cantidad_aprobados
FROM FOR_Y_UN_IF.inscripcion i
JOIN FOR_Y_UN_IF.curso c ON i.curso_codigo = c.curso_codigo
JOIN FOR_Y_UN_IF.dim_tiempo t ON CAST(c.curso_fecha_inicio AS DATE) = t.fecha
LEFT JOIN (
    -- Alumnos aprobados: tienen nota >= 4 en todos los módulos y en el TP
    SELECT DISTINCT i2.alumno_legajo, i2.curso_codigo
    FROM FOR_Y_UN_IF.inscripcion i2
    WHERE i2.inscripcion_numero NOT IN (
        -- Excluir alumnos con alguna nota < 4 en evaluaciones de módulos
        SELECT ec.inscripcion_numero
        FROM FOR_Y_UN_IF.evaluacion_curso ec
        WHERE ec.evaluacion_nota < 4
    )
    AND i2.inscripcion_numero NOT IN (
        -- Excluir alumnos con nota < 4 en trabajo práctico
        SELECT tp.inscripcion_numero
        FROM FOR_Y_UN_IF.trabajo_practico tp
        WHERE tp.trabajo_practico_nota < 4
    )
) aprobado ON i.alumno_legajo = aprobado.alumno_legajo
           AND i.curso_codigo = aprobado.curso_codigo
WHERE i.inscripcion_estado = 'Aceptada'
GROUP BY t.tiempo_id, c.sede_id, c.categoria_id

PRINT 'Hecho cursada cargado: ' + CAST(@@ROWCOUNT AS VARCHAR) + ' registros'
GO

-- CARGA HECHO FINALES
PRINT 'Cargando hecho finales...'

INSERT INTO FOR_Y_UN_IF.hecho_finales (
    tiempo_id,
    sede_id,
    categoria_id,
    rango_etario_alumno_id,
    cantidad_inscriptos,
    cantidad_presentes,
    cantidad_ausentes,
    suma_notas,
    suma_dias_finalizacion
)
SELECT
    t.tiempo_id,
    c.sede_id,
    c.categoria_id,
    FOR_Y_UN_IF.fn_obtener_rango_etario_alumno(
        DATEDIFF(YEAR, a.alumno_fecha_nacimiento, ef.examen_final_fecha)
    ) AS rango_etario_alumno_id,
    COUNT(*) AS cantidad_inscriptos,
    SUM(CASE WHEN evf.evaluacion_final_presente = 1 THEN 1 ELSE 0 END) AS cantidad_presentes,
    SUM(CASE WHEN evf.evaluacion_final_presente = 0 THEN 1 ELSE 0 END) AS cantidad_ausentes,
    SUM(CASE WHEN evf.evaluacion_final_presente = 1 THEN evf.evaluacion_final_nota ELSE 0 END) AS suma_notas,
    SUM(CASE
        WHEN evf.evaluacion_final_presente = 1 AND evf.evaluacion_final_nota >= 4
        THEN DATEDIFF(DAY, c.curso_fecha_inicio, ef.examen_final_fecha)
        ELSE 0
    END) AS suma_dias_finalizacion
FROM FOR_Y_UN_IF.inscripcion_final inf
JOIN FOR_Y_UN_IF.alumno a ON inf.alumno_legajo = a.alumno_legajo
JOIN FOR_Y_UN_IF.examen_final ef ON inf.examen_final_id = ef.examen_final_id
JOIN FOR_Y_UN_IF.curso c ON ef.curso_codigo = c.curso_codigo
JOIN FOR_Y_UN_IF.dim_tiempo t ON CAST(ef.examen_final_fecha AS DATE) = t.fecha
LEFT JOIN FOR_Y_UN_IF.evaluacion_final evf ON inf.inscripcion_final_nro = evf.inscripcion_final_nro
GROUP BY
    t.tiempo_id,
    c.sede_id,
    c.categoria_id,
    FOR_Y_UN_IF.fn_obtener_rango_etario_alumno(
        DATEDIFF(YEAR, a.alumno_fecha_nacimiento, ef.examen_final_fecha)
    )

PRINT 'Hecho finales cargado: ' + CAST(@@ROWCOUNT AS VARCHAR) + ' registros'
GO

-- CARGA HECHO PAGOS
PRINT 'Cargando hecho pagos...'

INSERT INTO FOR_Y_UN_IF.hecho_pagos (
    tiempo_id,
    sede_id,
    medio_pago_id,
    cantidad_pagos,
    cantidad_pagos_fuera_termino,
    importe_total
)
SELECT
    t.tiempo_id,
    c.sede_id,
    p.medio_pago_id,
    COUNT(*) AS cantidad_pagos,
    SUM(CASE
        WHEN p.pago_fecha > f.factura_fecha_vencimiento THEN 1
        ELSE 0
    END) AS cantidad_pagos_fuera_termino,
    SUM(p.pago_importe) AS importe_total
FROM FOR_Y_UN_IF.pago p
JOIN FOR_Y_UN_IF.factura f ON p.factura_numero = f.factura_numero
JOIN FOR_Y_UN_IF.detalle_factura df ON f.factura_numero = df.factura_numero
JOIN FOR_Y_UN_IF.curso c ON df.curso_codigo = c.curso_codigo
JOIN FOR_Y_UN_IF.dim_tiempo t ON CAST(p.pago_fecha AS DATE) = t.fecha
GROUP BY t.tiempo_id, c.sede_id, p.medio_pago_id

PRINT 'Hecho pagos cargado: ' + CAST(@@ROWCOUNT AS VARCHAR) + ' registros'
GO

-- CARGA HECHO FACTURACION
PRINT 'Cargando hecho facturacion...'

INSERT INTO FOR_Y_UN_IF.hecho_facturacion (
    tiempo_id,
    sede_id,
    categoria_id,
    importe_facturado,
    importe_pagado,
    importe_adeudado,
    cantidad_facturas
)
SELECT
    t.tiempo_id,
    c.sede_id,
    c.categoria_id,
    SUM(df.detalle_importe) AS importe_facturado,
    SUM(ISNULL(pagos.total_pagado, 0)) AS importe_pagado,
    SUM(df.detalle_importe) - SUM(ISNULL(pagos.total_pagado, 0)) AS importe_adeudado,
    COUNT(DISTINCT f.factura_numero) AS cantidad_facturas
FROM FOR_Y_UN_IF.factura f
JOIN FOR_Y_UN_IF.detalle_factura df ON f.factura_numero = df.factura_numero
JOIN FOR_Y_UN_IF.curso c ON df.curso_codigo = c.curso_codigo
JOIN FOR_Y_UN_IF.dim_tiempo t ON CAST(f.factura_fecha_emision AS DATE) = t.fecha
LEFT JOIN (
    SELECT factura_numero, SUM(pago_importe) AS total_pagado
    FROM FOR_Y_UN_IF.pago
    GROUP BY factura_numero
) pagos ON f.factura_numero = pagos.factura_numero
GROUP BY t.tiempo_id, c.sede_id, c.categoria_id

PRINT 'Hecho facturacion cargado: ' + CAST(@@ROWCOUNT AS VARCHAR) + ' registros'
GO

-- CARGA HECHO SATISFACCION
PRINT 'Cargando hecho satisfaccion...'

INSERT INTO FOR_Y_UN_IF.hecho_satisfaccion (
    tiempo_id,
    sede_id,
    rango_etario_profesor_id,
    bloque_satisfaccion_id,
    cantidad_respuestas
)
SELECT
    t.tiempo_id,
    c.sede_id,
    FOR_Y_UN_IF.fn_obtener_rango_etario_profesor(
        DATEDIFF(YEAR, p.profesor_fecha_nacimiento, e.encuesta_fecha_registro)
    ) AS rango_etario_profesor_id,
    FOR_Y_UN_IF.fn_obtener_bloque_satisfaccion(re.respuesta_nota) AS bloque_satisfaccion_id,
    COUNT(*) AS cantidad_respuestas
FROM FOR_Y_UN_IF.encuesta e
JOIN FOR_Y_UN_IF.respuesta_encuesta re ON e.encuesta_id = re.encuesta_id
JOIN FOR_Y_UN_IF.curso c ON e.curso_codigo = c.curso_codigo
JOIN FOR_Y_UN_IF.profesor p ON c.profesor_dni = p.profesor_dni
JOIN FOR_Y_UN_IF.dim_tiempo t ON CAST(e.encuesta_fecha_registro AS DATE) = t.fecha
GROUP BY
    t.tiempo_id,
    c.sede_id,
    FOR_Y_UN_IF.fn_obtener_rango_etario_profesor(
        DATEDIFF(YEAR, p.profesor_fecha_nacimiento, e.encuesta_fecha_registro)
    ),
    FOR_Y_UN_IF.fn_obtener_bloque_satisfaccion(re.respuesta_nota)

PRINT 'Hecho satisfaccion cargado: ' + CAST(@@ROWCOUNT AS VARCHAR) + ' registros'
GO

/*******************************************************************************
 * PARTE 6: CREACION DE VISTAS PARA LOS 10 INDICADORES
 ******************************************************************************/

PRINT '========================================='
PRINT 'CREANDO VISTAS DE INDICADORES'
PRINT '========================================='
GO

-- VISTA 1: Categorías y turnos más solicitados
CREATE VIEW FOR_Y_UN_IF.vw_categorias_turnos_solicitados
AS
SELECT
    t.anio,
    s.sede_nombre,
    c.categoria_nombre,
    tu.turno_nombre,
    SUM(hi.cantidad_inscripciones) AS total_inscripciones
FROM FOR_Y_UN_IF.hecho_inscripciones hi
JOIN FOR_Y_UN_IF.dim_tiempo t ON hi.tiempo_id = t.tiempo_id
JOIN FOR_Y_UN_IF.dim_sede s ON hi.sede_id = s.sede_id
JOIN FOR_Y_UN_IF.dim_categoria c ON hi.categoria_id = c.categoria_id
JOIN FOR_Y_UN_IF.dim_turno tu ON hi.turno_id = tu.turno_id
GROUP BY t.anio, s.sede_nombre, c.categoria_nombre, tu.turno_nombre
GO
PRINT 'Vista vw_categorias_turnos_solicitados creada'
GO

-- VISTA 2: Tasa de rechazo de inscripciones
CREATE VIEW FOR_Y_UN_IF.vw_tasa_rechazo_inscripciones
AS
SELECT
    t.anio,
    t.mes,
    t.nombre_mes,
    s.sede_nombre,
    SUM(hi.cantidad_inscripciones) AS total_inscripciones,
    SUM(hi.cantidad_rechazadas) AS total_rechazadas,
    CASE
        WHEN SUM(hi.cantidad_inscripciones) > 0
        THEN CAST(SUM(hi.cantidad_rechazadas) * 100.0 / SUM(hi.cantidad_inscripciones) AS DECIMAL(10,2))
        ELSE 0
    END AS porcentaje_rechazo
FROM FOR_Y_UN_IF.hecho_inscripciones hi
JOIN FOR_Y_UN_IF.dim_tiempo t ON hi.tiempo_id = t.tiempo_id
JOIN FOR_Y_UN_IF.dim_sede s ON hi.sede_id = s.sede_id
GROUP BY t.anio, t.mes, t.nombre_mes, s.sede_nombre
GO
PRINT 'Vista vw_tasa_rechazo_inscripciones creada'
GO

-- VISTA 3: Comparación de desempeño de cursada por sede
CREATE VIEW FOR_Y_UN_IF.vw_desempeno_cursada
AS
SELECT
    t.anio,
    s.sede_nombre,
    SUM(hc.cantidad_alumnos) AS total_alumnos,
    SUM(hc.cantidad_aprobados) AS total_aprobados,
    CASE
        WHEN SUM(hc.cantidad_alumnos) > 0
        THEN CAST(SUM(hc.cantidad_aprobados) * 100.0 / SUM(hc.cantidad_alumnos) AS DECIMAL(10,2))
        ELSE 0
    END AS porcentaje_aprobacion
FROM FOR_Y_UN_IF.hecho_cursada hc
JOIN FOR_Y_UN_IF.dim_tiempo t ON hc.tiempo_id = t.tiempo_id
JOIN FOR_Y_UN_IF.dim_sede s ON hc.sede_id = s.sede_id
GROUP BY t.anio, s.sede_nombre
GO
PRINT 'Vista vw_desempeno_cursada creada'
GO

-- VISTA 4: Tiempo promedio de finalización de curso
CREATE VIEW FOR_Y_UN_IF.vw_tiempo_finalizacion_curso
AS
SELECT
    t.anio,
    c.categoria_nombre,
    SUM(hf.cantidad_presentes) AS total_finalizaron,
    CASE
        WHEN SUM(hf.cantidad_presentes) > 0
        THEN CAST(SUM(hf.suma_dias_finalizacion) * 1.0 / SUM(hf.cantidad_presentes) AS DECIMAL(10,2))
        ELSE 0
    END AS promedio_dias_finalizacion
FROM FOR_Y_UN_IF.hecho_finales hf
JOIN FOR_Y_UN_IF.dim_tiempo t ON hf.tiempo_id = t.tiempo_id
JOIN FOR_Y_UN_IF.dim_categoria c ON hf.categoria_id = c.categoria_id
WHERE hf.cantidad_presentes > 0
GROUP BY t.anio, c.categoria_nombre
GO
PRINT 'Vista vw_tiempo_finalizacion_curso creada'
GO

-- VISTA 5: Nota promedio de finales
CREATE VIEW FOR_Y_UN_IF.vw_nota_promedio_finales
AS
SELECT
    t.anio,
    t.semestre,
    c.categoria_nombre,
    r.rango_descripcion AS rango_etario,
    SUM(hf.cantidad_presentes) AS total_presentes,
    CASE
        WHEN SUM(hf.cantidad_presentes) > 0
        THEN CAST(SUM(hf.suma_notas) * 1.0 / SUM(hf.cantidad_presentes) AS DECIMAL(10,2))
        ELSE 0
    END AS nota_promedio
FROM FOR_Y_UN_IF.hecho_finales hf
JOIN FOR_Y_UN_IF.dim_tiempo t ON hf.tiempo_id = t.tiempo_id
JOIN FOR_Y_UN_IF.dim_categoria c ON hf.categoria_id = c.categoria_id
JOIN FOR_Y_UN_IF.dim_rango_etario_alumno r ON hf.rango_etario_alumno_id = r.rango_etario_alumno_id
WHERE hf.cantidad_presentes > 0
GROUP BY t.anio, t.semestre, c.categoria_nombre, r.rango_descripcion
GO
PRINT 'Vista vw_nota_promedio_finales creada'
GO

-- VISTA 6: Tasa de ausentismo en finales
CREATE VIEW FOR_Y_UN_IF.vw_ausentismo_finales
AS
SELECT
    t.anio,
    t.semestre,
    s.sede_nombre,
    SUM(hf.cantidad_inscriptos) AS total_inscriptos,
    SUM(hf.cantidad_ausentes) AS total_ausentes,
    CASE
        WHEN SUM(hf.cantidad_inscriptos) > 0
        THEN CAST(SUM(hf.cantidad_ausentes) * 100.0 / SUM(hf.cantidad_inscriptos) AS DECIMAL(10,2))
        ELSE 0
    END AS porcentaje_ausentismo
FROM FOR_Y_UN_IF.hecho_finales hf
JOIN FOR_Y_UN_IF.dim_tiempo t ON hf.tiempo_id = t.tiempo_id
JOIN FOR_Y_UN_IF.dim_sede s ON hf.sede_id = s.sede_id
GROUP BY t.anio, t.semestre, s.sede_nombre
GO
PRINT 'Vista vw_ausentismo_finales creada'
GO

-- VISTA 7: Desvío de pagos
CREATE VIEW FOR_Y_UN_IF.vw_desvio_pagos
AS
SELECT
    t.anio,
    t.semestre,
    s.sede_nombre,
    SUM(hp.cantidad_pagos) AS total_pagos,
    SUM(hp.cantidad_pagos_fuera_termino) AS pagos_fuera_termino,
    CASE
        WHEN SUM(hp.cantidad_pagos) > 0
        THEN CAST(SUM(hp.cantidad_pagos_fuera_termino) * 100.0 / SUM(hp.cantidad_pagos) AS DECIMAL(10,2))
        ELSE 0
    END AS porcentaje_fuera_termino
FROM FOR_Y_UN_IF.hecho_pagos hp
JOIN FOR_Y_UN_IF.dim_tiempo t ON hp.tiempo_id = t.tiempo_id
JOIN FOR_Y_UN_IF.dim_sede s ON hp.sede_id = s.sede_id
GROUP BY t.anio, t.semestre, s.sede_nombre
GO
PRINT 'Vista vw_desvio_pagos creada'
GO

-- VISTA 8: Tasa de morosidad financiera mensual
CREATE VIEW FOR_Y_UN_IF.vw_morosidad_financiera
AS
SELECT
    t.anio,
    t.mes,
    t.nombre_mes,
    s.sede_nombre,
    SUM(hf.importe_facturado) AS importe_esperado,
    SUM(hf.importe_adeudado) AS importe_adeudado,
    CASE
        WHEN SUM(hf.importe_facturado) > 0
        THEN CAST(SUM(hf.importe_adeudado) * 100.0 / SUM(hf.importe_facturado) AS DECIMAL(10,2))
        ELSE 0
    END AS tasa_morosidad
FROM FOR_Y_UN_IF.hecho_facturacion hf
JOIN FOR_Y_UN_IF.dim_tiempo t ON hf.tiempo_id = t.tiempo_id
JOIN FOR_Y_UN_IF.dim_sede s ON hf.sede_id = s.sede_id
GROUP BY t.anio, t.mes, t.nombre_mes, s.sede_nombre
GO
PRINT 'Vista vw_morosidad_financiera creada'
GO

-- VISTA 9: Ingresos por categoría de cursos (Top 3)
CREATE VIEW FOR_Y_UN_IF.vw_ingresos_categoria
AS
WITH RankedIngresos AS (
    SELECT
        t.anio,
        s.sede_nombre,
        c.categoria_nombre,
        SUM(hf.importe_facturado) AS total_ingresos,
        ROW_NUMBER() OVER (PARTITION BY t.anio, s.sede_nombre ORDER BY SUM(hf.importe_facturado) DESC) AS ranking
    FROM FOR_Y_UN_IF.hecho_facturacion hf
    JOIN FOR_Y_UN_IF.dim_tiempo t ON hf.tiempo_id = t.tiempo_id
    JOIN FOR_Y_UN_IF.dim_sede s ON hf.sede_id = s.sede_id
    JOIN FOR_Y_UN_IF.dim_categoria c ON hf.categoria_id = c.categoria_id
    GROUP BY t.anio, s.sede_nombre, c.categoria_nombre
)
SELECT
    anio,
    sede_nombre,
    categoria_nombre,
    total_ingresos,
    ranking
FROM RankedIngresos
WHERE ranking <= 3
GO
PRINT 'Vista vw_ingresos_categoria creada'
GO

-- VISTA 10: Índice de satisfacción
CREATE VIEW FOR_Y_UN_IF.vw_indice_satisfaccion
AS
SELECT
    t.anio,
    s.sede_nombre,
    r.rango_descripcion AS rango_etario_profesor,
    SUM(CASE WHEN ds.bloque_descripcion = 'Satisfechos' THEN hs.cantidad_respuestas ELSE 0 END) AS cant_satisfechos,
    SUM(CASE WHEN ds.bloque_descripcion = 'Neutrales' THEN hs.cantidad_respuestas ELSE 0 END) AS cant_neutrales,
    SUM(CASE WHEN ds.bloque_descripcion = 'Insatisfechos' THEN hs.cantidad_respuestas ELSE 0 END) AS cant_insatisfechos,
    SUM(hs.cantidad_respuestas) AS total_respuestas,
    CASE
        WHEN SUM(hs.cantidad_respuestas) > 0 THEN
            CAST((
                (SUM(CASE WHEN ds.bloque_descripcion = 'Satisfechos' THEN hs.cantidad_respuestas ELSE 0 END) * 100.0 / SUM(hs.cantidad_respuestas)) -
                (SUM(CASE WHEN ds.bloque_descripcion = 'Insatisfechos' THEN hs.cantidad_respuestas ELSE 0 END) * 100.0 / SUM(hs.cantidad_respuestas)) + 100
            ) / 2 AS DECIMAL(10,2))
        ELSE 0
    END AS indice_satisfaccion
FROM FOR_Y_UN_IF.hecho_satisfaccion hs
JOIN FOR_Y_UN_IF.dim_tiempo t ON hs.tiempo_id = t.tiempo_id
JOIN FOR_Y_UN_IF.dim_sede s ON hs.sede_id = s.sede_id
JOIN FOR_Y_UN_IF.dim_rango_etario_profesor r ON hs.rango_etario_profesor_id = r.rango_etario_profesor_id
JOIN FOR_Y_UN_IF.dim_satisfaccion ds ON hs.bloque_satisfaccion_id = ds.satisfaccion_id
GROUP BY t.anio, s.sede_nombre, r.rango_descripcion
GO
PRINT 'Vista vw_indice_satisfaccion creada'
GO

/*******************************************************************************
 * PARTE 7: VALIDACION DE CARGA
 ******************************************************************************/

PRINT ''
PRINT '========================================='
PRINT 'VALIDACION DE CARGA DE BI'
PRINT '========================================='
GO

DECLARE @count INT

PRINT 'DIMENSIONES:'
SELECT @count = COUNT(*) FROM FOR_Y_UN_IF.dim_tiempo
PRINT '  Tiempo: ' + CAST(@count AS VARCHAR)

SELECT @count = COUNT(*) FROM FOR_Y_UN_IF.dim_sede
PRINT '  Sede: ' + CAST(@count AS VARCHAR)

SELECT @count = COUNT(*) FROM FOR_Y_UN_IF.dim_rango_etario_alumno
PRINT '  Rango Etario Alumno: ' + CAST(@count AS VARCHAR)

SELECT @count = COUNT(*) FROM FOR_Y_UN_IF.dim_rango_etario_profesor
PRINT '  Rango Etario Profesor: ' + CAST(@count AS VARCHAR)

SELECT @count = COUNT(*) FROM FOR_Y_UN_IF.dim_turno
PRINT '  Turno: ' + CAST(@count AS VARCHAR)

SELECT @count = COUNT(*) FROM FOR_Y_UN_IF.dim_categoria
PRINT '  Categoria: ' + CAST(@count AS VARCHAR)

SELECT @count = COUNT(*) FROM FOR_Y_UN_IF.dim_medio_pago
PRINT '  Medio Pago: ' + CAST(@count AS VARCHAR)

SELECT @count = COUNT(*) FROM FOR_Y_UN_IF.dim_satisfaccion
PRINT '  Satisfaccion: ' + CAST(@count AS VARCHAR)

PRINT ''
PRINT 'HECHOS:'
SELECT @count = COUNT(*) FROM FOR_Y_UN_IF.hecho_inscripciones
PRINT '  Inscripciones: ' + CAST(@count AS VARCHAR)

SELECT @count = COUNT(*) FROM FOR_Y_UN_IF.hecho_cursada
PRINT '  Cursada: ' + CAST(@count AS VARCHAR)

SELECT @count = COUNT(*) FROM FOR_Y_UN_IF.hecho_finales
PRINT '  Finales: ' + CAST(@count AS VARCHAR)

SELECT @count = COUNT(*) FROM FOR_Y_UN_IF.hecho_pagos
PRINT '  Pagos: ' + CAST(@count AS VARCHAR)

SELECT @count = COUNT(*) FROM FOR_Y_UN_IF.hecho_facturacion
PRINT '  Facturacion: ' + CAST(@count AS VARCHAR)

SELECT @count = COUNT(*) FROM FOR_Y_UN_IF.hecho_satisfaccion
PRINT '  Satisfaccion: ' + CAST(@count AS VARCHAR)

PRINT ''
PRINT '========================================='
PRINT 'MODELO DE BI CARGADO EXITOSAMENTE'
PRINT 'Fecha/Hora: ' + CONVERT(VARCHAR, GETDATE(), 120)
PRINT '========================================='
GO

/*******************************************************************************
 * FIN DEL SCRIPT DE BI
 ******************************************************************************/