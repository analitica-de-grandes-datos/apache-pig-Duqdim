/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       firstname,
       color
   FROM 
       u 
   WHERE color = 'blue' AND firstname LIKE 'Z%';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

*/

data = LOAD 'data.csv' USING PigStorage(',')
    AS (
        Id:int,
        firstname:chararray,
        Apellido:chararray,
        Fecha:datetime,
        color:chararray,
        Cantidad:int);

colum = FOREACH data_table GENERATE firstname, color;
filtro = FILTER specific_columns BY color == 'blue' AND STARTSWITH(firstname,'Z');
output = FOREACH filtro GENERATE CONCAT(firstname,' ',color);
STORE output INTO 'output' USING PigStorage(',');
