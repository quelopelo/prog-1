program pr07ej09;

var	x1, y1, x2, y2, d : real;

function distancia (x1, y1, x2, y2 : real) : real;
begin
	x2 := x2 - x1;
	y2 := y2 - y1;
	distancia := sqrt(x2 * x2 + y2 * y2)
end;

(*Programa principal*)
begin

(*Entrada de datos*)
write('Ingrese las coordenadas del punto 1: ');
readln(x1, y1);
write('Ingrese las coordenadas del punto 2: ');
readln(x2, y2);

(*Cálculo de la distancia*)
d := distancia(x1, y1, x2, y2);

(*Salida de datos*)
writeln('La distancia entre puntos es: ', d:4:2)

end.
