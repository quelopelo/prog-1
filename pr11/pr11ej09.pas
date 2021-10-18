program pr11ej09;

const
    M = 100;       {Máximo de factores}
    N = maxint;    {Mayor número representable}

type
    Factor = record
                 primo : 1..N;
                 case multiple : boolean of
                     true: (exponente : 2..N);
                     false : ()
             end;
    Descomp = record
                  factores : Array [1..M] Of Factor;
                  tope : 0..M
              end;

var num : integer;
    listaFac : Descomp;

procedure Factorizacion (num : integer; var listaFac : Descomp);
  {Recibe como entrada un número cualquiera mayor que 1
   y retorna su descomposición en factores primos}
var i : 1..(M+1);
    fac, exp : 0..N;
begin
    i := 1;
    fac := 2;
    while (i <= M) and (num > 1) do
    begin
        (*Hallar el exponente*)
        exp := 0;
        while num mod fac = 0 do
        begin
            num := num div fac;
            exp := exp + 1
        end;
        (*Asignar el factor*)
        with listaFac.factores[i] do
        begin
            if exp > 1 then
                begin
                primo := fac;
                multiple := true;
                exponente := exp;
                i := i + 1
                end
            else if exp = 1 then
                begin
                primo := fac;
                multiple := false;
                i := i + 1
                end
        end;
        (*Preparar para próxima iteración*)
        fac := fac + 1
    end;
    (*Asginar el tope*)
    if num > 1 then
        listaFac.tope := 0
    else
        listaFac.tope := i - 1
end;

procedure Presentacion (num : integer; listaFac : Descomp);
  {Despliega la factorización almacenada en listaFac}
var i : 1..M;
{P} procedure imprimir_un_factor (fac : Factor);
    begin
        with fac do
        begin
            write (primo:1);
            if multiple then
                write ('^', exponente:1)
        end
    end;
begin
    write (num:1, ' = ');
    imprimir_un_factor (listaFac.factores[1]);
    for i := 2 to listaFac.tope do
    begin
        write (' x ');
        imprimir_un_factor (listaFac.factores[i])
    end;
    writeln
end;

(*Programa principal*)
begin

(*Entrada de datos*)
write ('Ingrese un número natural mayor a 1: ');
readln (num);

(*Procesamiento*)
Factorizacion (num, listaFac);

(*Salida de datos*)
write ('Descomposición en primos: ');
Presentacion (num, listaFac)

end.
