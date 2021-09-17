program pr09ej11;

const	M = 4;		{M >= 1}
	N = 6;		{N >= 1}

type	cadenaM = array [1..M] of char;
	cadenaN = array [1..N] of char;

var	cadM : cadenaM;
	cadN : cadenaN;

procedure leer_cadenaM (var cadM : cadenaM);
var	i : integer;
begin
	for	i := 1 to M do
		read(cadM[i]);
	readln
end;

procedure leer_cadenaN (var cadN : cadenaN);
var	j : integer;
begin
	for	j := 1 to N do
		read(cadN[j]);
	readln
end;

function posicion_letra (var cadM : cadenaM; var cadN : cadenaN) : integer;
{Las cadenas se pasa por referencia para usar menos memoria}
var	i, j : integer;
	esta : boolean;
begin
	i := 0;
	esta := false;
	while	(i <= M) and (not esta) do
	begin
		i := i + 1;
		j := 1;
		while	(j <= N) and (not esta) do
			if 	cadM[i] = cadN[j]
			then	esta := true
			else	j := j + 1
	end;
	if	esta
	then	posicion_letra := i
	else	posicion_letra := 0
end;

function existe_letra (var cadM : cadenaM; var cadN : cadenaN) : boolean;
{Las cadenas se pasa por referencia para usar menos memoria}
begin
	if	posicion_letra(cadM, cadN) = 0
	then	existe_letra := false
	else	existe_letra := true
end;

function primera_letra (var cadM : cadenaM; var cadN : cadenaN) : char;
{Las cadenas se pasa por referencia para usar menos memoria}
{Precondición: existe_letra(cadM, cadN) = true}
begin
	primera_letra := cadM[posicion_letra(cadM, cadN)]
end;

function existe_cadena (var cadM : cadenaM; var cadN : cadenaN) : boolean;
{Las cadenas se pasa por referencia para usar menos memoria}
var	i, j : integer;
begin
	i := 1;
	j := 1;
	repeat
		if	cadM[i] = cadN[j]
		then	i := i + 1;
		j := j + 1
	until	(i > M) or (j > N - M + i);
	if	i <= M
	then	existe_cadena := false
	else	existe_cadena := true
end;

(*Programa principal*)
begin

(*Entrada de datos*)
write('Ingrese los ', M:1,' caracteres de la cadenaM: ');
leer_cadenaM(cadM);
write('Ingrese los ', N:1,' caracteres de la cadenaN: ');
leer_cadenaN(cadN);

(*Salida de datos*)
if	existe_letra(cadM, cadN)
then	
begin
	writeln('Al menos una letra de la primera cadena ocurre en la segunda');
	write('La primera letra de la primera cadena en que esto ocurre es: ');
	writeln(primera_letra(cadM, cadN))
end
else	writeln('Ninguna letra de la primera cadena ocurre en la segunda');

if	existe_cadena(cadM, cadN)
then	writeln('Todas las letras de la primera cadena ocurren en la segunda en el mismo orden')
else	writeln('No todas las letras de la primera cadena ocurren en la segunda en el mismo orden')

end.
