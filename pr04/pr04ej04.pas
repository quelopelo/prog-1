program pr04ej04;

var
a, b, n, i : integer;

begin

(*Entrada de datos*)
writeln('Cálculo de múltiplos de n entre a y b');
write('a = ');
readln(a);
write('b = ');
readln(b);
write('n = ');
readln(n);

(*Cálculo del primer múltiplo (a * n)*)
if	a mod n = 0
then	a := a div n
else	a := a div n + 1;

(*Cálculo del último múltiplo (b * n)*)
b := b div n;

(*Cálculo de múltiplos y salida de datos*)
write('Los múltiplos son: ');
for i := a to b do
	write((n * i):1, ' ');
writeln

end.
