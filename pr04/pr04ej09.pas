program pr04ej09;

var	x, n, i : integer;	{2 bytes: -32768 a 32767}
	potencia : longint;	{4 bytes: -2147483648 a 2147483647}

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
writeln('El resultado de ', x, ' elevado a la ', n, ' es: ', potencia)

end.
