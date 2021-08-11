PROGRAM pr02ej14 (input, output); 
VAR a, b, c, d : char; 
    r1, r2, resu : real;
BEGIN 
   read (a, b, c, d);
   r1 := ord(a) - ord('0');
   r2 := (ord(c) - ord('0')) * 10 + (ord(d) - ord('0'));
   resu := r1 + r2 / 100;
   write ('Valor ingresado: ', resu:4:2) 
END. 
