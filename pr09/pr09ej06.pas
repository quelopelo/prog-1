program pr09ej06;

const	M = 2;
	N = 3;
	P = 4;

type	rangoM = 1..M;
	rangoN = 1..N;
	rangoP = 1..P;
	tabla_tridimensional = array [rangoM, rangoN, rangoP] of boolean;

var	tabla : tabla_tridimensional;

procedure intercambiar (var tabla : tabla_tridimensional);
var	i : rangoM;
	j : rangoN;
	k : rangoP;
begin
	for i := 1 to M do
		for j := 1 to N do
			for k := 1 to P do
				tabla[i, j, k] := not tabla[i, j, k]
end;

procedure cargar (var tabla : tabla_tridimensional);
var	i : rangoM;
	j : rangoN;
	k : rangoP;
	num : 0..1;
begin
	for i := 1 to M do
		for j := 1 to N do
			for k := 1 to P do
			begin
				read(num);
				tabla[i, j, k] := num = 1
			end
end;


procedure mostrar (var tabla : tabla_tridimensional);
{La tabla se pasa por referencia para usar menos memoria}
var	i : rangoM;
	j : rangoN;
	k : rangoP;
	num : 0..1;
begin
	for i := 1 to M do
	begin
		writeln('> Matriz ', i:1, ' de ', M:1);
		writeln;
		for j := 1 to N do
		begin
			for k := 1 to P do
				if	tabla[i, j, k]
				then	write(1:3)
				else	write(0:3);
			writeln
		end;
		writeln
	end
end;

(* Programa principal*)
begin

(*Entrada de datos*)
writeln;
writeln('Ingrese ', M:1, 'x', N:1, 'x', P:1, ' booleanos para cargar la tabla:');
cargar(tabla);

(*Procesamiento de datos*)
intercambiar(tabla);

(*Salida de datos*)
writeln;
writeln('La tabla con las filas intercambiadas es: ');
writeln;
mostrar(tabla)

end.
