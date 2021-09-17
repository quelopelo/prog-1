program pr09ej13;

const	N = 4;
	M = N * (N + 1) div 2;

type	rangoN = 1..N;
	rangoM = 1..M;
	arreglo = array [rangoM] of integer;

var	a : arreglo;
	i, j : integer;

function indSim (i, j : rangoN) : rangoM;
var	aux : rangoN;
begin
	if	i > j
	then
	begin
		aux := i;
		i := j;
		j := aux;
	end;
	indSim := (2 * N - i + 1) * i div 2 - N + j
end;

procedure almaSim (var a : arreglo; i, j : rangoN; val : integer);
begin
	a[indSim(i, j)] := val
end;

procedure cargaSim (var a : arreglo);
var	i, j : rangoN;
	val : integer;
begin
	for i := 1 to N do
		for j := i to N do
		begin
			write('-> Celda [', i:1, ',', j:1, ']: ');
			readln(val);
			almaSim(a, i, j, val)
		end
end;

function obtSim (var a : arreglo; i, j : rangoN) : integer;
{El arreglo se pasa por referencia para usar menos memoria}
begin
	obtSim := a[indSim(i, j)]
end;

(*Programa principal*)
begin

(*Parte 1*)
writeln('Ingrese los valores enteros de la matriz simétrica de ', N:1, 'x', N:1);
cargaSim(a);

(*Parte 2*)
writeln('Ingrese las coordenadas de la matriz para obtener el valor almacenado');
write('-> Coordenadas: ');
read(i);
while	i <> -1 do
begin
	readln(j);
	write('-> Valor almacenado: ');
	writeln(obtSim(a, i, j):1);
	write('-> Coordenadas: ');
	read(i)
end
	
end.
