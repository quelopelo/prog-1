program pr03ej11;

var
a, b, c, d, e, f, det: real;

begin

(*Entrada de datos*)
writeln ('Solucionador de sistema de ecuaciones lineales de 2 x 2');
writeln ('ax + by = c');
writeln ('dx + ey = f');
write ('Ingrese los valores de a, b y c separados por espacios: ');
readln (a, b, c);
write ('Ingrese los valores de d, e y f separados por espacios: ');
readln (d, e, f);

(*Cálculo del determinante*)
det := a * e + b * d;

(*Salida de datos*)
if det = 0
then writeln ('El sistema de ecuaciones no es compatible determinado')
else
	begin
	{writeln ('det = ', det);}
	writeln ('x = ', (c * e - f * b) / det);
	writeln ('y = ', (a * f - d * c) / det)
	end

end.
