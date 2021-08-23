program pr06ej09;

var	i, j, m, n : integer;

begin

(*Entrada de datos*)
write('Ingrese un valor para m: ');
readln(m);
write('Ingrese un valor para n: ');
readln(n);

(*Salida de datos*)
for	i := m to n do
begin
	writeln('>>> Tabla ', i:1,' <<<');
	for	j := 1 to 10 do
		writeln(j:1, '*', i:1, ' = ', j*i:1)
end

end.
