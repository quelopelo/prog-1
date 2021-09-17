program pr09ej09;

const	n = 10;		{n > 1}

type	rango = 1..n;
	positivo = 1..maxint;
	arreglo = array [rango] of integer;

var	vector : arreglo;
	v : positivo;

function contar_multiplos (var vector : arreglo; v : positivo) : integer;
{El vector se pasa por referencia para usar menos memoria}
var	i : rango;
	cont : integer;
begin
	cont := 0;
	for	i := 1 to n do
		if	vector[i] mod v = 0
		then	cont := cont + 1;
	contar_multiplos := cont
end;

procedure cargar (var vector : arreglo);
var	i : rango;
begin
	for	i := 1 to n do
		read(vector[i]);
	readln
end;

(*Programa principal*)
begin

(*Entrada de datos*)
writeln('Ingrese ', n:1, ' enteros para cargar el vector:');
cargar(vector);
write('Ingrese un valor para v: ');
readln(v);

(*Salida de datos*)
write('La cantidad de múltiplos de ', v:1, ' es: ');
writeln(contar_multiplos(vector, v):1)

end.
