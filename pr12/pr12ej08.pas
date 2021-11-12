program pr12ej08;

type
    Positivo = 1..MaxInt;
    ListaInt = ^TCelda;
    TCelda   = record
                   info : integer;
                   sig  : ListaInt
              end;

var l1, l2 : ListaInt;
    k, num : Positivo;

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
    end;
    readln
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

function multiplos (k, num : Positivo) : ListaInt;
{Retorna una lista ordenada con los primeros k múltiplos de num > 1}
var l, aux1, aux2 : ListaInt;
    i, mult : integer;
begin
    mult := num;
    new (l);
    l^.info := mult;
    aux2 := l;
    for i := 2 to k do
    begin
        mult := mult + num;
        aux1 := aux2;
        new (aux2);
        aux1^.sig := aux2;
        aux2^.info := mult;
    end;
    aux2^.sig := nil;
    multiplos := l
end;

function copia (l : ListaInt) : ListaInt;
{Retorna una copia limpia de la lista l}
var p, aux1, aux2 : ListaInt;
begin
    if l = nil then
        p := nil
    else
    begin
        new (p);
        p^.info := l^.info;
        aux2 := p;
        while l^.sig <> nil do
        begin
            l := l^.sig;
            aux1 := aux2;
            new (aux2);
            aux1^.sig := aux2;
            aux2^.info := l^.info
        end;
        aux2^.sig := nil
    end;
    copia := p
end;

function copiaInvertida (l : ListaInt) : ListaInt;
{Retorna una copia invertida de la lista l}
var p1, p2 : ListaInt;
begin
    p2 := nil;
    while l <> nil do
    begin
        p1 := p2;
        new (p2);
        p2^.info := l^.info;
        p2^.sig := p1;
        l := l^.sig
    end;
    copiaInvertida := p2
end;

procedure invertir (var l : ListaInt);
{Invierte in situ la lista l}
var p1, p2, p3 : ListaInt;
begin
    p1 := nil;
    p2 := l;
    while p2 <> nil do
    begin
        p3 := p2^.sig;
        p2^.sig := p1;
        p1 := p2;
        p2 := p3
    end;
    l := p1
end;

procedure concatenar (var l1 : ListaInt; l2 : ListaInt);
{Concatenar dos listas l1 y l2 en l1}
var p : ListaInt;
begin
    if l1 = nil then
        l1 := l2
    else
    begin
        p := l1;
        while p^.sig <> nil do
            p := p^.sig;
        p^.sig := l2
    end
end;

procedure partir (k : Positivo; l : ListaInt; var l1, l2 : ListaInt);
{Partir una lista l en dos listas de tal manera que l1 contenga los 
primeros k elementos de l y l2 contenga los restantes}
begin
    l1 := l;
    while (l <> nil) and (k > 1) do
    begin
        l := l^.sig;
        k := k - 1
    end;
    if l = nil then
        l2 := nil
    else
    begin
        l2 := l^.sig;
        l^.sig := nil
    end
end;

function intercalarListas (l1, l2 : ListaInt) : ListaInt;  
{Dadas dos listas de números enteros l1 y l2, ordenadas de manera
ascendente, genera una nueva lista con los elementos de ambas listas
ordenados de manera ascendente}
var p, aux1, aux2 : ListaInt;
    listo : boolean;
{P} procedure siguiente (var p, l1, l2 : ListaInt; var listo : boolean);
    {Precondición: l1 o l2 tiene al menos un elemento}
    begin
        if l1 = nil then
        begin
            p^.info := l2^.info;
            l2 := l2^.sig;
            listo := l2 = nil
        end
        else
            if l2 = nil then
            begin
                p^.info := l1^.info;
                l1 := l1^.sig;
                listo := l1 = nil
            end
            else
            begin
                if l1^.info <= l2^.info then
                    begin
                        p^.info := l1^.info;
                        l1 := l1^.sig
                    end
                    else
                    begin
                        p^.info := l2^.info;
                        l2 := l2^.sig
                    end;
                listo := false
            end
    end;
begin
    {Se inicializa la lista}
    if (l1 = nil) and (l2 = nil) then
    begin
        p := nil;
        listo := true
    end
    else
    begin
        new (p);
        siguiente (p, l1, l2, listo);
        aux2 := p
    end;
    {Se itera hasta agregar todos los elementos}
    while not listo do
    begin
        aux1 := aux2;
        new (aux2);
        siguiente (aux2, l1, l2, listo);
        aux1^.sig := aux2
    end;
    aux2^.sig := nil;
    {Se devuleve la lista construida}
    IntercalarListas := p
end;

(*Programa principal*)
begin

(*Parte a*)
write ('Ingrese dos números enteros positivos: ');
readln (k, num);
if k = 1 then
    writeln ('El primer múltiplo de ', num:1, ' es:')
else
    writeln ('Los primeros ', k:1, ' múltiplos de ', num:1, ' son:');
mostrarLista (multiplos (k, num));
writeln;

(*Parte b*)
writeln;
writeln ('Ingrese una lista de enteros:');
ingresarLista (l1);
writeln ('La copia limpia de la lista ingresada es:');
mostrarLista (copia (l1));
writeln;

(*Parte c*)
writeln ('La copia invertida de la lista ingresada es:');
mostrarLista (copiaInvertida (l1));
writeln;

(*Parte d*)
invertir (l1);
writeln ('La lista invertida in situ es:');
mostrarLista (l1);
invertir (l1);
writeln;

(*Parte e*)
writeln;
writeln ('Ingrese otra lista de enteros:');
ingresarLista (l2);
concatenar (l1, l2);
writeln ('La lista con las dos listas concatenadas es:');
mostrarLista (l1);
writeln;

(*Parte f*)
writeln;
write ('Ingrese un número entero positivo: ');
readln (k);
partir (k, l1, l1, l2);
writeln ('Las dos listas partidas son:');
mostrarLista (l1);
writeln;
mostrarLista (l2);
writeln;

(*Parte g*)
writeln;
writeln ('Ingrese una lista ordenada de enteros:');
ingresarLista (l1);
writeln ('Ingrese otra lista ordenada de enteros:');
ingresarLista (l2);
writeln ('La lista intercalada ordenada es: ');
mostrarLista (intercalarListas (l1, l2));
writeln

end.
