PROGRAM pr04ej01;

VAR aux, n, a, b, k, bajo, alto, i, j, num : Integer;

BEGIN
   
   (*Parte a*)
   writeln('Parte a');
   aux := 2;
   FOR n := 1 TO 4 DO
   BEGIN
      aux := aux * n;
      writeln (n, aux)
   END;
   writeln;
   
   (*Parte b*)
   writeln('Parte b');
   FOR b := 1 TO 3 DO
   BEGIN
      IF b <= 1 THEN
         a := b - 1;
      IF b <= 2 THEN
         a := a - 1
      ELSE
         a := a + 1
   END;
   writeln (a);
   writeln;
   
   (*Parte c*)
   writeln('Parte c');
   bajo := 1;
   FOR k := bajo TO 3 DO
   BEGIN
      bajo := bajo + 2;
      writeln (k, bajo)
   END;
   writeln;
   
   (*Parte d*)
   writeln('Parte d');
   alto := 4;
   FOR k := alto DOWNTO 3 DO
      write (k, alto);
   writeln;
   writeln;
   
   (*Parte e*)
   writeln('Parte e');
   num := 1;
   FOR i := 1 TO 3 DO
   BEGIN
      num := num + i;
      FOR j := 1 TO num DO
         write (j);
      writeLn (i)
   END

END. 
