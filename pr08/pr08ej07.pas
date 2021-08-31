PROGRAM pr08ej07 (input,output);
VAR z: integer;

FUNCTION f (y : integer) : boolean;
BEGIN
    z := z + y;
    f := y mod 2 = 0
END;

PROCEDURE a (VAR y : integer);
BEGIN
    y := 2 * y
END;

PROCEDURE b (VAR z : integer);
BEGIN
    z := z + 5
END;

BEGIN
    readLn (z);
    IF f(z) THEN a(z) ELSE b(z);
    writeLn ('Salida = ', z)
END.
