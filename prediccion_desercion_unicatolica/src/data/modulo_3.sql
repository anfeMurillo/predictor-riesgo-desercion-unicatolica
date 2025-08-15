CREATE TABLE repitencias AS
WITH temporal AS (
    SELECT DISTINCT 
    CODIGO_ID AS id,
    CODIGO_MATERIA AS asignatura,
    COUNT(CODIGO_MATERIA) 
    OVER 
    (PARTITION BY CODIGO_ID,CODIGO_MATERIA) AS repitencias
FROM Materias_Inscritas
WHERE 
    CAST(CODIGO_ID AS TEXT) 
    IN 
    (SELECT CAST(ID_ESTUDIANTE AS TEXT) FROM Estudiantes_Info)
ORDER BY CODIGO_ID)

SELECT
    DISTINCT
    id,
       SUM(CASE
           WHEN repitencias = 1 THEN 0
           WHEN repitencias != 1 THEN repitencias - 1
           END)
           OVER
               (PARTITION BY id)
           AS repitencias_total
FROM temporal;

INSERT INTO repitencias (id,repitencias_total)
SELECT id,
       0
FROM estudiantes
WHERE id NOT IN (SELECT id FROM repitencias);