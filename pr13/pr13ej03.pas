program pr13ej03;

const
    maxN = 30;   {Algún valor apropiado}
    maxL = 100;  {Algún valor apropiado}
    
type
    TTexto = record
                 nombre : array [1 .. maxN] of char;
                 tope   : 0 .. maxN;
             end;
    
    TEstado = (nuevo, usado);
    
    TLibro = record
                 titulo : TTexto;
                 anio   : integer; 
                 case estado : TEstado of
                     nuevo : (proveedor : TTexto); 
                     usado : (clasif : 1 .. 10)
             end;

    TEstanteria = record
                      libro : array [1 .. maxL] of TLibro;
                      tope  : 0 .. maxL;
                  end;

    TBiblioteca = array ['A' .. 'Z'] of TEstanteria;

function IgualesTitulos (t1, t2 : TTexto) : boolean;
{Determina si los títulos t1 y t2 son iguales}
var i : 1 .. maxN+1;
begin
    if t1.tope <> t2.tope then
        IgualesTitulos := false
    else
    begin
        i := 1;
        while (i <= t1.tope) and (t1.nombre[i] = t2.nombre[i]) do
            i := i + 1;
        IgualesTitulos := i > t1.tope
    end
end;

function BuscarLibro (t : TTexto; a : Integer; e : TEstado;
                      b : TBiblioteca) : boolean;
{Determina si el libro con el titulo 't', año 'a' y estado 'e' se
encuentra en la biblioteca. Se supone que el título del libro a buscar
no es vacío y que no existen dos libros con iguales valores en todos
sus campos en la biblioteca}
var i : 1 .. maxL+1;
begin
    with b[t.nombre[1]] do
    begin
        i := 1;
        while (i <= tope) and not
              ((IgualesTitulos (libro[i].titulo, t)) and
              (libro[i].anio = a) and
              (libro[i].estado = e)) do
            i := i + 1;
        BuscarLibro := i <= tope
    end
end;

procedure BuscarLibrosAnio (a : Integer; b : TBiblioteca);
{Imprime en la salida estándar la información de todos los libros que
fueron publicados luego del año 'a'. La impresión en pantalla es
ordenada por la primera letra del título del libro en forma
lexicográfica decreciente y luego en forma descendente según el año de
publicación}
var letra : 'A' .. 'Z';
    ind : 0 .. maxL;
{P} procedure ImprimirTexto1 (t : TTexto);
    var i : 1 .. maxN;
    begin
        with t do
        for i := 1 to tope do
            write (nombre[i])
    end;
{P} procedure ImprimirTexto2 (t : TTexto);
    var i : 1 .. maxN;
    begin
        ImprimirTexto1 (t);
        with t do
        for i := (tope+1) to maxN do
            write (' ')
    end;
{P} procedure ImprimirLibro (l : TLibro);
    begin
        with l do
        begin
            ImprimirTexto2 (titulo);
            write (' | ');
            write (anio : 4);
            write (' | ');
            if estado = nuevo then
            begin
                write ('Nuevo (');
                ImprimirTexto1 (proveedor);
                writeln (')')
            end
            else
                writeln ('Usado (', clasif:1, ')')
        end
    end;
{Inicio del procedimiento}
begin
    for letra := 'Z' to 'A' do
        with b[letra] do
        begin
            ind := tope;
            while (ind > 0) and (libro[ind].anio > a) do
            begin
                ImprimirLibro (libro[ind]);
                ind := ind - 1
            end
        end
end;

(*Programa principal*)
begin

{No se pide en el ejercicio}

end.
