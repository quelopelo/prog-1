program pr09ej12;

const	N = 5;

type	rango = 1..N;
	digito = '0'..'9';
	digitos = array [rango] of digito;

var	vector : digitos;
	num : integer;

procedure lectura (var vector : digitos);
{Precondición: los valores leídos deben ser sólo dígitos sin espacios entre ellos}
var	i : rango;
begin
	for	i := 1 to N do
		read(vector[i]);
	readln
end;

function conversion (vector : digitos) : integer;
var	i : rango;
	aux, num : integer;
{SP}	function conversion_digito (c : digito) : integer;
	begin
		conversion_digito := ord(c) - 48;
	end;
begin
	aux := 1;
	num := conversion_digito(vector[N]);
	for i := (N-1) downto 1 do
	begin
		aux := aux * 10;
		num := num + conversion_digito(vector[i]) * aux
	end;
	conversion := num
end;

(*Programa principal*)
begin

(*Entrada de datos*)
write('Ingrese un número de ', N:1, ' cifras: ');
lectura(vector);

(*Procesamiento de datos*)
num := conversion(vector);

(*Salida de datos*)
writeln('El número ingresado es: ', num:N)

end.
