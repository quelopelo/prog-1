program pr13ej09;

const
    max = 30;  {Algún valor apropiado}
type
    rango = 1 .. max;
    arregloCaracteres = array [rango] of char;

function maximoArregloCar (ini, fin : rango; a : arregloCaracteres) : char;
{Devuelve el máximo carácter según la ordenación de la tabla ASCII
ubicado entre las posiciones 'ini' y 'fin'}
{Precondición: 'ini' es menor o igual a 'fin'}
var i : rango; 
    m : char;
begin
    m := a[ini];
    for i := (ini+1) to fin do
        if a[i] > m then
            m := a[i];
    maximoArregloCar := m
end;

procedure ordenarArregloCaracteres (var a : arregloCaracteres);
{ordena el arreglo 'a' pasado por parámetro de forma ascendente
utilizando el método de ordenación por selección}
var i, imax : rango;
    temp : char;
{F} function maximoArregloPos (ini, fin : rango; a : arregloCaracteres) : rango;
    var i, imax : rango; 
    begin
        imax := ini;
        for i := (ini+1) to fin do
            if a[i] > a[imax] then
                imax := i;
        maximoArregloPos := imax
    end;
begin
    for i := max downto 2 do
    begin
        imax := maximoArregloPos (1, i, a);
        temp := a[imax];
        a[imax] := a[i];
        a[i] := temp
    end
end;

(*Programa principal*)
begin

{No se pide en el ejercicio}

end.
