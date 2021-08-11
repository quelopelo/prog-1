program pr03ej14;

var
a, b, c, det: real;

begin

(*Entrada de datos*)
writeln ('Solucionador de ecuación cuadrática');
writeln ('ax² + bx + c = 0');
write ('Ingrese los valores de a, b y c separados por espacios: ');
readln (a, b, c);

(*Cálculo del determinante*)
det := b * b - 4 * a * c;

(*Salida de datos*)
if det > 0
then 
	begin
	det := sqrt(det);
	write ('Dos raíces reales diferentes: ');
	write (((-b - det) / (2 * a)):6:2, ' y ');
	writeln (((-b + det) / (2 * a)):6:2)
	end
else
	if det = 0
	then writeln ('Dos raíces reales iguales: ', (-b / (2 * a)):6:2)
	else
		begin
		det := sqrt(-det);
		write ('Dos raíces complejas diferentes: ');
		write ((-b / (2 * a)):6:2, ' (+/-) i ');
		writeln ((det / (2 * a)):6:2)
		end
end.
