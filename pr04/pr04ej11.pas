program pr04ej11;

const
a = 1;
b = -18;
c = 5;

var
m, n, x, y, max : integer;

begin

(*Entrada de datos*)
write('Ingrese un valor para m: ');
readln(m);
write('Ingrese un valor para n: ');
readln(n);

(*Cálculo del máximo*)
max := a * m * m + b * m + c;
for x := m+1 to n do
	begin
	y := a * x * x + b * x + c;
	if y > max then
		max := y
	end;

(*Salida de datos*)
write('El valor máximo para x en el entorno de ');
writeln(m, ' a ', n, ' es ', max)

end.
