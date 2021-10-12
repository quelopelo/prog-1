program	pr10ej11;

type	vocal = (a, e, i, o, u);

var		letra : vocal; 
		uncar : Char;

begin

letra := a;
while letra <= u do
begin 
	read (uncar);
	writeLn ('El caracter leido es: ', uncar);
	letra := succ (letra)
end

end.
