PROGRAM pr01ej15 (input, output);
CONST
	medio = 0.5;
VAR
	num  : Real;
	a, b : Integer;
BEGIN
	readLn (num); (* Obtener un valor para num de la entrada estandar *)
	a := round (num);
	b := trunc (num + medio);
	writeLn (num, a, b) (* Exhibir num, a, y b *)
END.
