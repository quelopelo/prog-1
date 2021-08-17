program pr04ej11;

const
a = 1;		{x^2}
b = -18;	{x}
c = 5;		{1}

var
m, n, x, y, max : integer;

begin

(*Entrada de datos*)
write('Ingrese un valor (entero) para m: ');
readln(m);
write('Ingrese un valor (entero) para n: ');
readln(n);

(*Cálculo del máximo*)
max := a * m * m + b * m + c;
for	x := m+1 to n do
begin
	y := a * x * x + b * x + c;
	if	y > max then
		max := y
end;

(*Salida de datos*)
write('El valor máximo para x en el entorno de ');
writeln(m:1, ' a ', n:1, ' es ', max:1)

end.
