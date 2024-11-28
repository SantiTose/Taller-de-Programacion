//Implemente un módulo CargarVector que cree un vector de enteros
//con a lo sumo 50 valores aleatorios. Los valores, generados
//aleatoriamente (entre un mínimo y máximo recibidos por parámetro),
//deben ser almacenados en el vector en el mismo orden que se
//generaron, hasta que se genere el cero.


program Eje2;
const
tam = 50;
type
vector = array [1 .. tam] of integer;
procedure CargarVector(var v:vector; var diml:integer);
var
ale,a,b:integer;
begin
diml:= 0;
readln(a); readln(b);
ale:= a+ random(b-a);
while (ale<>0) AND (diml<50) do begin
diml:=diml+1;
v[diml]:= ale;
ale:= a+random(b-a);
end;
end;

procedure imprimirvector(v:vector; diml:integer);
var
i:integer;
begin
for i := 1 to diml do begin
writeln(v[i]);
end;
end;
var
v:vector; diml:integer;
begin
CargarVector(v,diml);
imprimirvector(v,diml);
write('termino');
end.