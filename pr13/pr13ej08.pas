program pr13ej08;

const
    max = 100;

type
    positivo = 1 .. maxint;
    rango = 1 .. max;
    arreglo = record
                  datos : array [rango] of positivo;
                  tope  : 0 .. max
              end;

var a : arreglo;

procedure IngresarArreglo (var a : arreglo);
var user : integer;
begin
    a.tope := 0;
    read (user);
    while (a.tope < max) and (user <> -1) do
    begin
        a.tope := a.tope + 1;
        a.datos[a.tope] := user;
        read (user)
    end;
    readln
end;

procedure DesplegarArreglo (a : arreglo);
var i : rango;
begin
    if a.tope > 0 then
    begin
        write (a.datos[1] : 1);
        for i := 2 to a.tope do
            write (' ', a.datos[i] : 1)
    end
end;

procedure OrdenarArreglo (var a : arreglo);
var i : rango;
{P} procedure OrdenarPosicion (pos : rango; var a : arreglo);
    var elem : positivo;
    begin
        elem := a.datos[pos];
        while (pos > 1) and (elem > a.datos[pos-1]) do
        begin
            a.datos[pos] := a.datos[pos-1];
            pos := pos - 1
        end;
        a.datos[pos] := elem
    end;
begin
    for i := 2 to a.tope do
        OrdenarPosicion (i, a)
end;

(*Programa principal*)
begin

(*Entrada de datos*)
writeln ('Ingrese un arreglo de enteros positivos: ');
IngresarArreglo (a);

(*Procesamiento*)
OrdenarArreglo (a);

(*Salida de datos*)
writeln ('El arreglo ordenado en forma descendente es: ');
DesplegarArreglo (a);
writeln

end.
