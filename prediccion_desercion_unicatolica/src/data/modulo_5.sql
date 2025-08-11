CREATE TABLE objetivo AS
SELECT
    id_estudiante,
    CASE
        WHEN total_aucensia >= 2 THEN 1
    ELSE 0
    END AS desertor
FROM aucensias;

CREATE TABLE datos AS
WITH temporal_3 AS (
WITH temporal_2 AS (
WITH temporal AS (
SELECT * FROM promedios_final
INNER JOIN objetivo USING (id_estudiante))

SELECT * FROM repitencias
INNER JOIN temporal USING (id_estudiante))

SELECT * FROM estudiantes
INNER JOIN temporal_2 USING (id_estudiante))

SELECT COUNT(id_estudiante) OVER (ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW ) AS id,* FROM temporal_3;

ALTER TABLE datos DROP COLUMN id_estudiante;