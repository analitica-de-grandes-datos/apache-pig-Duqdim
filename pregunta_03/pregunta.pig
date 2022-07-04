/*
Pregunta
===========================================================================

Obtenga los cinco (5) valores más pequeños de la 3ra columna.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD './data.tsv' AS (letter:chararray, date:chararray, amount:int);
gro = ORDER data BY amount;
groa = limit gro 5;
result = FOREACH groa GENERATE amount;

STORE result INTO 'output/' using PigStorage(',');
