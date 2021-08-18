program pr05ej11;

var	n : integer;
	num, s1, s2 : real;

begin

write('Ingrese una secuencia de números naturales: ');

(*Inicialización de variables*)
n := 0;
s1 := 0;
s2 := 0;
read(num);

(*Instrucciones de acumulación*)
while	num >= 0 do
begin
	n := n + 1;
	s1 := s1 + num;
	s2 := s2 + num * num;
	read(num)
end;

(*Salida de datos*)
if	n < 2
then	writeln('La cantidad de números debe ser mayor a 1')
else	writeln('La desviación estandar es: ', sqrt((s2 - s1 * s1 / n) / n):4:2)

end.
