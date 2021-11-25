program pr12ej06;

type
    Positivo = 1..MaxInt;
    ListaInt = ^TCelda;
    TCelda   = record
                   info : integer;
                   sig  : ListaInt
              end;

var l : ListaInt;
    n1, n2, n3, n4, n5, pos1, pos2, val: integer;

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

(*Parte b*)
procedure insertarPenultimo (elem : integer; var l : ListaInt);
{Inserta un elemento antes del último}
{Si no hubiera último, la lista no cambia}
var p, aux1, aux2 : ListaInt;
begin
    if l <> nil then
    begin
        new (p);
        p^.info := elem;
        if l^.sig = nil then
        begin
            p^.sig := l;
            l := p
        end
        else
        begin
            aux2 := l;
            repeat
                aux1 := aux2;
                aux2 := aux2^.sig
            until aux2^.sig = nil;
            aux1^.sig := p;
            p^.sig := aux2
        end
    end
end;

(*Parte c*)
procedure insertarLuegoPos (nuevo : integer; pos : Positivo;
                            var l : ListaInt);
{Insertar el elemento nuevo luego del elemento que está en la posición pos}
{Si no existiera un elemento en tal posición, la lista no cambia}
var p, aux : ListaInt;
begin
    aux := l;
    while (aux <> nil) and (pos > 1) do
    begin
        aux := aux^.sig;
        pos := pos - 1;
    end;
    if aux <> nil then
    begin
        new (p);
        p^.info := nuevo;
        p^.sig := aux^.sig;
        aux^.sig := p
    end
end;

(*Parte d*)
procedure insertarLuego (nuevo, valor : integer; var l : ListaInt);
{Insertar un elemento nuevo luego de la primera aparición del elemento valor}
{Si no existiera tal elemento, la lista no cambia}
var p, aux : ListaInt;
begin
    aux := l;
    while (aux <> nil) and (aux^.info <> valor) do
        aux := aux^.sig;
    if aux <> nil then
    begin
        new (p);
        p^.info := nuevo;
        p^.sig := aux^.sig;
        aux^.sig := p
    end
end;

(*Parte e*)
procedure insertarAntes (nuevo, valor : integer; var l : ListaInt);
{Insertar un elemento nuevo antes de la primera aparición del elemento valor}
{Si no existiera tal elemento, la lista no cambia}
var p, aux1, aux2 : ListaInt;
begin
    aux1 := nil;
    aux2 := l;
    while (aux2 <> nil) and (aux2^.info <> valor) do
    begin
        aux1 := aux2;
        aux2 := aux2^.sig
    end;
    if aux2 <> nil then
    begin
        new (p);
        p^.info := nuevo;
        p^.sig := aux2;
        if aux1 <> nil then
            aux1^.sig := p
        else
            l := p
    end
end;

(*Parte f*)
procedure insertarOrdenado (nuevo : integer; var l : ListaInt);
{Insertar un elemento en una lista ordenada}
{El orden debe mantenerse luego de la inserción}
var p, aux1, aux2 : ListaInt;
begin
    new (p);
    p^.info := nuevo;
    if (l = nil) or (nuevo <= l^.info) then
    begin
        p^.sig := l;
        l := p
    end
    else
    begin
        aux2 := l;
        repeat
            aux1 := aux2;
            aux2 := aux2^.sig
        until (aux2 = nil) or (nuevo <= aux2^.info);
        p^.sig := aux2;
        aux1^.sig := p
    end
end;

(*Parte g*)
procedure borrarPos (pos : Positivo; var l : ListaInt);
{Borrar el elemento de la lista que está en la posición pos}
{Si no existiera un elemento en tal posición, la lista no cambia}
var aux1, aux2 : ListaInt;
begin
    if l <> nil then
        if pos = 1 then
        begin
            aux1 := l;
            l := l^.sig;
            dispose (aux1)
        end
        else
        begin
            aux2 := l;
            repeat
                aux1 := aux2;
                aux2 := aux2^.sig;
                pos := pos - 1
            until  (aux2 = nil) or (pos = 1);
            if aux2 <> nil then
            begin
                aux1^.sig := aux2^.sig;
                dispose (aux2)
            end
        end
end;

(*Parte h*)
procedure borrarPares (var l : ListaInt);
{Borrar todos los números pares}
var aux1, aux2 : ListaInt;
{P} procedure borrarElementoSeleccionado (var aux1, aux2, l : ListaInt);
    begin
        if aux1 = nil then      {Primer elemento}
        begin
            l := l^.sig;
            dispose (aux2);
            aux2 := l
        end
        else                    {Otro elemento}
        begin
            aux1^.sig := aux2^.sig;
            dispose (aux2);
            aux2 := aux1^.sig
        end
    end;
begin
    aux1 := nil;
    aux2 := l;
    while aux2 <> nil do
    begin
        if aux2^.info mod 2 = 0 then
            borrarElementoSeleccionado (aux1, aux2, l)
        else
        begin
            aux1 := aux2;
            aux2 := aux2^.sig
        end
    end
end;

(*Parte i*)
procedure borrarPrimeraAparicion (valor : integer; var l : ListaInt);
{Borrar la primera aparición de valor en la lista}
{Si no existiera tal elemento, la lista no cambia}
var aux1, aux2 : ListaInt;
begin
    aux1 := nil;
    aux2 := l;
    while (aux2 <> nil) and (aux2^.info <> valor) do
    begin
        aux1 := aux2;
        aux2 := aux2^.sig
    end;
    if aux2 <> nil then
    begin
        if aux1 = nil then      {Primer elemento}
            l := l^.sig
        else                    {Otro elemento}
            aux1^.sig := aux2^.sig;
        dispose (aux2)
    end
end;

(*Programa principal*)
begin

(*Entrada de datos*)
writeln ('Ingrese una lista de enteros:');
ingresarLista (l);
write ('Ingrese cinco números enteros: ');
readln (n1, n2, n3, n4, n5);
write ('Ingrese dos posiciones: ');
readln (pos1, pos2);
write ('Ingrese un valor: ');
readln (val);

(*Procesamiento -insertar-*)
insertarPenultimo (n1, l);
insertarLuegoPos (n2, pos1, l);
insertarLuego (n3, val, l);
insertarAntes (n4, val, l);
insertarOrdenado (n5, l);

(*Salida de datos -insertar-*)
writeln;
writeln ('La lista modificada -insertar- es:');
mostrarLista (l);
writeln;

(*Procesamiento -borrar-*)
BorrarPos (pos2, l);
BorrarPares (l);
borrarPrimeraAparicion (val, l);

(*Salida de datos -borrar-*)
writeln;
writeln ('La lista modificada -borrar- es:');
mostrarLista (l);
writeln

end.
