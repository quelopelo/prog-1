program pr06ej10;

var	i, m, n : integer;

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

(*Entrada de datos*)
write('Ingrese dos números naturales (m y n): ');
readln(m, n);

(*Procesamiento y salida de datos*)
if	m > n
then	write('Error: n debe ser mayor a m')
else
begin
	write('Los números primos entre ', m:1, ' y ', n:1, ' son: ');
	for	i := m to n do
		if	es_primo(i)
		then	write(i:1, ' ')
end;
writeln

end.
