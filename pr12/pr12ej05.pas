program pr12ej05;

type
    Positivo = 1..MaxInt;
    ListaInt = ^TCelda;
    TCelda   = record
                   info : integer;
                   sig  : ListaInt
              end;
   PosibleElem = record case ok : boolean of
                     true  : (elem : integer);
                     false : ()
                 end;

var l : ListaInt;
    n, pos : integer;
    res : PosibleElem;

procedure listaVacia (var l : ListaInt);
{Inicializa una lista vacía}
begin
    l := nil;
end;

procedure agregarAlFinal (n: integer; var l : ListaInt);
{Agrega el entero n al final de la lista l}
var elem, aux : ListaInt;
begin
    new (elem);
    elem^.info := n;
    elem^.sig := nil;
    if l = nil then
        l := elem
    else
    begin
        aux := l;
        while aux^.sig <> nil do
            aux := aux^.sig;
        aux^.sig := elem
    end
end;

procedure ingresarLista (var l : ListaInt);
{Permite ingresar una lista por la entrada estandar}
var n : integer;
begin
    listaVacia (l);
    while not eoln do
    begin
        read (n);
        agregarAlFinal (n, l);
    end
end;

procedure mostrarLista (l : ListaInt);
{Muestra la lista l por la salida estandar}
begin
    while l <> nil do
    begin
        write (l^.info : 1, ' ');
        l := l^.sig
    end
end;

(*Parte a*)
function suma (l : ListaInt) : integer;
{Retorna la suma de todos los elementos de la lista}
var sum : integer;
begin
    sum := 0;
    while l <> nil do
    begin
        sum := sum + l^.info;
        l := l^.sig
    end;
    suma := sum
end;

(*Parte b*)
function minimo (l : ListaInt) : integer;
{Retorna el mínimo de todos los elementos de la lista}
{Precondición: la lista no es vacía}
var min : integer;
begin
    min := l^.info;
    l := l^.sig;
    while l <> nil do
    begin
        if l^.info < min then
            min := l^.info;
        l := l^.sig
    end;
    minimo := min
end;

(*Parte c*)
function producto (l : ListaInt) : integer;
{Retorna el producto de todos los elementos de la lista}
var prod : integer;
begin
    prod := 1;
    while (l <> nil) and (prod <> 0) do
    begin
        prod := prod * l^.info;
        l := l^.sig
    end;
    producto := prod
end;

(*Parte d*)
function cuantosPares (l : ListaInt) : integer;
{Retorna la cantidad de números pares que hay en la lista}
var cant : integer;
begin
    cant := 0;
    while l <> nil do
    begin
        if l^.info mod 2 = 0 then
            cant := cant + 1;
        l := l^.sig
    end;
    cuantosPares := cant
end;

(*Parte e*)
function posicion (valor : integer; l : ListaInt) : integer;
{Retorna la primera posición en la cual aparece valor dentro de la lista l}
{Las posiciones se cuentan desde 1 en adelante}
{Si valor no aparece en la lista, la función retorna -1}
var pos : integer;
begin
    pos := 1;
    while (l <> nil) and (l^.info <> valor) do
    begin
        pos := pos + 1;
        l := l^.sig
    end;
    if l = nil then
        posicion := -1
    else
        posicion := pos
end;

(*Parte f*)
procedure elemEnPos (pos : Positivo; l : ListaInt;
                     var resultado : PosibleElem);
{Retorna un registro con variante de tipo PosibleElem
del elemento de la lista que está en la posición pos}
begin
    while (l <> nil) and (pos > 1) do
    begin
        pos := pos - 1;
        l := l^.sig
    end;
    if l = nil then
        resultado.ok := false
    else
    begin
        resultado.ok := true;
        resultado.elem := l^.info
    end
end;

(*Parte g*)
function ultimo (l : ListaInt) : integer;
{Retorna el último elemento de la lista}
{Precondición: la lista no es vacía}
begin
    while l^.sig <> nil do
        l := l^.sig;
    ultimo := l^.info
end;

(*Parte h*)
function ordenada (l : ListaInt) : boolean;
{Determina si lista está ordenada de menor a mayor}
var ord : boolean;
begin
    if l = nil then
        ord := true
    else
    begin
        while (l^.sig <> nil) and (l^.sig^.info >= l^.info) do
            l := l^.sig;
        if l^.sig = nil then
            ord := true
        else
            ord := false
    end;
    ordenada := ord
end;

(*Programa principal*)
begin

(*Entrada de datos*)
writeln ('Ingrese una lista de enteros:');
ingresarLista (l);
write ('Ingrese un número entero: ');
readln (n);
write ('Ingrese una posición: ');
readln (pos);

(*Salida de datos*)
writeln;
writeln ('La lista ingresada es:');
mostrarLista (l);
writeln;
writeln ('La suma de los enteros es: ', suma (l) : 1);
if l <> nil then
    writeln ('El mínimo entero es: ', minimo (l) : 1);
writeln ('El producto de los enteros es: ', producto (l) : 1);
writeln ('La cantidad de pares es: ', cuantosPares (l) : 1);
writeln ('La posición del entero ingresado es: ', posicion (n, l) : 1);
elemEnPos (pos, l, res);
if res.ok then
    writeln ('El elemento en la posición ingresada es: ', res.elem : 1)
else
    writeln ('No existe el elemento buscado');
if l <> nil then
    writeln ('El último entero es: ', ultimo (l) : 1);
if ordenada (l) then
    writeln ('La lista está ordenada de menor a mayor')
else
    writeln ('La lista no está ordenada de menor a mayor')

end.
