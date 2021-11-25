program pr13ej13;

const
    N = 30;

type
    letra = 'a' .. 'z';
    rango = 1 .. N;
    arreglo = record
                  datos : array [rango] of letra;
                  tope  : 0 .. N
              end;

var
    a : arreglo;

procedure IngresarArreglo (var a : arreglo);
var user : char;
begin
    a.tope := 0;
    while (a.tope < N) and not eoln do
    begin
        read (user);
        a.tope := a.tope + 1;
        a.datos[a.tope] := user
    end;
    readln
end;

procedure DesplegarArreglo (a : arreglo);
var i : rango;
begin
    if a.tope > 0 then
    begin
        for i := 1 to a.tope do
            write (a.datos[i])
    end
end;

function EsPalindroma (a : arreglo) : boolean;
var i : 0 .. N;
begin
    i := a.tope div 2;
    while (i >= 1) and (a.datos[i] = a.datos[a.tope+1-i]) do
        i := i - 1;
    EsPalindroma := i = 0
end;

(*Programa principal*)
begin

(*Entrada de datos*)
writeln ('Ingrese una palabra en minúsculas:');
IngresarArreglo (a);

(*Procesamiento y salida de datos*)
write ('La palabra "');
DesplegarArreglo (a);
if EsPalindroma (a) then
    write ('" ')
else
    write ('" no ');
writeln ('es palíndroma')

end.
