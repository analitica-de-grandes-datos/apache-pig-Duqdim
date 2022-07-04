/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
columna 3 es:

  ((b,jjj), 216)

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

data = LOAD 'data.tsv' AS (f1:CHARARRAY, f2:BAG{t: TUPLE(p:CHARARRAY)}, f3:MAP[]);
gro1 = FOREACH data GENERATE f2, f3;
gro2 = FOREACH gro1 GENERATE FLATTEN(f2),FLATTEN(f3);
x = GROUP gro2 BY ($0, $1);
out = FOREACH x GENERATE group , COUNT($1);
DUMP out;

STORE out INTO 'output/' using PigStorage(',') ;
