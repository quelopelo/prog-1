program pr09ej08;

const	tam = 4;

type	matriz = array [1..tam, 1..tam] of integer;

var	mat : matriz;

procedure transpuesta (a : matriz; var b : matriz);
var	i, j : integer;
begin
	for i := 1 to tam do
		for j := 1 to tam do
			b[i,j] := a[j,i]
end;

procedure transponer (var mat : matriz);
var	i, j, temp : integer;
begin
	for i := 1 to tam do
		for j := i+1 to tam do
		begin
			temp := mat[i,j];
			mat[i,j] := mat[j,i];
			mat[j,i] := temp
		end
end;

procedure cargar (var mat : matriz);
var	i, j : integer;
begin
	for	i := 1 to tam do
		for	j := 1 to tam do
			read(mat[i, j]);
	readln
end;

procedure mostrar (var mat : matriz);
{La matriz se pasa por referencia para usar menos memoria}
var	i, j : integer;
begin
	for	i := 1 to tam do
	begin
		for	j := 1 to tam do
			write(mat[i, j]:6);
		writeln
	end
end;

(*Programa principal*)
begin

(*Entrada de datos*)
writeln('Ingrese ', tam:1, 'x', tam:1, ' enteros para cargar la matriz:');
cargar(mat);

(*Procesamiento de datos*)
transponer(mat);

(*Salida de datos*)
writeln('La matriz con las filas intercambiadas es: ');
mostrar(mat)

end.
