PROGRAM pr08ej03 (output);
VAR num, aux, temp : Integer;

PROCEDURE pascal (num : Integer; VAR suma : Integer);
VAR aux : Integer;
BEGIN
    temp := 2 * num + suma;
    aux := temp * suma;
    num := num + 1;
    suma := suma + num;
    writeLn (temp, aux, num, suma)
END;

BEGIN
    num := 1;
    aux := 0;
    temp := 0;
    pascal (num, temp);
    writeLn (num, aux, temp);
    temp := temp + 1;
    pascal (temp, num);
    writeLn (num, aux, temp)
END.
