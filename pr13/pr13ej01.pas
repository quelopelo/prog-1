program pr13ej01;

const
    max = 10;  {Algún valor apropiado}
type
    arregloEnteros = array [1..max] of integer;
var
    a : arregloEnteros;
    e, pos : integer;
    ocurre : boolean;

procedure IngresarArreglo (var a : arregloEnteros);
var i : 1..max;
begin
    for i := 1 to max do
        read (a[i]);
    readln;
end;

procedure BuscarPosicionElemento (e : Integer; a : arregloEnteros;
                                 var ocurre : boolean; var pos : integer);
{Devuelve en 'ocurre' si el elemento 'e' se encuentra en el arreglo 'a'.
Si ocurre = true, devuelve en 'pos' la menor posición de ocurrencia del
elemento en el arreglo (si es que ocurre)}
begin
    pos := 1;
    while (pos <= max) and (a[pos] <> e) do
        pos := pos + 1;
    ocurre := pos <= max
end;

(*Programa principal*)
begin

(*Entrada de datos*)
writeln ('Ingrese un arreglo de ', max, ' enteros:');
IngresarArreglo (a);
write ('Ingrese un entero para buscar: ');
readln (e);

(*Procesamiento*)
BuscarPosicionElemento (e, a, ocurre, pos);

(*Salida de datos*)
if ocurre then
    writeln ('La primera posición del elemento en el arreglo es ', pos:1)
else
    write ('El elemento no se encuentra en el arreglo')

end.
