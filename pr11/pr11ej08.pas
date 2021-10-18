program pr11ej08;

const
    MaxDig = 100;

type
    Digito = 0..9;
    Natural = record
                  digitos : array[1..MaxDig] of Digito;
                  tope : 0..MaxDig;
              end;

var a, b, c : Natural;

procedure EntradaNatural(var n : Natural);
var i, j : 0..MaxDig;
    car : char;
    dig : Digito;
begin
    (*1. Se ingresan en órden inverso*)
    n.tope := 0;
    while (n.tope < MaxDig) and not eoln do
    begin
        n.tope := n.tope + 1;
        read(car);
        n.digitos[n.tope] := ord(car) - ord('0');
    end;
    readln;
    (*2. Se dan vuelta para lograr la representación de Natural*)
    for i := 1 to trunc (n.tope / 2) do
    begin
        j := n.tope + 1 - i;
        dig := n.digitos[i];
        n.digitos[i] := n.digitos[j];
        n.digitos[j] := dig
    end
end;

procedure SalidaNatural(var n : Natural);
{El natural se pasa por referencia para utilizar menos memoria}
var i : 1..MaxDig;
begin
    for i := n.tope downto 1 do
        write (n.digitos[i]:1)
end;

procedure SumaNaturales (a, b : Natural; Var c : Natural);
{Precondición: la suma (c) tiene como máximo MaxDig}
var i : 1..MaxDig;
    acarreo : boolean;
{P} procedure SumaDigito (d1, d2 : Digito; var dsum : Digito; var acarreo : boolean);
    var suma : integer;
    begin
        suma := d1 + d2 + ord(acarreo);
        if suma >= 10 then
            begin
            dsum := suma - 10;
            acarreo := true;
            end
        else
            begin
            dsum := suma;
            acarreo := false;
            end
    end;
begin
    (*1. Se ordenan los naturales para que a.tope >= b.tope*)
    if a.tope < b.tope then
        begin
        c := a; {Se usa c como variable auxiliar}
        a := b;
        b := c;
        end;
    (*2. Se obtienen los primeros b.tope digitos*)
    acarreo := false;
    for i := 1 to b.tope do
        SumaDigito (a.digitos[i], b.digitos[i], c.digitos[i], acarreo);
    (*3. Se obtienen los restantes dígitos hasta a.tope*)
    for i := (b.tope+1) to a.tope do
        SumaDigito (a.digitos[i], 0, c.digitos[i], acarreo);
    (*4. Se obtiene el digito en (a.tope+1), en caso que corresponda*)
    c.tope := a.tope;
    if acarreo then
        begin
        c.tope := c.tope + 1;
        c.digitos[c.tope] := 1
        end
end;

(*Programa principal*)
begin

(*Entrada de datos*)
write ('a     = ');
EntradaNatural (a);
write ('b     = ');
EntradaNatural (b);

(*Procesamiento*)
SumaNaturales (a, b, c);

(*Salida de datos*)
write ('a + b = ');
SalidaNatural (c);
writeln

end.
