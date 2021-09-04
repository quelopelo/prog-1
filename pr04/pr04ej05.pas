program pr04ej05;

var
n, i, raiz : integer;

begin

write('Ingrese un número natural (mayor a 0): ');
readln(n);

write('Los divisores son: 1'); 		{1 siempre es divisor}

raiz := trunc(sqrt(n));			{Se itera hasta trunc(raiz) por eficiencia}

for	i := 2 to raiz do
	if	n mod i = 0
	then	write(' ', i:1);

if	n div raiz = raiz		{Se actualiza raiz para evitar divisores repetidos}
then	raiz := raiz - 1;

for	i := raiz downto 2 do
	if	n mod i = 0
	then	write(' ', (n div i):1);

if	n > 1 				{Si n = 1, el divisor 1 ya se ingresó}
then	write(' ', n:1); 		{n siempre es divisor}

writeln

end.
