-- Creacion de la tabla transitoria estudiantes.

CREATE TABLE estudiantes as

SELECT ID_ESTUDIANTE as id_estudiante,
       EDAD as edad,
       GENERO as genero,
       ESTRATO as estrato,
       RESIDENCIA as residencia,
       DESC_ESTADO_CIVIL as estado_civil,
       PERIODO_CATALOGO as periodo_inicio
FROM Estudiantes_UNIS;

UPDATE estudiantes SET residencia = CASE
    WHEN residencia LIKE ('%CALI%') THEN '0'
    WHEN residencia LIKE ('CANDELARIA') THEN '1'
    WHEN residencia LIKE ('JAMUND%') THEN '1'
    WHEN residencia LIKE ('YUMBO') THEN '1'
    WHEN residencia LIKE ('PALMIRA') THEN '1'
    WHEN residencia LIKE ('DAGUA') THEN '1'
    ELSE '2'
END;

UPDATE estudiantes SET genero = CASE
    WHEN genero = 'F' THEN '2'
    WHEN genero = 'M' THEN '1'
    WHEN genero = 'N' THEN '0'
END;

UPDATE estudiantes SET estado_civil = CASE
    WHEN estado_civil = 'Soltero(a)' THEN '0'
    WHEN estado_civil = 'U libre' THEN '1'
    WHEN estado_civil = 'Casado(a)' THEN '2'
END;

UPDATE estudiantes SET estrato = CASE
    WHEN estrato =  0 THEN (SELECT CEILING (AVG(estrato)) from Estudiantes_UNIS)
    ELSE estrato
END;

UPDATE estudiantes SET periodo_inicio = 202210
WHERE periodo_inicio = 202201;

UPDATE estudiantes SET periodo_inicio = 202310
WHERE periodo_inicio = 202301;