program pr03ej15;

var
	c1, c2, c3: char;
	n1, n2, n3, n: integer;

(*Procedimiento que convierte un solo dígito*)
procedure convertir (c: char; var n: integer);
	begin
	case c of
	'0':		n := 0;
	'1':		n := 1;
	'2':		n := 2;
	'3':		n := 3;
	'4':		n := 4;
	'5':		n := 5;
	'6':		n := 6;
	'7':		n := 7;
	'8':		n := 8;
	'9':		n := 9;
	'A', 'a':	n := 10;
	'B', 'b':	n := 11;
	'C', 'c':	n := 12;
	'D', 'd':	n := 13;
	'E', 'e':	n := 14;
	'F', 'f':	n := 15
	end
	end;

begin

(*Entrada de datos*)
write ('Escriba un número hexadecimal de tres cifras: ');
readln (c1, c2, c3);

(*Conversión a base decimal*)
convertir (c1, n1);
convertir (c2, n2);
convertir (c3, n3);
n := n1 * 16*16 + n2 * 16 + n3;

(*Salida de datos*)
writeln('Hexadecimal ', c1, c2, c3, ' = Decimal ', n)

end.
