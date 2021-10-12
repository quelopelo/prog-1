program pr10ej17;

const
    cant_letras = 20;
    cant_idiomas = 3;
    cant_articulos = 5;

type
    TIdioma = (ay, eo, es);

    TFecha = record
                 dia : 1..31;
                 mes : 1..12;
                 anio : 2001..9999 {La Wikipedia comienza en 2001}
             end;

    TNombre = array [1..cant_letras] of char;

    TArticulo = record
                    nombre : TNombre;
                    idioma : TIdioma;
                    visitas : integer;
                    ultima_act : TFecha;
                end;

    Wikipedia = array [1..cant_articulos] of TArticulo;

var wiki : Wikipedia;
    i : integer;

procedure IngresarArticulo (var art : TArticulo);
var i : integer;
    num : 1..cant_idiomas;
    car : char;
begin
    with art do
    begin
        (*Nombre*)
        write ('Nombre: ');
        i := 1;
        while (i <= cant_letras) and not eoln do
        begin
            read (nombre[i]);
            i := i + 1
        end;
        readln;
        for i := (i+1) to cant_letras do
            nombre[i] := ' ';
        (*Idioma*)
        write ('Idioma (1 - aymara | 2 - esperanto | 3 - español): ');
        readln (num);
        idioma := TIdioma (num-1);
        (*Cantidad de visitas*)
        write ('Cantidad de visitas: ');
        readln (visitas);
        (*Última actualización*)
        write ('Última actualización (dd-mm-aaaa): ');
        with ultima_act do
            readln (dia, car, mes, car, anio)
    end
end;

procedure ImprimirArticulo (art : TArticulo);
var i : integer;
begin
    with art do
    begin
        (*Nombre*)
        write ('Nombre: ');
        for i := 1 to cant_letras do
            write (nombre[i]);
        writeln;
        (*Idioma*)
        write ('Idioma: ');
        case idioma of
            ay : writeln ('aymara');
            eo : writeln ('esperanto');
            es : writeln ('español')
        end;
        (*Cantidad de visitas*)
        writeln ('Cantidad de visitas: ', visitas:1);
        (*Última actualización*)
        write ('Última actualización: ');
        with ultima_act do
        begin
            if  dia < 10 then
                write ('0');
            write (dia:1, '-');
            if  mes < 10 then
                write('0');
            writeln (mes:1, '-', anio:4);
        end
    end
end;

function EsPosterior (f1, f2: TFecha) : boolean;
  {Devuelve TRUE si la fecha f1 es posterior que la fecha f2}
  {Devuelve FALSE en caso contrario}
begin
    EsPosterior := (f1.anio > f2.anio) or (f1.anio = f2.anio) and
        ((f1.mes > f2.mes) or (f1.mes = f2.mes) and (f1.dia > f2.dia))
end;

procedure ArticuloMasReciente (wiki: Wikipedia; idioma: TIdioma; VAR art: TArticulo);
  {Devuelve el artículo que tiene la fecha más reciente en el idioma especificado}
var i, pos : integer;
begin
    (*Se busca el primer artículo en el idioma especificado*)
    pos := 1;
    while wiki[pos].idioma <> idioma do {Existe al menos un artículo}
        pos := pos + 1;
    (*Se busca si hay algún artículo más reciente*)
    for i := (pos+1) to cant_articulos do
        if  (wiki[i].idioma = idioma) and
            EsPosterior(wiki[i].ultima_act, wiki[pos].ultima_act) then
            pos := i;
    art := wiki[pos]
end;

procedure ImprimirArticulosMasRecientes (wiki: Wikipedia);
  {Imprime en la salida estándar el nombre del artículo más reciente en cada idioma,
   junto con su cantidad de visitas y la fecha de su última actualización}
var idioma : TIdioma;
    art : TArticulo;
begin
    for idioma := ay to es do
    begin
        ArticuloMasReciente (wiki, idioma, art);
        ImprimirArticulo (art);
        writeln
    end
end;

(*Programa principal*)
begin

(*Entrada de datos*)
writeln;
writeln ('Ingrese los artículos de la Wikipedia');
writeln;
for i := 1 to cant_articulos do
begin
    writeln ('Artículo ', i:1, ' de ', cant_articulos:1);
    IngresarArticulo (wiki[i]);
    writeln
end;

(*Salida de datos*)
writeln ('Artículos más recientes en cada idioma');
writeln;
ImprimirArticulosMasRecientes (wiki);

end.
