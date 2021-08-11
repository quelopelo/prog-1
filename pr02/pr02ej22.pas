program pr02ej22;

(*Programa que pasa a base decimal un número de tres cifras en base octal*)

var
oct, a, b, c, dec: integer;

begin

(*Entrada de datos*)
write ('Ingrese un número de tres cifras en base octal: ');
readln (oct);

(*Pasaje a base decimal*)
a := oct div 100; {*centenas*}
c := oct - a * 100; {resto}
b := c div 10; {decenas}
c := c - b * 10; {resto = unidades}
dec := a * 64 + b * 8 + c;

(*Salida de datos*)
write ('Octal ', oct, ' = Decimal ', dec)

end.
