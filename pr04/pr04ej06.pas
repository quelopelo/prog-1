program pr04ej06;

var
n, i, num, min, max : integer;

begin

write('Ingrese un valor para n (n > 1): ');
readln(n);

write('Ingrese ', n, ' enteros: ');

read(num);
min := num;
max := num;

for i := 2 to n do
	begin
	read(num);
	if num < min then
		min := num;
	if num > max then
		max := num
	end;
 
writeln('El mayor entero ingresado es: ', max);
writeln('El menor entero ingresado es: ', min)

end.
