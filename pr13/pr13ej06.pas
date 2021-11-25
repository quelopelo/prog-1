program pr13ej06;

const
    max = 10;  {Algún valor apropiado}
type
    rango = 1 .. max;
    arregloEnteros = array [rango] of integer;
var
    arreglo : arregloEnteros;

procedure IngresarArreglo (var a : arregloEnteros);
var i : rango;
begin
    for i := 1 to max do
        read (a[i]);
    readln;
end;

function EstaOrdenado (a : arregloEnteros) : boolean;
{Determina si el arreglo 'a' está ordenado en forma ascendente}
var i : rango;
begin
    i := 1;
    while (i < max) and (a[i+1] >= a[i]) do
        i := i + 1;
    EstaOrdenado := i = max
end;

procedure OrdenarPosicion (pos : rango; var a : arregloEnteros);
{Recibe un arreglo 'a' ordenado parcialmente entre las posiciones 1 y
pos-1 de forma ascendente y reinserta el elemento que originalmente se
encuentra en la posición 'pos' de forma ordenada entre las posiciones 1
y 'pos'}
var elem : integer;
begin
    elem := a[pos];
    while (pos > 1) and (elem < a[pos-1]) do
    begin
        a[pos] := a[pos-1];
        pos := pos - 1;
    end;
    a[pos] := elem
end;

procedure OrdenarArregloEnteros (var a : arregloEnteros);
{Ordena de forma ascendente el arreglo 'a' que recibe por parámetro}
var pos : rango;
begin
    for pos := 2 to max do
        OrdenarPosicion (pos, a)
end;

(*Programa principal*)
begin

(*Entrada de datos*)
writeln ('Ingrese un arreglo de ', max, ' enteros:');
IngresarArreglo (arreglo);

(*Procesamiento*)
OrdenarArregloEnteros (arreglo);

(*Salida de datos*)
if EstaOrdenado (arreglo) then
    writeln ('El arreglo está ordenado en forma ascendente')
else
    writeln ('El arreglo no está ordenado en forma ascendente')

end.
