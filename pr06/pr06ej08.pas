program pr06ej08;

var	n, i, cont : integer;
	x, y : real;

begin

randomize;

(*Entrada de datos*)
write('Ingrese un número natural (> 0): ');
readln(n);

(*Cálculo de pi mediante Monte Carlo*)
cont := 0;
for	i := 1 to n do
begin
	x := random;
	y := random;
	if	x * x + y * y <= 1
	then	cont := cont + 1
end;

(*Salida de datos*)
writeln('Aproximación de pi: ', (4 * cont / n):7:5);

end.
