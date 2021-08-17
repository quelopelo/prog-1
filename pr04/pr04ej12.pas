program pr04ej12;

const
a = 1;		{x^2}
b = -9;		{x*y}
c = 1;		{y^2}
d = 0;		{x}
e = 0;		{y}
f = 0;		{1}

var
n, x, y, z, max : integer;

begin

(*Entrada de datos*)
write('Ingrese un valor (natural) para n: ');
readln(n);

(*Cálculo del máximo*)
max := a * n*n + b * n*n + c * n*n - d * n - e * n + f;
for	x := -n to n do
	for	y := -n to n do
	begin
		z := a * x*x + b * x*y + c * y*y + d * x + e * y + f;
		if	z > max then
			max := z
	end;

(*Salida de datos*)
write('El valor máximo para x e y en el entorno de ');
writeln(-n:1, ' a ', n:1, ' es ', max:1)

end.
