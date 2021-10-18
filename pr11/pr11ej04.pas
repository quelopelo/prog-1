program pr11ej04;

type
    TipoRaices = record
                     case cant : 0..2 of
                         0 : ();
                         1 : (x : real);
                         2 : (x1, x2 : real)
                 end;

var
    a, b, c : real;
    r : TipoRaices;

procedure Raices (a, b, c : real; var r : TipoRaices);
var disc : real;
begin
	disc := b * b - 4 * a * c;
    with r do
        if disc < 0	then	    	{Ninguna raíz real}
            cant := 0
        else
            if	disc = 0 then		{Una raíz real doble}
                begin
                cant := 1;
                x := -b / (2 * a)
                end
            else				    {Dos raíces reales}
                begin
                cant := 2;
                disc := sqrt(disc);
                x1 := (-b - disc) / (2 * a);
                x2 := (-b + disc) / (2 * a)
                end
end;

(*Programa principal*)
begin

(*Entrada de datos*)
writeln ('Solucionador de ecuación cuadrática');
writeln ('ax² + bx + c = 0');
write ('Ingrese los valores de a, b y c separados por espacios: ');
readln (a, b, c);

(*Cálculo de las raíces reales*)
raices(a, b, c, r);

(*Salida de datos*)
case r.cant of
	0 :	writeln('Ninguna raíz real');
	1 :	writeln('Una raíz real doble: ', r.x:4:2);
	2 :	writeln('Dos raíces reales: ', r.x1:4:2, ' y ', r.x2:4:2)
end

end.
