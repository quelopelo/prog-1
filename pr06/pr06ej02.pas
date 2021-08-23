program pr06ej02;

const	fin = '.';
	sep = ' ';

var	letra, c1, c2 : char;
	cont_a, cont_b, cont_c, cont_pal : integer; 

begin

(*Entrada de datos*)
write('Letra: ');
readln(letra);
write('Oración: ');

(*Inicialización de variables*)
read(c1);
cont_a := 0;
if	c1 = letra
then	cont_b := 1
else	cont_b := 0;
cont_c := 0;
cont_pal := 0;

(*Ciclo de contabilización*)
repeat
	read(c2);
	if	c1 = letra
	then	
	begin
		cont_pal := cont_pal + 1;
		if	(c2 = sep) or (c2 = fin)
		then	cont_a := cont_a + 1
	end;
	if	(c1 = sep) and (c2 = letra)
	then	cont_b := cont_b + 1;
	if	(c2 = sep) or (c2 = fin)
	then
	begin
		if 	cont_pal = 1
		then	cont_c := cont_c + 1;
		cont_pal := 0;
	end;
	c1 := c2
until	c1 = fin;

(*Salida de datos*)
writeln('Cantidad (parte a): ', cont_a:1);
writeln('Cantidad (parte b): ', cont_b:1);
writeln('Cantidad (parte c): ', cont_c:1);

end.
