program	pr10ej04;

type	tipo_mes = (enero, febrero, marzo, abril, mayo, junio, julio,
                    agosto, setiembre, octubre, noviembre, diciembre);

var		mes : tipo_mes;

procedure	leer_mes (var mes : tipo_mes);
var		num : 1..12;
begin
	read(num);
	case num of
		1	:	mes := enero;
		2	:	mes := febrero;
		3	:	mes := marzo;
		4	:	mes := abril;
		5	:	mes := mayo;
		6	:	mes := junio;
		7	:	mes := julio;
		8	:	mes := agosto;
		9	:	mes := setiembre;
		10	:	mes := octubre;
		11	:	mes := noviembre;
		12	:	mes := diciembre
	end
end;

procedure	mostrar_mes (mes : tipo_mes);
begin
	case mes of
		enero		:	write('enero');
		febrero		:	write('febrero');
		marzo		:	write('marzo');
		abril		:	write('abril');
		mayo		:	write('mayo');
		junio		:	write('junio');
		julio		:	write('julio');
		agosto		:	write('agosto');
		setiembre	:	write('setiembre');
		octubre		:	write('octubre');
		noviembre	:	write('noviembre');
		diciembre	:	write('diciembre')
	end
end;

(*Programa principal*)
begin

(*Entrada de datos*)
write('Ingrese un mes de la forma 1-12: ');
leer_mes(mes);
readln;

(*Salida de datos*)
write('El mes ingresado es: ');
mostrar_mes(mes);
writeln


end.
