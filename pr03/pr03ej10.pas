program p03ej10;

var	num: integer;

procedure tres_cifras (num: integer);
	var aux: integer;
	begin
	aux := num div 100;
	write(aux);
	num := num - aux * 100;
	aux := num div 10;
	write(aux);
	num := num - aux * 10;
	write(num);
	end;

begin

write ('Ingrese un número entero de hasta cuatro cifras: ');
readln (num);

write ('El número con separador de miles es: ');
if num < 1000
then write (num)
else
	begin
	write (num div 1000, '.');
	tres_cifras (num mod 1000)
	end;
writeln

end.
