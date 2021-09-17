program pr09ej03;

const	n = 10;

type	rango = 1..n;
	arreglo = array [rango] of integer;

var	vector : arreglo;
	num : integer;
	ind : rango;

procedure carga (var vector : arreglo);
var	i : rango;
begin
	for	i := 1 to n do
		read(vector[i])
end;

function cant_mayores (var vector : arreglo; num : integer) : integer;
{El vector se pasa por referencia para usar menos memoria}
var	i : rango;
	cant : integer;
begin
	cant := 0;
	for	i := 1 to n do
		if	vector[i] > num
		then	cant := cant + 1;
	cant_mayores := cant
end;

function ordenado (var vector : arreglo) : boolean;
{El vector se pasa por referencia para usar menos memoria}
var	i : integer;
begin
	i := 2;
	while	(i <= n) and (vector[i] >= vector[i-1]) do
		i := i + 1;
	ordenado := i > n
end;

procedure max_pos (var vector : arreglo; var max : integer; var ind : rango);
{El vector se pasa por referencia para usar menos memoria}
var	i : rango;
begin
	ind := 1;
	for	i := 2 to n do
		if	vector[i] > vector[ind]
		then	ind := i;
	max := vector[ind]
end;

(*Programa principal*)
begin

(*Parte 1*)
writeln;
writeln('Ingrese ', n:1, ' enteros:');
carga(vector);

(*Parte 2*)
write('Ingrese un valor entero: ');
readln(num);
writeln;
write('La cantidad de valores mayores que ', num:1, ' es: ');
writeln(cant_mayores(vector, num):1);

(*Parte 3*)
if	ordenado(vector)
then	writeln('Los valores están ordenados de forma ascendente')
else	writeln('Los valores no están ordenados de forma ascendente');

(*Parte 4*)
max_pos(vector, num, ind);
writeln('El valor máximo es: ', num:1);
writeln('El primer índice donde ocurre (el máximo) es: ', ind:1);
writeln;

end.
