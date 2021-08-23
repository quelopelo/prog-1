program pr06ej03;

var	a : integer;
	x, p : real;

begin

writeln('Evaluación de p(x) = a_n x^n + a_(n-1) x^(n-1) + ... + a_1 x^1 + a0');
write('Ingrese x (real): ');
readln(x);
write('Ingrese los coeficientes a_i (naturales): ');

read(p);
read(a);
while	a >= 0 do
begin
	p := p * x + a;
	read(a)
end;

writeln('El valor de p(x) es: ', p:4:2)

end.
