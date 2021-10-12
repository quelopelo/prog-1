program pr10ej16;

type  complejo = record
                     re, im : real;
                 end;

var   c1, c2, suma, producto : complejo;

procedure leer_complejo (var c : complejo);
begin
    read (c.re);
    read (c.im)
end;

procedure escribir_complejo (c : complejo; pres : integer);
begin
    write (c.re:1:pres, ' ');
    if    c.im >= 0 then
          write ('+ ')
    else  begin
          c.im := -c.im;
          write ('- ');
          end;
    write(c.im:1:pres, 'i')
end;

procedure suma_complejos (c1, c2 : complejo; var c3 : complejo);
begin
    c3.re := c1.re + c2.re;
    c3.im := c1.im + c2.im
end;

procedure producto_complejos (c1, c2 : complejo; var c3 : complejo);
begin
    c3.re := c1.re * c2.re - c1.im * c2.im;
    c3.im := c1.im * c2.re + c1.re * c2.im
end;

(*Programa principal*)
begin

(*Entrada de datos*)
writeln ('Ingrese dos números complejos (ejemplo: 1 2i):');
leer_complejo (c1);
readln;
leer_complejo (c2);
readln;

(*Procesamiento*)
suma_complejos (c1, c2, suma);
producto_complejos (c1, c2, producto);

(*Salida de datos*)
write ('La suma es:     ');
escribir_complejo (suma, 2);
writeln;
write ('El producto es: ');
escribir_complejo (producto, 2);
writeln

end.
