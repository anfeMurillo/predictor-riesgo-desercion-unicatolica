CREATE TABLE repitencias AS
WITH temporal AS (SELECT DISTINCT CODIGO_ID                                                          AS id_estudiante,
                                  CODIGO_MATERIA                                                     AS asignatura,
                                  COUNT(CODIGO_MATERIA) OVER (PARTITION BY CODIGO_ID,CODIGO_MATERIA) AS repitencias
                  FROM Materias_Inscritas
                  WHERE CAST(CODIGO_ID AS TEXT) IN (SELECT CAST(ID_ESTUDIANTE AS TEXT) FROM Estudiantes_UNIS)
                  ORDER BY ID_ESTUDIANTE)
SELECT
    DISTINCT
    id_estudiante,
       SUM(CASE
           WHEN repitencias = 1 THEN 0
           WHEN repitencias != 1 THEN repitencias - 1
           END)
           OVER
               (PARTITION BY id_estudiante)
           AS repitencias_total
FROM temporal;

INSERT INTO repitencias (id_estudiante,repitencias_total)
SELECT id_estudiante,
       0
FROM estudiantes
WHERE id_estudiante NOT IN (SELECT id_estudiante FROM repitencias);