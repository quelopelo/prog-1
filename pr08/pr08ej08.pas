PROGRAM pr08ej08;
var x,y,z: integer;

procedure atlantida (var x: integer; y: integer);
begin
      y := x - 10;
      x := 5;
      z := x + y + z;
      writeln (z)
end;

function lapaloma (a: integer; b: integer) : integer;
var x,z: integer;

   procedure ptadeleste (var x: integer);
   begin
        x := x + z
   end;

begin
     z := a;
     x := b;
     ptadeleste (y);
     y := x - z;
     lapaloma := y + x
end;

begin
     readln (x);
     y := x + 1;
     z := x - 1;
     atlantida (y, z);
     z := lapaloma (x, y);
     writeln (x);
     writeln (y);
     writeln (z)
end.
