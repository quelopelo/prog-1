program pr13ej02;

const
    maxcol = 4;  {Algún valor apropiado}
    maxfil = 3;  {Algún valor apropiado}

type

    matrizEnteros = array [1..maxfil, 1..maxcol] of integer;

    TPosicion = record
                    fil : 1 .. maxfil;
                    col : 1 .. maxcol;
                end;

    TOcurrencias = record
                       ocurrencia : array [1 .. maxcol * maxfil] of TPosicion;
                       tope       : 0 .. maxcol * maxfil;
                   end;

function BuscarElementoMatriz (e : Integer; m : matrizEnteros) : boolean;
{Determina si el elemento 'e' ocurre en la matriz 'm'}
var ocurre : boolean;
    fil : 1 .. maxfil+1;
    col : 1 .. maxcol+1;
begin
    ocurre := false;
    fil := 1;
    while (fil <= maxfil) and not ocurre do
    begin
        col := 1;
        while (col <= maxcol) and (m[fil, col] <> e) do
            col := col + 1;
        ocurre := col <= maxcol;
        fil := fil + 1
    end;
    BuscarElementoMatriz := ocurre
end;

procedure BuscarOcurrenciasParesMatriz (m : matrizEnteros;
                                        var ocurrencias : TOcurrencias);
{Devuelve en 'ocurrencias' todas las posiciones de los elementos de la
matriz cuyo valor es par}
var fil : 1 .. maxfil;
    col : 1 .. maxcol;
begin
    ocurrencias.tope := 0;
    for fil := 1 to maxfil do
        for col := 1 to maxcol do
            if m [fil, col] mod 2 = 0 then
                with ocurrencias do
                begin
                    tope := tope + 1;
                    ocurrencia[tope].fil := fil;
                    ocurrencia[tope].col := col;
                end 
end;

(*Programa principal*)
begin

{No se pide en el ejercicio}

end.
