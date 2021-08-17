program pr05ej10;

var	num, res : integer;
	car : char;

begin

write('Operación: ');

read(res);
repeat	read(car)
until	car <> ' ';
{En vez de este repeat, podría ir read(car) para resolver la parte a}
{En vez de este repeat, podría ir read(car, car) para resolver la parte b}

while	car <> '=' do
begin
	read(num);
	case car of
		'+':	res := res + num;
		'-':	res := res - num;
		'*':	res := res * num;
		'/':	res := res div num
	end;
	repeat	read(car)
	until	car <> ' '
	{En vez de este repeat, podría ir read(car) para resolver la parte a}
	{En vez de este repeat, podría ir read(car, car) para resolver la parte b}
end;

writeln('Resultado: ', res:1)

end.
