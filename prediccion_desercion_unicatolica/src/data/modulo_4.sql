CREATE VIEW creditos AS

WITH temporal AS (

SELECT CODIGO_ID AS id_estudiante,PERIODO AS periodo,CREDITOS_ASIGNATURA AS creditos,"NOTA FINAL" AS nota FROM Materias_Inscritas
WHERE CODIGO_ID IN (SELECT id_estudiante FROM estudiantes) AND ("NOTA FINAL" > '2.9' OR "NOTA FINAL" IN ('A','CA'))
ORDER BY CODIGO_ID,PERIODO)

SELECT
    DISTINCT
    id_estudiante,
    periodo,
    SUM(creditos)
        OVER
            (PARTITION BY id_estudiante,periodo)
        AS creditos_aprobados
FROM temporal
ORDER BY id_estudiante,periodo;

CREATE VIEW estado_temporal AS

WITH temporal_2 AS (
WITH temporal AS (
SELECT
    DISTINCT periodo
FROM promedios
WHERE periodo IN (SELECT DISTINCT periodo_inicio FROM estudiantes)
ORDER BY periodo)

SELECT id_estudiante,periodo_inicio,T.periodo FROM estudiantes E
LEFT JOIN temporal T
ORDER BY id_estudiante)

SELECT * FROM temporal_2 T
LEFT JOIN creditos C USING (id_estudiante,periodo)
ORDER BY id_estudiante,periodo;

CREATE TABLE aucensias AS
WITH temporal_2 AS (
WITH temporal AS (
SELECT
    *,
    SUM(creditos_aprobados)
    OVER
        (PARTITION BY id_estudiante ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW ) AS suma_creditos
FROM estado_temporal)
SELECT
    *,
    SUM
    (
    CASE
        WHEN periodo_inicio > periodo THEN 0
        WHEN periodo_inicio = periodo THEN 0
        WHEN (periodo_inicio < periodo) AND (creditos_aprobados ISNULL ) AND (suma_creditos < 170 OR suma_creditos ISNULL ) THEN 1
        ELSE 0
    END)
        OVER (PARTITION BY id_estudiante ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW )
        AS aucensias
FROM temporal)

SELECT
    DISTINCT
    id_estudiante,
    MAX(aucensias) OVER (PARTITION BY id_estudiante) AS total_aucensia
FROM temporal_2;
