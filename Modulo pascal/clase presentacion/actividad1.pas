program NumAleatorio;
var ale,i,f,a,b: integer;
begin
randomize;
readln(f); readln(a); readln(b);
ale := a + random (b - a);
while (ale<>f) do begin
writeln ('El número aleatorio generado es: ', ale);
ale := a + random (b - a);
end;
end.
