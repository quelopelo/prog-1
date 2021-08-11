program pr02ej19;

var
a, b : integer;

begin

write ('Ingrese un natural de dos cifras: ');
readln (a);
writeln ('Número introducido = ', a);

b := a * a;
writeln ('Cuadrado del número = ', b);

b := b mod 1000;
b := b div 10;
writeln ('Siguiente número seudoaleatorio = ', b);

end.
