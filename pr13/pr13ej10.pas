program pr13ej10;

const
    max = 100;  {Algún valor apropiado}

type
    rangoCalificacion = 1 .. 12;
    TAsignatura = (Criptografia, Programacion, Calculo);
    TEstudiante = record
                      matricula    : integer;
                      asignatura   : TAsignatura;
                      calificacion : rangoCalificacion;
                  end;

    rango = 1 .. max;
    estudiantesAsignatura = array [rango] of TEstudiante;

function EsMayorEstudiante (e1, e2 : TEstudiante) : boolean;
{Devuelve true si 'e1' es mayor que 'e2' de acuerdo con los criterios
definidos en el procedimiento OrdenarPorAsignatura}
var esmayor : boolean;
begin
    esmayor := false;
    if e1.asignatura > e2.asignatura then
        esmayor := true
    else if e1.asignatura = e2.asignatura then
        if e1.calificacion > e2.calificacion then
            esmayor := true
        else if e1.calificacion = e2.calificacion then
            if e1.matricula > e2.matricula then
                esmayor := true;
    EsMayorEstudiante := esmayor
end;

function MayorEstudiantePos (pos : rango; e : estudiantesAsignatura) : rango;
{Devuelve la posición del mayor estudiante del arreglo 'e' entre las
posiciones 1 y 'pos', usando la función EsMayorEstudiante}
var i, imayor : rango;
begin
    imayor := 1;
    for i := 2 to pos do
        if EsMayorEstudiante (e[i], e[imayor]) then
            imayor := i;
    MayorEstudiantePos := imayor
end;

procedure OrdenarPorAsignatura (var e : estudiantesAsignatura);
{Recibe un arreglo de estudiantes 'e' con la calificación obtenida en
las asignaturas y lo ordena en forma ascendente según los siguientes
criterios, utilizando el método de ordenación por selección:
* en primer lugar, por el orden de la asignatura, definido en el tipo;
* en segundo lugar, por la calificación;
* en tercer lugar, por la matricula}
var i, imayor : rango;
    temp : TEstudiante;
begin
    for i := max downto 2 do
    begin
        imayor := MayorEstudiantePos (i, e);
        temp := e[imayor];
        e[imayor] := e[i];
        e[i] := temp
    end
end;

(*Programa principal*)
begin

{No se pide en el ejercicio}

end.
