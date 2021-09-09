program pr06ej04;

var	i, n, num : integer;

function es_primo(n : integer) : boolean;
{Precondición: n >= 0}
var	i, m : integer;
begin
	if	n mod 2 = 0
	then	es_primo := n = 2
	else
	begin
		i := 3;
		m := trunc(sqrt(n));
		while	(n mod i > 0) and (i <= m) do
			i := i + 2;
		es_primo := (i > m) and (n > 2)
	end
end;

begin

write('Ingrese un número natural (> 0): ');
readln(n);

if	n = 1
then	write('Raíz cuadrada del primer primo: ')
else	writeln('Raices cuadradas de los primeros ', n:1, ' primos: ');

i := 1;
num := 1;
repeat
	num := num + 1;
	if	es_primo(num)
	then
	begin
		i := i + 1;
		write(sqrt(num):4:2, ' ')
	end
until i > n;
writeln

end.
