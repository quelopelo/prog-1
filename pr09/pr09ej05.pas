program pr09ej05;

const	tam = 5;

type	rango = 1..tam;
	arreglo2 = array [rango, rango] of integer;

var	matriz : arreglo2;
	m, n : integer;

procedure intercambiar_filas (var matriz : arreglo2; m, n : integer);
{Precondiciones: 1 < m <= tam, 1 < n <= tam}
var	i : rango;
	temp : integer;
begin
	for	i := 1 to tam do
	begin
		temp := matriz[m, i];
		matriz[m, i] := matriz[n, i];
		matriz[n, i] := temp
	end
end;

procedure cargar_valores (var matriz : arreglo2);
var	i, j : rango;
begin
	for	i := 1 to tam do
		for	j := 1 to tam do
			read(matriz[i, j]);
	readln
end;

procedure mostrar_valores (var matriz : arreglo2);
{La matriz se pasa por referencia para usar menos memoria}
var	i, j : rango;
begin
	for	i := 1 to tam do
	begin
		for	j := 1 to tam do
			write(matriz[i, j]:6);
		writeln
	end
end;

(* Programa principal*)
begin

(*Entrada de datos*)
writeln('Ingrese ', tam:1, 'x', tam:1, ' enteros para cargar la matriz:');
cargar_valores(matriz);

write('Ingrese un valor para m: ');
readln(m);
while	(m <= 0) or (m > tam) do
begin
	write('Valor incorrecto. Ingrese un valor para m: ');
	readln(m);
end;

write('Ingrese un valor para n: ');
readln(n);
while	(n <= 0) or (n > tam) do
begin
	write('Valor incorrecto. Ingrese un valor para n: ');
	readln(n);
end;

(*Procesamiento de datos*)
intercambiar_filas(matriz, m, n);

(*Salida de datos*)
writeln('La matriz con las filas intercambiadas es: ');
mostrar_valores(matriz)

end.
