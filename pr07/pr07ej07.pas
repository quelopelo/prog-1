program pr07ej07;

var	a, b, c, x1, x2 : real;
	cant : integer;

procedure raices (a, b, c : real; var x1, x2 : real; var cant : integer);
var	disc : real;
begin
	disc := b * b - 4 * a * c;		{Discriminante}
	if	disc < 0			{Ninguna raíz real}
	then	cant := 0
	else
		if	disc = 0		{Una raíz real doble}
		then
		begin
			cant := 1;
			x1 := -b / (2 * a)
		end
		else				{Dos raíces reales}
		begin
			cant := 2;
			disc := sqrt(disc);
			x1 := (-b - disc) / (2 * a);
			x2 := (-b + disc) / (2 * a)
		end
end;

(*Programa principal*)
begin

(*Entrada de datos*)
writeln ('Solucionador de ecuación cuadrática');
writeln ('ax² + bx + c = 0');
write ('Ingrese los valores de a, b y c separados por espacios: ');
readln (a, b, c);

(*Cálculo de las raíces reales*)
raices(a, b, c, x1, x2, cant);

(*Salida de datos*)
if	cant = 0
then	writeln('Ninguna raíz real')
else
	if	cant = 1
	then	writeln('Una raíz real doble: ', x1:4:2)
	else	writeln('Dos raíces reales: ', x1:4:2, ' y ', x2:4:2)

end.
