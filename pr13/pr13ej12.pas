program pr13ej12;

const
    N = 100;

type
    positivo = 1 .. maxint;
    rango = 1 .. N;
    arreglo = record
                  datos : array [rango] of positivo;
                  tope  : 0 .. N
              end;

var a : arreglo;
    val : integer;

procedure IngresarArreglo (var a : arreglo);
var user : integer;
begin
    a.tope := 0;
    read (user);
    while (a.tope < N) and (user <> -1) do
    begin
        a.tope := a.tope + 1;
        a.datos[a.tope] := user;
        read (user)
    end;
    readln
end;

function BusquedaLineal (val : positivo; a : arreglo) : boolean;
var i : 1 .. N+1;
begin
    i := 1;
    while (i <= a.tope) and (a.datos[i] <> val) do
        i := i + 1;
    BusquedaLineal := i <= a.tope
end;

(*Programa principal*)
begin

(*Entrada de la secuencia*)
writeln ('Ingrese una secuencia de enteros positivos:');
IngresarArreglo (a);

(*Búsqueda y salida de datos*)
writeln ('Ingrese otra secuencia enteros positivos:');
read (val);
while val <> -1 do
begin
    if BusquedaLineal (val, a) then
        writeln ('El número ', val : 1, ' pertenece a la secuencia')
    else
        writeln ('El número ', val : 1, ' no pertenece a la secuencia');
    read (val)
end

end.
