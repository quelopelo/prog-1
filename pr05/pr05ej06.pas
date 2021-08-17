program pr05ej06;

var	i, num, sum, max, min : integer;
	mean: real;

begin

write('Ingrese una secuencia de números naturales: ');
read(num);

if	num = -1	{Secuencia sin datos}
then
begin
	writeln('Suma:      0');
	writeln('Promedio:  no definido');
	writeln('Mínimo:    no definido');
	writeln('Máximo:    no definido')
end
else			{Secuencia con al menos un dato}
begin
	i := 0;
	sum := 0;
	max := num;
	min := num;
	while	num <> -1 do
	begin
		i := i + 1;
		sum := sum + num;
		if	num > max
		then	max := num;
		if	num < min
		then	min := num;
		read(num)
	end;
	mean := sum / i;
	writeln('Suma:      ', sum:1);
	writeln('Promedio:  ', mean:1:1);
	writeln('Mínimo:    ', min:1);
	writeln('Máximo:    ', max:1)
end

end.
