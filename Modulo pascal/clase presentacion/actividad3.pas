// ACTIVIDAD 3: Crear un archivo ProgramaListas.pas
// a) Implemente un módulo CargarLista que cree una lista de enteros y le
// agregue valores aleatorios entre el 100 y 150, hasta que se genere el
// 120.
// b) Implemente un módulo ImprimirLista que reciba una lista generada en
// a) e imprima todos los valores de la lista en el mismo orden que están
// almacenados.
// c) Implemente un módulo BuscarElemento que reciba la lista generada
// en a) y un valor entero y retorne true si el valor se encuentra en la lista
// y false en caso contrario.
// d) Invocar desde el programa principal a los módulos implementados
// para crear una lista, mostrar todos sus elementos y determinar si un
// valor leído por teclado se encuentra o no en la lista.

program listas;
type
rango= 100..150;
lista= ^nodo;
nodo = record
elem:integer;
sig:lista;
end;

procedure CargarLista (var l,last:lista);
var
ale:integer; nuevo:lista;
begin
    ale:= random(50) + 100;
    while(ale<>120) do begin
    new(nuevo); nuevo^.elem:= ale; nuevo^.sig:=nil;
	if(l = nil) then
		l:=nuevo
	else
		last^.sig:=nuevo;
	last:=nuevo;
	ale:= random(50) + 100;
end;
end;
procedure ImprimirLista(l:lista);
begin
while(l<>nil)do begin
writeln(l^.elem);
l:=l^.sig;
end;
end;
function BuscarElemento(l:lista; num:integer):boolean;
var
enc:boolean;
begin
enc:=false;
while(l<>nil) AND(enc=false) do begin
if(l^.elem = num) then
enc:=true
else
l:=l^.sig;
end;
BuscarElemento:=enc;
end;

var
l,last:lista; num:integer;
begin
l:=nil; last:=nil;
CargarLista(l,last);
ImprimirLista(l);
writeln('escribi un numero para buscar entre 100 y 150');
readln(num);
writeln('Es ', BuscarElemento(l,num), ' el numero que ingresaste');
end.
