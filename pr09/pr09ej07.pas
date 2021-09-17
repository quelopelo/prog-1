program pr09ej07;

const	M = 4;		{M >= 1}
	N = 6;		{N >= 1}

type	cadenaM = array [1..M] of char;
	cadenaN = array [1..N] of char;

var	cadM : cadenaM;
	cadN : cadenaN;
	pos : integer;

function posicion (var cadM : cadenaM; var cadN : cadenaN) : integer;
{Las cadenas se pasa por referencia para usar menos memoria}
var	i, j, k : integer;
	esta, no_esta : boolean;
begin
	j := 1;
	esta := false;
	no_esta := false;
	repeat
		while	(j <= N - M + 1) and (cadM[1] <> cadN[j]) do
			j := j + 1;
		if	j > N - M + 1
		then	no_esta := true
		else
		begin
			i := 2;
			k := j + 1;
			while 	(i <= M) and (cadM[i] = cadN [k]) do
			begin
				i := i + 1;
				k := k + 1
			end;
			if	i > M
			then	esta := true
			else	j := j + 1
		end
	until	esta or no_esta;
	if	esta
	then	posicion := j
	else	posicion := 0
end;

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

procedure mostrar_cadenaM (var cadM : cadenaM);
{La cadena se pasa por referencia para usar menos memoria}
var	i : integer;
begin
	for	i := 1 to M do
		write(cadM[i])
end;

procedure mostrar_cadenaN (var cadN : cadenaN);
{La cadena se pasa por referencia para usar menos memoria}
var	j : integer;
begin
	for	j := 1 to N do
		write(cadN[j])
end;

(*Programa principal*)
begin

(*Entrada de datos*)
write('Ingrese los ', M:1,' caracteres de la cadenaM: ');
leer_cadenaM(cadM);
write('Ingrese los ', N:1,' caracteres de la cadenaN: ');
leer_cadenaN(cadN);

(*Procesamiento de datos*)
pos := posicion (cadM, cadN);

(*Salida de datos*)
if	pos = 0
then
begin
	write('La cadena ');
	mostrar_cadenaM(cadM);
	write(' no se encuentra dentro de la cadena ');
	mostrar_cadenaN(cadN);
	writeln
end
else
begin
	write('La cadena ');
	mostrar_cadenaM(cadM);
	write(' se encuentra dentro de la cadena ');
	mostrar_cadenaN(cadN);
	writeln(' en la posición ', pos:1)
end

end.
