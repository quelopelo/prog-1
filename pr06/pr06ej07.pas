program pr06ej07;

const	sep = '|';
	fin = '$';

var	c : char;

begin

(*Entrada de datos*)
write('Ingrese los datos de la etiqueta: ');

(*Salida de datos*)
read(c);
if	c <> fin
then
begin
	repeat
		if	c = sep
		then	writeln
		else	write(c);
		read(c)
	until c = fin;
	writeln;
	writeln;
	writeln
end

end.
