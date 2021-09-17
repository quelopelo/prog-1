program pr09ej10;

const	M = 3;
	N = 2;
	P = 3;

type	rangoM = 1..M;
	rangoN = 1..N;
	rangoP = 1..P;
	matrizMxN = array [rangoM, rangoN] of integer;
	matrizNxP = array [rangoN, rangoP] of integer;
	matrizMxP = array [rangoM, rangoP] of integer;

var	A : matrizMxN;
	B : matrizNxP;
	C : matrizMxP;

procedure producto_matricial (var A : matrizMxN;
			      var B : matrizNxP;
			      var C : matrizMxP);
{Las matrices se pasan por referencia para usar menos memoria}
var	i : rangoM;
	j : rangoN;
	k : rangoP;
begin
	for	i := 1 to M do
		for	k := 1 to P do
		begin
			C[i, k] := 0;
			for	j := 1 to N do
				C[i, k] := C[i, k] + A[i, j] * B[j, k]
		end
end;

procedure cargar_matrizMxN (var mat : matrizMxN);
var	i : rangoM;
	j : rangoN;
begin
	for	i := 1 to M do
		for	j := 1 to N do
			read(mat[i, j]);
	readln
end;

procedure cargar_matrizNxP (var mat : matrizNxP);
var	j : rangoN;
	k : rangoP;
begin
	for	j := 1 to N do
		for	k := 1 to P do
			read(mat[j, k]);
	readln
end;

procedure mostrar_matrizMxP (var mat : matrizMxP);
{La matriz se pasa por referencia para usar menos memoria}
var	i : rangoM;
	k : rangoP;
begin
	for	i := 1 to M do
	begin
		for	k := 1 to P do
			write(mat[i, k]:6);
		writeln
	end
end;

(*Programa principal*)
begin

(*Entrada de datos*)
writeln('Ingrese ', M:1, 'x', N:1, ' enteros para cargar la matriz A:');
cargar_matrizMxN(A);
writeln('Ingrese ', N:1, 'x', P:1, ' enteros para cargar la matriz B:');
cargar_matrizNxP(B);

(*Procesamiento de datos*)
producto_matricial(A, B, C);

(*Salida de datos*)
writeln('La matriz resultante del producto de A x B es: ');
mostrar_matrizMxP(C)

end.
