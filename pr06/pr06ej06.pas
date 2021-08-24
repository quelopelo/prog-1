program pr06ej06;

const	beneficio_unitario = 30;	{integer (podría ser real)}
	costo_fijo = 100;		{integer (podría ser real)}
	incremento_publicidad = 2;	{integer (podría ser real)}
	incremento_ventas = 1.5;	{real}

var	ventas : integer;
	publicidad, beneficio, beneficio_anterior : real;

procedure calcular_beneficio(ventas : integer; publicidad : real;
			     var beneficio : real);
begin
	beneficio := beneficio_unitario * ventas - publicidad - costo_fijo;
	writeln(publicidad:7:0, '		', ventas:4, '	    ', beneficio:7:0)
end;

begin

(*Valores iniciales*)
ventas := 20;
publicidad := 200;

(*Impresión de encabezado y primera fila*)
writeln('Publicidad	Ventas	    Beneficio neto');
calcular_beneficio(ventas, publicidad, beneficio);

(*Iteración para imprimir siguientes filas*)
repeat
	beneficio_anterior := beneficio;
	ventas := round(ventas * incremento_ventas);
	publicidad := publicidad * incremento_publicidad;
	calcular_beneficio(ventas, publicidad, beneficio);
until	beneficio < beneficio_anterior

end.
