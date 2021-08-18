program pr05ej12.pas;

const
base = 2;

var
exp, val : integer;

begin

(*Entrada de datos*)
write('Ingrese un número natural (> 0): ');
readln(val);
write('Descomposición: ', val:1);

(*Descomposición del número*)
exp := 0;
while	val mod base = 0 do
begin
	exp := exp + 1;
	val := val div base
end;

(*Salida de datos*)
writeln(' = ', base:1, ' ^ ', exp:1, ' * ', val:1)

end.
