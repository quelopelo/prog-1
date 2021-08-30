PROGRAM pr03ej06 (output);
VAR	x, y, z : Integer;
BEGIN
	x := 10;
	y := 11;
	z := 12;
	IF (x > y) OR (z > y) THEN
		IF x > z THEN
			IF y > z THEN
				writeLn ('Termine.')
			ELSE writeln ('No termino aun.')
		ELSE writeln ('Nunca llega aqui.')
END.
