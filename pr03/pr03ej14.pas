program pr03ej14;

var
a, b, c, dis: real;

begin

(*Entrada de datos*)
writeln ('Solucionador de ecuación cuadrática');
writeln ('ax² + bx + c = 0');
write ('Ingrese los valores de a, b y c separados por espacios: ');
readln (a, b, c);

(*Cálculo del discriminante*)
dis := b * b - 4 * a * c;

(*Salida de datos*)
if	dis = 0
then	writeln ('Dos raíces reales iguales: ', (-b / (2 * a)):6:2)
else
begin
	if	dis > 0
	then
	begin
		dis := sqrt(dis);
		write ('Dos raíces reales diferentes: ');
		write (((-b - dis) / (2 * a)):6:2, ' y ');
		writeln (((-b + dis) / (2 * a)):6:2)
	end
	else
	begin
		dis := sqrt(-dis);
		write ('Dos raíces complejas diferentes: ');
		write ((-b / (2 * a)):6:2, ' (+/-) i ');
		writeln ((dis / (2 * a)):6:2)
	end
end

end.
