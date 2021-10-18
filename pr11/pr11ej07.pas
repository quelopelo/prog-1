program pr11ej07;

const
    maxpiratas = 1000;    {Limite de piratas que pueden vivir en la isla}
    maxasaltos = 50;      {Limite de asaltos a los que estadisticamente puede sobrevivir un pirata}
    maxdigitosCI = 8;     {Cantidad de digitos para almacenar un numero de cédula}
    maxcadena = 30;       {Cantidad de letras del nombre}

type
    TipoCadena = record
                     letras : array [1..maxcadena] of char;
                     tope : 0 .. maxcadena
                 end;

    TipoCI = array [1..maxdigitosCI] of '0'..'9';

    TipoFecha = record
                    dia : 1..31;     
                    mes : 1..12;     
                    anio : 0..maxint;
                end;

    TipoAsalto = record
                     nombre_barco : TipoCadena;    {Nombre del barco asaltado}
                     fecha : TipoFecha;            {Fecha del atraco}
                     botin : integer;              {Suma de dinero obtenida para la banda}
                 end;
    
    ConjuntoAsaltos = record      {Contiene información sobre los asaltos}
                          asaltos : array [1..maxasaltos] of TipoAsalto;
                          tope : 0..maxasaltos
                      end;

    TipoCausaMuerte = (asesinato, enfermedad, accidente);

    TipoPirata = record
                     nombre : TipoCadena;          {Nombre del pirata}
                     CI : TipoCI;                  {Cédula de identidad}
                     CASE estaVivo : boolean of    {Indica el estado vital actual del pirata}
                       (*true: Contiene información sobre los asaltos realizados por el pirata*)
                         true: (asaltos : ConjuntoAsaltos);
                       (*false: Contiene datos relativos a la muerte del pirata*)
                         false: (causaMuerte : TipoCausaMuerte;    
                                 fechaMuerte : TipoFecha)
                 end;

    Banda = record
                pirata : array [1..maxpiratas] of TipoPirata;    {Contiene información de los piratas}
                tope : 0..maxpiratas                             {Indica cantidad de piratas}
            end;
    
    ConjuntoCIs = record
                     cedulas: array [1..maxpiratas] of TipoCI;    {Arreglo de cedulas}
                     tope: 0..maxpiratas                          {Cantidad de cedulas en el array}
                  end;

function CIiguales (ci1, ci2 : TipoCI) : boolean;
  {Retorna true si "ci1" y "ci2" son iguales, y false si no}
var i : 1..(maxdigitosCI+1);
begin
    i := 1;
    while (i <= maxdigitosCI) and (ci1[i] = ci2[i]) do
        i := i + 1;
    CIiguales := i <= maxdigitosCI
end;

function contar_dinero (ca : ConjuntoAsaltos; anio : integer) : integer;
 {Retorna la suma del dinero obtenido en los asaltos de "ca" realizados durante el año "anio"}
var i : 1..maxasaltos;
    suma : integer;
begin
    suma := 0;
    with ca do
        for i := 1 to tope do
            if asaltos[i].fecha.anio = anio then
                suma := suma + asaltos[i].botin;
    contar_dinero := suma
end;

function dinero_obtenido_por_pirata (pirata : TipoCI; anio : integer; b : Banda) : integer;
  {Recibe la CI de un pirata, un año y una banda, y retorna la suma de dinero obtenida por
   el pirata para la banda en ese año. En caso de que el pirata se encuentre muerto o no
   se encuentre en la banda, retorna 0}
var iPirata : 1..(maxpiratas+1);
    dinero : integer;
begin
    (*Búsqueda del pirata*)
    iPirata := 1;
    while (iPirata <= b.tope) and not CIiguales(b.pirata[iPirata].CI, pirata) do
        iPirata := iPirata + 1;
    (*Cálculo del dinero obtenido por el pirata*)
    if iPirata > b.tope then
        dinero := 0
    else
        with b.pirata[iPirata] do
        begin
            if estaVivo then
                dinero := contar_dinero (asaltos, anio)
            else
                dinero := 0
        end;
    dinero_obtenido_por_pirata := dinero
end;

procedure hallar_ganadores (piratas : Banda; anio : integer;
                            var piratas_merecedores : ConjuntoCIs);
  {Dada una banda de piratas y un año, devuelve las cédulas de los piratas vivos 
   merecedores del premio "Calavera de Oro"}
var iPirata : 1..(maxpiratas+1);
    iBotin, maxBotin : integer;
begin
    piratas_merecedores.tope := 0;
    maxBotin := -1;
    for iPirata := 1 to piratas.tope do
        if piratas.pirata[iPirata].estaVivo then
        begin
            iBotin := contar_dinero (piratas.pirata[iPirata].asaltos, anio);
            if iBotin > maxBotin then
                begin
                piratas_merecedores.tope := 1;
                piratas_merecedores.cedulas[1] := piratas.pirata[iPirata].CI;
                maxBotin := iBotin
                end
            else
                if iBotin = maxBotin then
                    begin
                    piratas_merecedores.tope := piratas_merecedores.tope + 1;
                    piratas_merecedores.cedulas[piratas_merecedores.tope] := 
                        piratas.pirata[iPirata].CI
                    end
        end
end;

(*Programa principal*)
begin

{La parte c del ejercicio no se hace porque es interminable}

end.
