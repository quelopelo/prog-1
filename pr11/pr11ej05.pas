program pr11ej05;

type
    Err = (diverr, reserr, argerr);
    Nerr = record
               case natural : boolean of
                   false : (error : Err);
                   true  : (valor : 0..maxint)
           end;

var a, b, res : Nerr;

procedure leer (var n : Nerr);
begin
    n.natural := true;
    read (n.valor)
end;

procedure escribir (n : Nerr);
begin
    if n.natural then
        write (n.valor:1)
    else
        case n.error of
            diverr :  write ('diverr');
            reserr :  write ('reserr');
            argerr :  write ('argerr')
        end
end;

procedure suma (a, b: Nerr; var res: Nerr);
begin
    if a.natural and b.natural then
        begin
        res.natural := true;
        res.valor := a.valor + b.valor
        end
    else
        begin
        res.natural := false;
        res.error := argerr
        end
end;

procedure resta (a, b: Nerr; var res: Nerr);
begin
    if a.natural and b.natural then
        begin
        if a.valor >= b.valor then
            begin
            res.natural := true;
            res.valor := a.valor - b.valor
            end
        else
            begin
            res.natural := false;
            res.error := reserr
            end
        end
    else
        begin
        res.natural := false;
        res.error := argerr
        end
end;

procedure producto (a, b: Nerr; var res: Nerr);
begin
    if a.natural and b.natural then
        begin
        res.natural := true;
        res.valor := a.valor * b.valor
        end
    else
        begin
        res.natural := false;
        res.error := argerr
        end
end;

procedure division (a, b: Nerr; var res: Nerr);
begin
    if a.natural and b.natural then
        begin
        if b.valor > 0 then
            begin
            res.natural := true;
            res.valor := a.valor div b.valor
            end
        else
            begin
            res.natural := false;
            res.error := diverr
            end
        end
    else
        begin
        res.natural := false;
        res.error := argerr
        end
end;

(*Programa principal*)
begin

(*Entrada de datos*)
write ('a     = ');
leer (a);
readln;
write ('b     = ');
leer (b);
readln;

(*Salida de datos*)
suma (a, b, res);
write ('a + b = ');
escribir (res);
writeln;
resta (a, b, res);
write ('a - b = ');
escribir (res);
writeln;
producto (a, b, res);
write ('a x b = ');
escribir (res);
writeln;
division (a, b, res);
write ('a / b = ');
escribir (res);
writeln

end.
