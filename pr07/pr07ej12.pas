program pr07ej12;

var	n1, n2 : integer;

function multiplo (m, n : integer) : boolean;
{Precondición: m y n enteros positivos}
var	aux : integer;
begin
	if	m > n
	then
	begin
		aux := m;
		m := n;
		n := aux
	end;
	multiplo := n mod m = 0
end;

(*Programa principal*)
begin

writeln('Ingrese parejas de números enteros positivos:');
read(n1);

while	n1 <> -1 do
begin
	readln(n2);
	writeln(multiplo(n1, n2));
	read(n1)
end

end.
