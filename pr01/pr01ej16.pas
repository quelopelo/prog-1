program pr01ej16 (input, output);

(*Programa que calcula el área de un triángulo cuyos lados son de longitud a, b y c*)

var
a, b, c, area : real;

begin

(*Entrada de datos*)
readln (a, b, c);

(*Cálculo del área del triángulo*)
area := (a + b + c) / 2;
area := sqrt(area * (area - a) * (area - b) * (area - c));

(*Salida de datos*)
writeln (area);

end.
