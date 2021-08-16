program pr04ej07;

const c = '*';

var
n, i, j : integer;

begin

(*Entrada de datos*)
write('Ingrese un valor para n (n > 0): ');
readln(n);
if n = 1
then
	write('Ingrese 1 natural: ')
else
	writeln('Ingrese ', n, ' naturales: ');

(*Salida de datos*)
for i := 1 to n do
	begin
	read(n);
	for j := 1 to n do
		write(c);
	writeln
	end

end.
