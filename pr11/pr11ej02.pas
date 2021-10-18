program pr11ej02;

const
    maxpersonas = 100;
    maxcad      = 30;
    si          = ['s', 'S'];
    no          = ['n', 'N'];

type
    Cadena = record
                 letras : array [1..maxcad] of char;
                 largo : 0..maxcad;
             end;
    Fecha = record
                dia : 1..31;
                mes : 1..12;
                anio : 0..maxint; 
            end;
    UnaPersona = record
                     nombre : Cadena;
                     FechNac : Fecha;
                     IndMadre, IndPadre : 0..maxpersonas;
                 end;
    Familia = record
                  pers : array[1..maxpersonas] of UnaPersona;
                  tope : 0..maxpersonas;
              end;

var
    car : char;
    nombre : cadena;
    historia : Familia;

procedure ingresarCadena (var cad : Cadena);
  {Permite ingresar una cadena por la salida estándar}
var i : 0..(maxcad+1);
begin
    with cad do
    begin
        i := 0;
        while (i <= maxcad) and not eoln do
        begin
            i := i + 1;
            read (letras[i])
        end;
        if i > maxcad then
            largo := maxcad
        else
            largo := i;
        readln
    end
end;

procedure ingresarFecha (var fec: Fecha);
  {Permite ingresar una fecha por la salida estándar}
var car : char;
begin
    with fec do
        readln (dia, car, mes, car, anio)
end;

procedure ingresarPersona (var persona : UnaPersona);
  {Permite ingresar una fecha por la salida estándar}
begin
    with persona do
    begin
        write ('Nombre y apellido: ');
        ingresarCadena (nombre);
        write ('Fecha de nacimiento: ');
        ingresarFecha (FechNac);
        write ('Índice de la madre: ');
        readln(IndMadre);
        write ('Índice del padre: ');
        readln(IndPadre)
    end
end;

procedure desplegarCadena (cad: Cadena);
  {Despliega una cadena en la salida estándar}
var i : 1..maxcad;
begin
    for i := 1 to cad.largo do
        write (cad.letras[i])
end;

procedure desplegarFecha (fec: Fecha);
  {Despliega una fecha en la salida estándar}
begin
    with fec do
    begin
        if dia < 10 then
            write ('0');
        write (dia:1, '-');
        if mes < 10 then
            write('0');
        write (mes:1, '-', anio:4)
    end
end;

procedure desplegarPersona (persona : UnaPersona);
  {Despliega una persona en la salida estándar}
begin
    desplegarCadena (persona.nombre);
    writeln;
    desplegarFecha (persona.FechNac);
    writeln
end;

function cadenasIguales (cad1, cad2 : Cadena): boolean;
  {Dadas dos cadenas, determina si son iguales}
var i : 1..maxcad;
begin
    if cad1.largo = cad2.largo then
        begin
        i := 1;
        while (i <= cad1.largo) and (cad1.letras[i] = cad1.letras[i]) do
            i := i + 1;
        cadenasIguales := i > cad1.largo
    else
        cadenasIguales := false
end;

procedure antepasados (usted : Cadena; historia : Familia);
  {Dado el nombre de una persona en el parámetro usted y una familia en el 
   parámetro historia, despliega en la salida estándar los nombres y fechas
   de nacimiento del padre y de la madre de la persona de nombre usted,
   si es que se se dispone de la información correspondiente}
var i : 0..maxpersonas;
begin
    with historia do
    begin
        (*Búsqueda de la persona*)
        i := 1;
        while (i <= tope) and not cadenasIguales (usted, pers[i].nombre) do
            i := i + 1;
        (*Salida de datos*)
        if i <= tope then
            begin
            if pers[i].IndMadre > 0 then
                begin
                writeln ('Madre:');
                desplegarPersona (pers[pers[i].IndMadre]);
                writeln
                end;
            if pers[i].IndPadre > 0 then
                begin
                writeln ('Padre:');
                desplegarPersona (pers[pers[i].IndPadre]);
                writeln
                end
            end
    end
end;

(*Programa principal*)
begin

(*Entrada de datos*)
writeln;
writeln ('INGRESO DE DATOS');
writeln;
historia.tope := 1;
writeln ('Datos de la persona ', 1:1);
ingresarPersona (historia.pers[1]);
writeln;
write ('¿Desea ingresar otra persona? [s/n]: ');
readln (car);
while not (car in (si + no)) do
begin
    write ('Comando incorrecto. ¿Desea ingresar otra persona? [s/n]: ');
    readln (car)
end;
while car in si do
begin
    writeln;
    historia.tope := historia.tope + 1;
    writeln ('Datos de la persona ', historia.tope:1);
    ingresarPersona (historia.pers[historia.tope]);
    writeln;
    write ('¿Desea ingresar otra persona? [s/n]: ');
    readln (car);
    while not (car in (si + no)) do
    begin
        write ('Comando incorrecto. ¿Desea ingresar otra persona? [s/n]: ');
        readln (car)
    end
end;

(*Salida de datos*)
writeln;
writeln ('ANTEPASADOS');
writeln;
repeat
    write ('Ingrese el nombre de una persona: ');
    ingresarCadena (nombre);
    writeln;
    antepasados (nombre, historia);
    write ('¿Desea ingresar otra persona? [s/n]: ');
    readln (car);
    while not (car in (si + no)) do
    begin
        write ('Comando incorrecto. ¿Desea ingresar otra persona? [s/n]: ');
        readln (car)
    end;
    writeln
until car in no

end.
