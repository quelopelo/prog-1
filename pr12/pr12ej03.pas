program pr12ej03;

type
    punteroInt = ^integer;
    punteroChar = ^char;

var
    apun1, apun2 : punteroInt;
    apun3, apun4 : punteroChar;

begin

(*Parte b*)
new (apun3);
new (apun1);
apun3^ := 'Z';
apun2 := nil;
apun4 := nil;
if (apun3 <> nil) AND (apun2 = nil) then
   writeln ('A');
if apun3^ = 'Z' then
    writeln ('Z')
else
    writeln ('X')

end.
