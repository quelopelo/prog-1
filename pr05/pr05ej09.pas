program pr05ej09;

var	n, m, i : integer;
	not_div : boolean;

begin

write('Ingrese un número natural (> 1): ');
readln(n);

not_div := true;
i := 2;
m := trunc(sqrt(n));

while not_div and (i <= m) do
begin
	not_div := n mod i > 0;
	i := i + 1
end;

if not_div
then writeln('El número es primo')
else writeln('El número no es primo')

end.
