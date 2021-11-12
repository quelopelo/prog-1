program pr12ej02;

type
    punteroInt = ^integer;
    punteroChar = ^char;

var
    apun1, apun2 : punteroInt;
    apun3, apun4 : punteroChar;

begin

(*Parte a*)
new (apun1);
new (apun2);
new (apun3);
apun2 := apun1;
apun1^ := 2;
apun2^ := 3;
apun3^ := 'A';
writeln (apun1^, apun2^, apun3^);

(*Parte b*)
new (apun1);
read (apun1^);
writeln (apun1^);
dispose (apun1);
writeln (apun1^)
{apun1 no está inicializado; apunta a una dirección indefinida}
{Por tanto, apun1^ también es indefinido}

end.
