PROGRAM Ejercicio5 (output);
VAR tum, num, temp : Integer;

PROCEDURE Prog (a, b : Integer; VAR c : Integer);
VAR aux : Integer;
BEGIN 
    aux := a * b;
    aux := aux + 1;
    c := aux + a;
    writeLn (a, b, c, aux)
END;

(* Programa principal *)
BEGIN 
    tum := 1;
    num := 2;
    Prog (tum, num, temp);
    writeLn (temp);
    tum := 0;
    num := 1;
    Prog (tum, num, temp);
    writeLn (temp)
END.
