program pr04ej10;

var	n, i : integer;		{2 bytes: -32768 a 32767}
	factorial : int64;	{8 bytes: -9223372036854775808 a 9223372036854775807}

begin

(*Entrada de datos*)
write('Ingrese un valor para n (0 ≤ n ≤ 20): ');
readln(n);

(*Cálculo del factorial*)
factorial := 1;
for i := 2 to n do
	factorial := factorial * i;

(*Salida de datos*)
writeln('El factorial de ', n, ' es ', factorial)

end.
