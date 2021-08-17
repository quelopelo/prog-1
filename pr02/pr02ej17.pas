program pr02ej17;

var
h1, h2, m1, m2, d, h, m : integer;

begin

(*Entrada de datos*)
write ('Escriba dos tiempos de la forma hhmm: ');
readln (m1, m2);

(*Separación de los tiempos ingresados*)
h1 := m1 div 100;
h2 := m2 div 100;
m1 := m1 - h1 * 100;
m2 := m2 - h2 * 100;

(*Cálculo de la suma de tiempos*)
m := m1 + m2;
h := m div 60;
m := m - h * 60;
h := h + h1 + h2;
d := h div 24;
h := h - d * 24;

(*Salida de datos*)
writeln ('Suma (d hhmm): ', d:1, ' ', h:2, m:2)

end.
