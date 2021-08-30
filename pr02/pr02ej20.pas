program pr02ej20;

var
x, y, aux : real;

begin

write ('Ingrese un valor real entre 0 y 1: ');
readln (x);
writeln ('Valor ingresado (x) = ', x);

aux := x * x / 2;
y := 1 + x + aux;	{2}
aux := aux * x / 3;
y := y + aux;		{3}
aux := aux * x / 4;
y := y + aux;		{4}
writeln ('Suma de los cinco términos = ', y);

y := exp(x);
writeln ('Valor de Exp(x) = ', y);

end.
