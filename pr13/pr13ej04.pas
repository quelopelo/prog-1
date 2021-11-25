program pr13ej04;

const
    max = 30;  {Algún valor apropiado}
type
    TComparacion = (mayor, menor, igual);
    TTexto = record
                 nombre : array [1 .. max] of char;
                 tope   : 0 .. max;
             end; 
    arregloNombres = array [1 .. max] of TTexto;

function ComparacionNombres (n1, n2 : TTexto) : TComparacion;
{Dados dos nombres 'n1' y 'n2', devuelve la comparación entre ellos}
var topemin, i : 0 .. max;
    comp : TComparacion;
begin
    if n1.tope = n2.tope then
    begin
        topemin := n1.tope;
        comp := igual
    end
    else
        if n1.tope < n2.tope then
        begin
            topemin := n1.tope;
            comp := menor
        end
        else
        begin
            topemin := n2.tope;
            comp := mayor
        end;
    i := 1;
    while (i <= topemin) and (n1.nombre[i] = n2.nombre[i]) do
        i := i + 1;
    if i <= topemin then
        if n1.nombre[i] < n2.nombre[i] then
            comp := menor
        else
            comp := mayor;
    ComparacionNombres := comp
end;

function BuscarNombre (n : TTexto; a : arregloNombres) : boolean; 
{Devuleve TRUE si el nombre 'n' ocurre dentro del arreglo 'a' y FALSE
en caso contrario. El arreglo de nombres 'a' está ordenado en forma
lexicográfica y creciente}
var i1, i2, i3 : 1 .. max;
var comp : TComparacion;
begin
    i1 := 1;
    i3 := n.tope;
    i2 := (i1 + i3) div 2;
    comp := ComparacionNombres (n, a[i2]);
    while (i1 <= i3) and (comp <> igual) do
    begin
        if comp = menor then
            i3 := i2 - 1
        else
            i1 := i2 + 1;
        i2 := (i1 + i2) div 2;
        comp := ComparacionNombres (a[i2], n)
    end;
    BuscarNombre := i1 <= i3
end;

(*Programa principal*)
begin

{No se pide en el ejercicio}

end.
