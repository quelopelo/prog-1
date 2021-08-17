program pr05ej10;

var	num, res : integer;
	car : char;

begin

write('Operación: ');

read(res);
repeat
read(car)
until car <> ' ';

while car <> '=' do
begin
	read(num);
	case car of
		'+':	res := res + num;
		'-':	res := res - num;
		'*':	res := res * num;
		'/':	res := res div num
	end;
	repeat
	read(car)
	until car <> ' '
end;

writeln('Resultado: ', res:1)

end.
