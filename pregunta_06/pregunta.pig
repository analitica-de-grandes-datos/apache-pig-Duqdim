/*
Pregunta
===========================================================================

Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
columna 3. En otras palabras, cuántos registros hay que tengan la clave 
`aaa`?

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

data = LOAD './data.tsv' AS (letter:chararray, bagArray:chararray, M:map [] );
gro1 = FOREACH data GENERATE M;
gro2 = FOREACH gro1 GENERATE FLATTEN(M);  
X = GROUP gr2 BY $0;
ou = FOREACH X GENERATE group, COUNT($1);
STORE ou INTO 'output/' using PigStorage(',');
