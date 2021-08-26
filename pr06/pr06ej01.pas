program pr06ej01;

var	m, n, aux : integer;

begin

(*Entrada de datos*)
writeln('Máximo común divisor (MCD) de m y n (naturales): ');
write('m = ');
readln(m);
write('n = ');
readln(n);

(*Ordenamiento de datos*)
if	m > n
then
begin
	aux := m;
	m := n;
	n := aux
end;

(*Cálculo del máximo común divisor y salida de datos*)
if	n = 0
then	writeln('Error: m y n no pueden ser los dos 0')
else
begin
	while	m > 0 do		{MCD (n,0) = n}	
	begin
		aux := n mod m;		{MCD (n,m) = MCD (m, n mod m)}
		n := m;
		m := aux;		{n < m (resto de la división}
	end;
	writeln('MCD = ', n:1)		{Salida de datos}
end

end.
