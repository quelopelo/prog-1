program pr07ej13;

var	num, aux : integer;

function factor_primo (n : integer) : integer;
{Precondición: n >= 2}
var	i : integer;
begin
	i := 2;
	while	(n mod i <> 0) and (i < n) do
		i := i + 1;
	factor_primo := i;
end;

(*Programa principal*)
begin

writeln('Descomposición prima de enteros positivos');
write('Ingrese n (n ≥ 2): ');
read(num);

while	num <> 0 do
begin
	aux := factor_primo(num);
	write(num:1, ' = ', aux:1);
	while	num <> aux do
	begin
		num := num div aux;
		aux := factor_primo(num);
		write(' x ', aux:1)
	end;
	writeln;
	write('Ingrese n (n ≥ 2): ');
	read(num)
end

end.
