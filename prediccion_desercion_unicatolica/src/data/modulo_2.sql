CREATE TABLE promedios AS
SELECT ID_ESTUDIANTE AS id_estudiante,PERIODO_ACADEMICO AS periodo,PGA AS promedio FROM PGA
WHERE ID_ESTUDIANTE IN (SELECT ID_ESTUDIANTE FROM Estudiantes_UNIS)
ORDER BY ID_ESTUDIANTE;

UPDATE promedios SET periodo = 202210
WHERE periodo = 202201;

-- Esto corrige los estudiantes que 
-- estaban en Estudiantes_UNIS pero no en PGA

DELETE FROM estudiantes
WHERE id_estudiante NOT IN (
SELECT DISTINCT id_estudiante FROM promedios
WHERE id_estudiante IN (SELECT id_estudiante FROM estudiantes));

CREATE VIEW promedios_final AS
WITH temporal AS (
SELECT id_estudiante,
       COUNT(periodo) OVER (PARTITION BY id_estudiante ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW ) AS numero_semestre,
       promedio
FROM promedios)

SELECT
    id_estudiante,
    COALESCE(MAX(CASE WHEN numero_semestre = 1 THEN promedio END),0) AS semestre_1,
    COALESCE(MAX(CASE WHEN numero_semestre = 2 THEN promedio END),0) AS semestre_2,
    COALESCE(MAX(CASE WHEN numero_semestre = 3 THEN promedio END),0) AS semestre_3,
    COALESCE(MAX(CASE WHEN numero_semestre = 4 THEN promedio END),0) AS semestre_4,
    COALESCE(MAX(CASE WHEN numero_semestre = 5 THEN promedio END),0) AS semestre_5,
    COALESCE(MAX(CASE WHEN numero_semestre = 6 THEN promedio END),0) AS semestre_6,
    COALESCE(MAX(CASE WHEN numero_semestre = 7 THEN promedio END),0) AS semestre_7,
    COALESCE(MAX(CASE WHEN numero_semestre = 8 THEN promedio END),0) AS semestre_8,
    COALESCE(MAX(CASE WHEN numero_semestre = 9 THEN promedio END),0) AS semestre_9,
    COALESCE(MAX(CASE WHEN numero_semestre = 10 THEN promedio END),0) AS semestre_10,
    COALESCE(MAX(CASE WHEN numero_semestre = 11 THEN promedio END),0) AS semestre_11,
    COALESCE(MAX(CASE WHEN numero_semestre = 12 THEN promedio END),0) AS semestre_12,
    COALESCE(MAX(CASE WHEN numero_semestre = 13 THEN promedio END),0) AS semestre_13,
    COALESCE(MAX(CASE WHEN numero_semestre = 14 THEN promedio END),0) AS semestre_14,
    COALESCE(MAX(CASE WHEN numero_semestre = 15 THEN promedio END),0) AS semestre_15,
    COALESCE(MAX(CASE WHEN numero_semestre = 16 THEN promedio END),0) AS semestre_16,
    COALESCE(MAX(CASE WHEN numero_semestre = 17 THEN promedio END),0) AS semestre_17,
    COALESCE(MAX(CASE WHEN numero_semestre = 18 THEN promedio END),0) AS semestre_18,
    COALESCE(MAX(CASE WHEN numero_semestre = 19 THEN promedio END),0) AS semestre_19,
    COALESCE(MAX(CASE WHEN numero_semestre = 20 THEN promedio END),0) AS semestre_20

FROM temporal
GROUP BY id_estudiante;
