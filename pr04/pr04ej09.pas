program pr04ej09;

var
x, n, i, potencia: integer;

begin

(*Entrada de datos*)
write('Ingrese un valor (entero) para x: ');
readln(x);
write('Ingrese un valor (natural) para n: : ');
readln(n);

(*Cálculo de la potencia*)
potencia := 1;
for i := 1 to n do
	potencia := potencia * x;

(*Salida de datos*)
write('El resultado de ', x:1, ' elevado a la ', n:1);
writeln(' es: ', potencia:1)

end.
