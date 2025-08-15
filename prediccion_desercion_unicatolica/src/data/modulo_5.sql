CREATE TABLE objetivo AS
SELECT
    id,
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
INNER JOIN objetivo USING (id))

SELECT * FROM repitencias
INNER JOIN temporal USING (id))

SELECT * FROM estudiantes
INNER JOIN temporal_2 USING (id))

SELECT COUNT(id) OVER (ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW ) AS id_estudiante,* FROM temporal_3;

ALTER TABLE datos DROP COLUMN id;