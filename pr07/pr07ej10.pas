program pr07ej10;

var	x1, y1, x2, y2, x3, y3, x4, y4, area : real;

function distancia (x1, y1, x2, y2 : real) : real;
begin
	(*Posición relativa del punto 2 respecto al punto 1*)
	x2 := x2 - x1;
	y2 := y2 - y1;
	(*Cálculo de la distancia mediante la fórmula de Pitágoras*)
	distancia := sqrt(x2 * x2 + y2 * y2)
end;

function area_triangulo (a, b, c: real) : real;
var	mitad : real;
begin
	(*Mitad del perimetro del triángulo*)
	mitad := (a + b + c) / 2;
	(*Cálculo del área mediante la fórmula de Heron*)
	area_triangulo := sqrt(mitad * (mitad - a) * (mitad - b) * (mitad - c))
end;

function area_cuadrilatero(x1, y1, x2, y2, x3, y3, x4, y4 : real) : real;
var	d12, d13, d14, d23, d24, d34 : real;
begin
	(*Cálculo de los lados de los triángulos*)
	d12 := distancia(x1, y1, x2, y2);
	d13 := distancia(x1, y1, x3, y3);
	d14 := distancia(x1, y1, x4, y4);
	d23 := distancia(x2, y2, x3, y3);
	d24 := distancia(x2, y2, x4, y4);
	d34 := distancia(x3, y3, x4, y4);
	(*Cálculo del área utilizando la función area_triangulo*)
	{Se suman las cuatro posibilidades y se divide entre dos}
	{De esta forma se tiene en cuenta cualquier órden de los puntos}
	area_cuadrilatero := 0.5 * (area_triangulo(d12, d13, d23) +	{1-2-3}
				    area_triangulo(d23, d24, d34) +	{2-3-4}
				    area_triangulo(d13, d14, d34) +	{3-4-1}
				    area_triangulo(d12, d14, d24))	{4-1-2}
end;

(*Programa principal*)
begin

(*Entrada de datos*)
write('Ingrese las coordenadas del punto 1: ');
readln(x1, y1);
write('Ingrese las coordenadas del punto 2: ');
readln(x2, y2);
write('Ingrese las coordenadas del punto 3: ');
readln(x3, y3);
write('Ingrese las coordenadas del punto 4: ');
readln(x4, y4);

(*Cálculo del área*)
area := area_cuadrilatero(x1, y1, x2, y2, x3, y3, x4, y4);

(*Salida de datos*)
writeln('El área del cuadrilatero es: ', area:4:2)

end.
