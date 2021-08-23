program pr06ej01;

var	m, n, mcd : integer;

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
	mcd := m;
	m := n;
	n := mcd
end;

(*Cálculo del máximo común divisor y salida de datos*)
if	n = 0
then	writeln('Error: m y n no pueden ser los dos 0')
else
begin
	if	m = 0
	then	mcd := n		{MCD (m,0) = m}
	else
	begin
		n := n mod m;		{MCD (n,m) = MCD (m, n mod m)}
		if	n = 0
		then	mcd := m	{MCD (m,0) = m}	
		else
		begin
			mcd := n;	{n < m (resto de la división}
			while	(m mod mcd <> 0) or (n mod mcd <> 0) do
				mcd := mcd - 1
		end
	end;
	writeln('MCD = ', mcd:1)	{Salida de datos}
end;

end.
