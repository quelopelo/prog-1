program pr06ej05;

var	n, i, j, k : integer;

begin

write('Ingrese un número natural: ');
readln(n);

write('Cuadrados consecutivos: 1 ');

i := 1;
k := 1;
repeat
	i := i + 1;
	j := k;
	k := i * i;
	write(k:1, ' ')
until	k - j > n;
writeln

end.
