program pr04ej05;

var
n, i : integer;

begin

write('Ingrese un número natural (mayor a 0): ');
readln(n);

write('Los divisores son: 1'); 	{1 siempre es divisor}

for i := 2 to (n div 2) do		{Se itera hasta la mitad por eficiencia}
	if n mod i = 0 then
		write(' ', i:1);
		
if n > 1 then 					{Si n = 1, el divisor 1 ya se ingresó}
	write(' ', n:1); 				{n siempre es divisor}

writeln

end.
