program pr03ej13;

var	n, d, n1, n2, n3, n4: integer;
	c1, c2, c3, c4: char;
	b: boolean;

(*Procedimiento que verifica las apariciones de a un dígito*)
procedure digito (n: integer; var c: char; var b: boolean);
	begin
	if n = d
	then
		begin
		c := '+';
		b := true
		end
	else
		c := ' '
end;

begin

(*Entrada de datos*)
write ('Ingrese un entero de 4 dígitos: ');
readln (n);
write ('Ingrese un entero de 1 dígito: ');
readln (d);

(*Separación en dígitos*)
n1 := n div 1000;
n4 := n - n1 * 1000;
n2 := n4 div 100;
n4 := n4 - n2 * 100;
n3 := n4 div 10;
n4 := n4 - n3 * 10;

(*Comprobación de apariciones*)
b := false;
digito (n1, c1, b);
digito (n2, c2, b);
digito (n3, c3, b);
digito (n4, c4, b);

(*Salida de datos*)
if b
then
	begin
	writeln (n:4);
	writeln (c1, c2, c3, c4)
	end
else
	writeln (d:1, ' no aparece en ', n:4)

end.
