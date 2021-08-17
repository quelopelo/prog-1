program pr05ej08;

const
fin = '$';

var
c1, c2 : char;

begin

write('Ingrese un texto: ');

read(c1);
write('Letras repetidas: ');

while	c1 <> fin do
begin
	read(c2);
	if c2 = c1
	then
	begin
		write(c1, c2, ' ');
		read(c1)
	end
	else	c1 := c2
end;

writeln

end.
