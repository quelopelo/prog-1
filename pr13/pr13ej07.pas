program pr13ej07;

const
    maxF = 10;  {Algún valor apropiado}
    maxC = 10;  {Algún valor apropiado}
type
    rangoF = 1 .. maxF;
    rangoC = 1 .. maxC;
    
    TVariante = (rojo, azul, verde);
    
    TFicha = record
                 tipo    : TVariante;
                 puntaje : integer;
             end;
    
    TTablero = array [rangoF, rangoC] of TFicha;

procedure OrdenarTablero (var t : TTablero);
{Ordena por el método de inserción las fichas del tablero de forma
ascendente según los siguientes criterios:
* según color, tal que rojo < azul < verde;
* si hay empate de color, se ordena en forma ascendente por el puntaje}
var f : rangoF;
    c : rangoC;
{F} function EsMenorFicha (ficha1, ficha2 : TFicha) : boolean;
    begin
        if ficha1.tipo < ficha2.tipo then
            EsMenorFicha := true
        else
            if (ficha1.tipo = ficha2.tipo) and
               (ficha1.puntaje < ficha2.puntaje) then
                EsMenorFicha := true
            else
                EsMenorFicha := false
    end;
{P} procedure CasillaAnterior (f : rangoF; c : rangoC;
                               var fant : rangoF; var cant : rangoC;
                               var ultima : boolean);
    begin
        if c > 1 then
        begin
            fant := f;
            cant := c - 1;
            ultima := false
        end
        else
            if f > 1 then
            begin
                fant := f - 1;
                cant := maxC;
                ultima := false
            end
            else
                ultima := true
    end;
{P} procedure OrdenarPosicion (f : rangoF; c : rangoC; var t: TTablero);
    var ficha : TFicha;
        fant : rangoF;
        cant : rangoC;
        ultima : boolean;
    begin
        ficha := t[f, c];
        CasillaAnterior (f, c, fant, cant, ultima);
        while not ultima and EsMenorFicha (ficha, t[fant, cant]) do
        begin
            t[f, c] := t[fant, cant];
            f := fant;
            c := cant;
            CasillaAnterior (f, c, fant, cant, ultima)
        end;
        t[f, c] := ficha
    end;
{Inicio del procedimiento}
begin
    for f := 1 to maxF do
        for c := 1 to maxC do
            OrdenarPosicion (f, c, t)
end;

(*Programa principal*)
begin

{No se pide en el ejercicio}

end.
