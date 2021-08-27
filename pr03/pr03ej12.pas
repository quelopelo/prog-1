program pr03ej12;

const
costo_onza = 0.17;
peso_fijo = 1;
costo_fijo = 0.22 - costo_onza;

var
peso, costo: real;

begin

write ('Peso de carta (en onzas): ');
readln (peso);

costo := trunc(peso);
if	peso - costo > 0
then    costo := costo + 1;

if      costo < peso_fijo
then    costo := peso_fijo;

costo := costo_fijo + costo_onza * costo;

writeln ('Peso    Costo');
writeln (peso:4:2, '    $', costo:4:2)

end.
