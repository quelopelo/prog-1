program pr05ej07;

var	saldo, trans : real;
	comando : char;

begin

writeln('Programa que calcula el saldo de una cuenta');

(*Primera instrucción*)
readln(comando, saldo);	{Saldo inicial}

(*Validación de primera instrucción (no se pide)*)
while	(comando <> 'a') and (comando <> 'A') do
begin
	writeln('Comando incorrecto; no se registró el saldo inicial');
	readln(comando, saldo)
end;

(*Segunda instrucción*)
read(comando);

(*Ciclo de lectura de instrucciones y cálculo del saldo*)
while	(comando <> 'x') and (comando <> 'X') do
begin
	readln(trans);
	case comando of
		'd', 'D':	saldo := saldo + trans;	{Deposito}
		'r', 'R':	saldo := saldo - trans	{Retiro}
	else
		(*Validación de instrucción (no se pide)*)
		writeln('Comando incorrecto; no se registró la transacción')
	end;
	read(comando)
end;

writeln('El saldo final es ', saldo:1:2)

end.
