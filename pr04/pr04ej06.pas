program pr04ej06;

var
n, i, num, min, max : integer;

begin

write('Ingrese un valor para n (n > 0): ');
readln(n);
if n = 1
then	write('Ingrese 1 entero: ')
else	write('Ingrese ', n:1, ' enteros: ');

read(num);
min := num;
max := num;

for	i := 2 to n do
begin
	read(num);
	if	num < min
	then	min := num
	else
		if	num > max
		then	max := num
end;
 
writeln('El mayor entero ingresado es: ', max:1);
writeln('El menor entero ingresado es: ', min:1)

end.
