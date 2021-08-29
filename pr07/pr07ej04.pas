program pr07ej04;

var	x, y, z : integer;

procedure girar (var a, b, c : integer);
var	aux : integer;
begin
	aux := c;
	c := b;
	b := a;
	a := aux;
end;

(*Programa principal*)
begin

(*Entrada de datos*)
write('Ingrese tres enteros separados por espacios: ');
readln(x, y, z);

(*Invocación del procedimiento*)
girar(x, y, z);

(*Salida de datos*)
write('Los enteros ingresados girados son: ');
writeln(x:1, ' ', y:1, ' ', z:1)

end.
