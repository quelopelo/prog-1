program pr02ej21;

const
b = 0.5;

var
a, res : real;

begin

write ('Ingrese un real positivo: ');
readln (a);
writeln('Valor introducido (a) = ', a);

res := exp(b * ln(a));
writeln('Raiz cuadrada calculada = ', res);

res := sqrt(a);
writeln('Valor de Sqrt(a) = ', res);

end.
