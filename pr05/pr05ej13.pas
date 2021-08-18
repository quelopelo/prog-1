program pr05ej13;

var
b, n, k, res : integer;

begin

(*Entrada de datos*)
writeln('Parte entera del logaritmo de n en base b');
write('n (> 0) = ');
readln(n);
write('b (> 1) = ');
readln(b);

(*Cálculo de la parte entera del logaritmo*)
k := 0;
res := b;
while	res <= n do
begin
	k := k + 1;
	res := res * b
end;

(*Salida de datos*)
writeln('Resultado: ', k:1)

end.
