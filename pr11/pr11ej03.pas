program pr03ej13;

const
    max = 100;

type    
    Cadena = record
                 cars : array [1..max] of char;
                 tope : 0..max;
             end;

var
    frase : Cadena;
    letra : char;

procedure cargarCadena (var cad : Cadena);
const fin = '.';
var car : char;
begin
    cad.tope := 0;
    read (car);
    while (car <> fin) and (cad.tope < max) do
    begin
        cad.tope := cad.tope + 1;
        cad.cars[cad.tope] := car;
        read (car)
    end;
    readln
end;

function contarOcurrencias (frase : Cadena; letra : char) : integer;
var i : 1..max;
    cant : 0..max;
begin
    cant := 0;
    for i := 1 to frase.tope do
        if frase.cars[i] = letra then
            cant := cant + 1;
    contarOcurrencias := cant
end;

function existeVocal (frase : Cadena) : boolean;
const vocales = ['a', 'e', 'i', 'o', 'u'];
var i : 1..(max+1);
begin
    i := 1;
    while (i <= frase.tope) and not (frase.cars[i] in vocales) do
        i := i + 1;
    existeVocal := i <= frase.tope
end;

(*Programa principal*)
begin

(*Entrada de datos*)
writeln ('Ingrese una frase:');
cargarCadena (frase);
write ('Ingrese una letra: ');
readln (letra);

(*Salida de datos*)
writeln ('La letra ', letra, ' ocurrre ', contarOcurrencias (frase, letra):1, ' veces');
if existeVocal (frase) then
    writeln ('La frase tiene al menos una vocal')
else
    writeln ('La frase no tiene vocales')

end.
