program pr07ej11;

var	i, m, n : integer;

function es_primo (n : integer) : boolean;
{Precondición: n >= 2}
var	i, m : integer;
begin
	if	n mod 2 = 0
	then
		if	n = 2
		then	es_primo := true
		else	es_primo := false
	else
	begin
		i := 3;
		m := trunc(sqrt(n));
		while	(n mod i > 0) and (i <= m) do
			i := i + 2;
		if	i > m
		then	es_primo := true
		else	es_primo := false
	end
end;

(*Programa principal*)
begin

(*Entrada de datos*)
write('Ingrese dos números naturales (m ≥ 2 y n ≥ m): ');
readln(m, n);

(*Procesamiento y salida de datos*)
if	m > n
then	write('Error: n debe ser mayor a m')
else
begin
	writeln('Los primos gemelos entre ', m:1, ' y ', n:1, ' son: ');
	for	i := m to n-2 do
		if	es_primo(i) and es_primo(i+2)
		then	writeln(i:1, ' y ', (i+2):1)
end

end.
