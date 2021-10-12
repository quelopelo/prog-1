program pr10ej18;

const
    cant_salones = 5;
    max_pizarrones = 3;

type
    TSalon = record
                 asientos : integer;
                 pizarrones : 1..max_pizarrones;
                 hayProyector : boolean;
             end;

    TFacultad = array [1..cant_salones] of TSalon;

var
    facu : TFacultad;
    indSalon1, indSalon2, maxAsientos : integer;

procedure ingresarSalon (var salon: TSalon);
  {Permite ingresar la información de un salón}
const
    si = ['s', 'S'];
    no = ['n', 'N'];
var c : char;
begin
    (*Cantidad de asientos*)
    write ('Cantidad de asientos: ');
    readln (salon.asientos);
    (*Cantidad de pizarrones*)
    write ('Cantidad de pizarrones: ');
    readln (salon.pizarrones);
    (*¿Tiene proyector?*)
    write ('¿Tiene proyector? [s/n]: ');
    readln (c);
    while not (c in (si + no)) do
    begin
        write ('Comando incorrecto. ¿Tiene proyector? [s/n]: ');
        readln (c)
    end;
    if  c in si then
        salon.hayProyector := true
    else
        salon.hayProyector := false
end;

procedure ingresarSalones (var facu : TFacultad);
  {Permite ingresar la información de todos los salones de la facultad}
var i : 1..cant_salones;
begin
    writeln;
    writeln ('INGRESO DE SALONES');
    writeln;
    for i := 1 to cant_salones do
    begin
        writeln('Salón ', i:1);
        ingresarSalon (facu[i]);
        writeln
    end
end;

procedure informeSalon (salon: TSalon);
  {Imprime un informe de un salón, con la siguiente información:
   cantidad de asientos, pizarrones, y si tiene proyector}
begin
    (*Cantidad de asientos*)
    writeln ('Cantidad de asientos: ', salon.asientos:1);
    (*Cantidad de pizarrones*)
    writeln ('Cantidad de pizarrones: ', salon.pizarrones:1);
    (*¿Tiene proyector?*)
    write ('¿Tiene proyector?: ');
    if  salon.hayProyector then
        writeln ('sí')
    else
        writeln ('no')
end;

procedure informeSalones (facu: TFacultad);
  {Imprime un informe de todos los salones de la facultad, incluyendo, 
   por cada uno, la información del procedimiento informeSalon}
var i : 1..cant_salones;
begin
    writeln;
    writeln ('INFORME DE SALONES');
    writeln;
    for i := 1 to cant_salones do
    begin
        writeln ('Salón: ', i:1);
        informeSalon (facu[i]);
        writeln
    end
end;

procedure salonMasAsientos (facu: TFacultad;
                            var indSalon: integer; var maxAsientos: integer);
  {Devuelve el índice de la celda del salón con más asientos de la facultad,
   junto con la cantidad de asientos correspondiente. De haber dos o más
   salones con la mayor cantidad de asientos, devuelve el primero de ellos}
var i : 1..cant_salones;
begin
    indSalon := 1;
    for i := 2 to cant_salones do
        if  facu[i].asientos > facu[indSalon].asientos then
            indSalon := i;
    maxAsientos := facu[indSalon].asientos
end;

function primerSalonSinAsientos (facu: TFacultad) : integer;
  {Devuelve el índice de la celda del primer salón de la facultad que no
   tiene ningún asiento. De no haber salón sin asientos, devuelve cero}
var i : 1..(cant_salones+1);
begin
    i := 1;
    while (i <= cant_salones) and (facu[i].asientos <> 0) do
        i := i + 1;
    if  i > cant_salones then
        primerSalonSinAsientos := 0
    else
        primerSalonSinAsientos := i
end;


(*Programa principal*)
begin

(*Entrada de datos*)
ingresarSalones (facu);

(*Procesamiento*)
salonMasAsientos (facu, indSalon1, maxAsientos);
indSalon2 := primerSalonSinAsientos (facu);

(*Salida de datos*)
informeSalones (facu);
writeln;
writeln ('RESULTADOS DEL ANÁLISIS');
writeln;
write ('El salón con más asientos es el ', indSalon1:1);
writeln (' y tiene ', maxAsientos:1, ' asientos');
if  indSalon2 = 0 then
    writeln ('No hay salones sin asientos')
else
    writeln ('El primer salón sin asientos es el ', indSalon2:1);
writeln

end.
