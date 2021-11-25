program pr13ej11;

const
    maxN = 9;  {Algún valor apropiado}
type
    rango = 1 .. maxN;
    arregloNumeros = array [rango] of integer;
var
    a : arregloNumeros;

procedure IngresarArreglo (var a : arregloNumeros);
var i : 0 .. maxN;
    user : integer;
begin
    i := 0;
    while i < maxN do
    begin
        read (user);
        i := i + 1;
        a[i] := user
    end;
    readln
end;

procedure DesplegarArreglo (a : arregloNumeros);
var i : rango;
begin
    write (a[1] : 1);
    for i := 2 to maxN do
        write (' ', a[i] : 1)
end;

procedure OrdenarParesImpares (var a : arregloNumeros);
{Recibe un arreglo de enteros 'a' desordenado y ordena de forma ascendente
los elementos que ocupan las posiciones pares en el arreglo y de forma
descendente los elementos que ocupan las posiciones impares del arreglo}
var i, i1, i2, imin, imax : rango;
    temp : integer;
{P} procedure MaximoMinimo (var imin, imax : rango; pos : rango; a : arregloNumeros);
    var i1, i2 : rango;
    begin
        i1 := 1;
        i2 := 2;
        imin := i1;
        imax := i2;
        pos := pos - 1;
        while i2 < pos do
        begin
            i1 := i2 + 1;
            i2 := i1 + 1;
            if a[i1] < a[imin] then
                imin := i1;
            if a[i2] > a[imax] then
                imax := i2;
        end
    end;
begin
    for i := (maxN div 2) downto 2 do
    begin
        i2 := 2*i;
        i1 := i2 - 1;
        MaximoMinimo (imin, imax, i2, a);
        temp := a[imin];
        a[imin] := a[i1];
        a[i1] := temp;
        temp := a[imax];
        a[imax] := a[i2];
        a[i2] := temp
    end;
    if maxN mod 2 = 1 then
    begin
        i := maxN;
        temp := a[i];
        while (i > 1) and (temp > a[i-2]) do
        begin
            a[i] := a[i-2];
            i := i - 2;
        end;
        a[i] := temp
    end
end;

(*Programa principal*)
begin

(*Entrada de datos*)
writeln ('Ingrese un arreglo de enteros: ');
IngresarArreglo (a);

(*Procesamiento*)
OrdenarParesImpares (a);

(*Salida de datos*)
writeln ('El arreglo ordenado es: ');
DesplegarArreglo (a);
writeln

end.
