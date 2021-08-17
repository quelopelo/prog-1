program pr04ej08;

var	n, i, j : integer;
	c : char;

begin

(*Entrada de datos*)
write('Ingrese un carácter c: ');
readln(c);
write('Ingrese un valor (natural) para n: ');
readln(n);

(*Salida de datos*)
for	i := 1 to n do
begin
	for	j := 1 to n-i+1 do
		write(c);
	writeln;
end

end.
