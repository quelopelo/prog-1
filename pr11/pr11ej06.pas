program pr11ej06;

const
    Y = 10;
    X = 10;
    tam = 3;

type
    Terr = (diverr, reserr, argerr);
    Nerr = record
               case natural : boolean of
                   false : (err : Terr);
                   true  : (val : 0..maxint)
           end;
    MTerr = (merr);
    MNerr = record
                case matriz : boolean of
                    false : (err : MTerr);
                    true  : (m : 1..Y;
                             n : 1..X;
                             val : array [1..Y, 1..X] of Nerr)
            end;

var m1, m2, mres : MNerr;

procedure Nleer (var n : Nerr);
begin
    n.natural := true;
    read (n.val)
end;

procedure Nescribir (n : Nerr; tam : integer);
begin
    if n.natural then
        write (n.val:tam)
    else
        case n.err of
            diverr :  write ('diverr');
            reserr :  write ('reserr');
            argerr :  write ('argerr')
        end
end;

procedure Ncero (var n : Nerr);
begin
    n.natural := true;
    n.val := 0;
end;

procedure Nsuma (a, b: Nerr; var res: Nerr);
begin
    if a.natural and b.natural then
        begin
        res.natural := true;
        res.val := a.val + b.val
        end
    else
        begin
        res.natural := false;
        res.err := argerr
        end
end;

procedure Nproducto (a, b: Nerr; var res: Nerr);
begin
    if a.natural and b.natural then
        begin
        res.natural := true;
        res.val := a.val * b.val
        end
    else
        begin
        res.natural := false;
        res.err := argerr
        end
end;

procedure MNleer (var mat : MNerr);
var i : 1..Y;
    j : 1..X;
begin
    with mat do
    begin
        matriz := true;
        write ('Ingrese m (m x n): ');
        readln (m);
        write ('Ingrese n (m x n): ');
        readln (n);
        writeln ('Ingrese la matriz');
        for i := 1 to m do
        begin
            for j := 1 to n do
                Nleer (val[i,j]);
            readln
        end
    end
end;

procedure MNescribir (var mat : MNerr);
var i : 1..Y;
    j : 1..X;
begin
    with mat do
    begin
        for i := 1 to m do
        begin
            for j := 1 to n do
            begin
                Nescribir (val[i,j], tam);
                write (' ')
            end;
            writeln
        end
    end
end;

procedure MNproducto (m1, m2: MNerr; var res: MNerr);
var i : 1..Y;
    j : 1..X;
    k : integer;
    temp : Nerr;
begin
if m1.n = m2.m then
    begin
    res.matriz := true;
    res.m := m1.m;
    res.n := m2.n;
    for i := 1 to res.m do
        for j := 1 to res.n do
        begin
            Ncero (res.val[i,j]);
            for k := 1 to m1.n do
            begin
                Nproducto (m1.val[i,k], m2.val[k,j], temp);
                Nsuma (temp, res.val[i,j], res.val[i,j])
            end
        end
    end
else
    begin
    res.matriz := false;
    res.err := merr;
    end
end;

(*Programa principal*)
begin

(*Entrada de datos*)
writeln;
writeln ('Datos de la primera matriz');
MNleer (m1);
writeln;
writeln ('Datos de la segunda matriz');
MNleer (m2);

(*Procesamiento*)
MNproducto (m1, m2, mres);

(*Salida de datos*)
writeln;
writeln ('Producto de las matrices');
MNescribir (mres);
writeln

end.
