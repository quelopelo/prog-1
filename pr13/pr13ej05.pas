program pr13ej05;

const
    maxT = 30;
    maxE = 100;  {Algún valor apropiado}
    maxC = 10;   {Algún valor apropiado}

type
    TComparacion = (mayor, menor, igual);
    
    TTexto = record
                 caracteres : array [1 .. maxT] of char;
                 tope       : 0 .. maxT;
             end; 
    
    TEstudiante = record
                      nombre     : TTexto;
                      generacion : integer;
                  end;
    
    TEstudiantes = record
                       estudiante : array [1 .. maxE] of TEstudiante;
                       tope       : 0 .. maxE;
                   end;
    
    TCarrera = record
                   nombre      : TTexto;
                   estudiantes : TEstudiantes;
               end;
    
    TBedelias = array [1 .. maxC] of TCarrera;

function ComparacionNombres (n1, n2 : TTexto) : TComparacion;
{Dados dos nombres 'n1' y 'n2', devuelve la comparación entre ellos}
var topemin, i : 0 .. maxT;
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
    while (i <= topemin) and (n1.caracteres[i] = n2.caracteres[i]) do
        i := i + 1;
    if i <= topemin then
        if n1.caracteres[i] < n2.caracteres[i] then
            comp := menor
        else
            comp := mayor;
    ComparacionNombres := comp
end;

function BuscarEstudiante (n, c : TTexto; b : TBedelias ) : boolean; 
{Determina si el estudiante de nombre 'n' está inscripto a la carrera 'c'}
var c1, c2, c3 : 1 .. maxC;
    e : 1 .. maxE;
    comp : TComparacion;
    busqueda : boolean;
begin
    c1 := 1;
    c3 := maxC;
    c2 := (c1 + c3) div 2;
    comp := ComparacionNombres (c, b[c2].nombre);
    while (c1 <= c3) and (comp <> igual) do
    begin
        if comp = menor then
            c3 := c2 - 1
        else
            c1 := c2 + 1;
        c2 := (c1 + c3) div 2;
        comp := ComparacionNombres (c, b[c2].nombre)
    end;
    if c1 > c3 then
        busqueda := false
    else
        with b[c2].estudiantes do
        begin
            e := 1;
            while (e <= tope) and
                  (ComparacionNombres (n, estudiante[e].nombre) <> igual) do
                e := e + 1;
            if e > tope then
                busqueda := false
            else
                busqueda := true
        end;
    BuscarEstudiante := busqueda
end;

procedure BuscarEstudiantesGeneracion (gen : integer;  b : TBedelias;
                                       var bGen : TBedelias);
{Devuelve en 'bGen' todos los estudiantes que ingresaron en el año 'gen'}
var c : 1 .. maxC;
    e : 1 .. maxE+1;
    e1, e2, e3 : 1 .. maxE;
    a1, a2, a3 : integer;
    seguir : boolean;
begin
    for c := 1 to maxC do
    begin
        bGen[c].nombre := b[c].nombre;
        bGen[c].estudiantes.tope := 0;
        e1 := 1;
        a1 := b[c].estudiantes.estudiante[e1].generacion;
        e3 := b[c].estudiantes.tope;
        a3 := b[c].estudiantes.estudiante[e3].generacion;
        seguir := (a1 < gen) and (a3 >= gen);
        while seguir do
        begin
            e2 := (e1 + e3) div 2;
            a2 := b[c].estudiantes.estudiante[e2].generacion;
            if gen <= a2 then
            begin
                e3 := e2;
                a3 := a2;
                seguir := a3 >= gen
            end
            else
            begin
                e1 := e3;
                a1 := a3;
                seguir := a1 < gen
            end
        end;
        e := e1;
        while (e <= b[c].estudiantes.tope) and 
              (b[c].estudiantes.estudiante[e].generacion = gen) do
        begin
            bGen[c].estudiantes.tope := bGen[c].estudiantes.tope + 1;
            bGen[c].estudiantes.estudiante[bGen[c].estudiantes.tope] :=
                b[c].estudiantes.estudiante[e];
            e := e + 1
        end
    end
end;

(*Programa principal*)
begin

{No se pide en el ejercicio}

end.
