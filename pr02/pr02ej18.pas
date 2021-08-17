program pr02ej18;

(* Programa que calcula el error relativo de una medición*)

var
m, v, er : real;

begin

(*Entrada de datos*)
write ('Ingrese la medición y el valor verdadero: ');
readln (m, v);

(*Cálculo del error relativo*)
er := abs(m - v) / v;

(*Salida de datos*)
writeln ('Medición: ', m);
writeln ('Valor verdadero: ', v);
writeln ('Error relativo: ', er);

end.
