{ACTIVIDAD 4: Crear un archivo ProgramaListasOrdenadas.pas
a) Implemente un módulo CargarListaOrdenada que cree una lista de
enteros y le agregue valores aleatorios entre el 100 y 150, hasta que se
genere el 120. Los valores dentro de la lista deben quedar ordenados
de menor a mayor.
b) Reutilice el módulo ImprimirLista que reciba una lista generada en a) e
imprima todos los valores de la lista en el mismo orden que están
almacenados.
c) Implemente un módulo BuscarElementoOrdenado que reciba la lista
generada en a) y un valor entero y retorne true si el valor se encuentra
en la lista y false en caso contrario.
d) Invocar desde el programa principal a los módulos implementados
para crear una lista ordenada, mostrar todos sus elementos y
determinar si un valor leído por teclado se encuentra o no en la lista.}

program act4;
type
lista=^nodo;
nodo = record
elem:integer;
sig:lista;
end;
procedure insertar (Var l: lista);
Var
 actual,anterior,nuevo:lista; ale:integer;
Begin
    ale:= 100+ random(50);
    while (ale<>120) do begin
        new (nuevo); nuevo^.elem:= ale; nuevo^.sig:=nil;
        if (l = nil) then     
            l:= nuevo
        
        else begin
            actual:= l; anterior:=l;
            while (actual <> nil) and (actual^.elem < nuevo^.elem) do   
            begin
                anterior:=actual;
                actual:= actual^.sig;
            end;
            if (actual = l) then 
            begin
                nuevo^.sig:= l;   l:= nuevo;
            end
            else
            begin
                anterior^.sig:= nuevo;   nuevo^.sig:= actual;
            end;
        end; //else
        ale:= 100+ random(50);
    end;
End;

procedure ImprimirLista(l:lista);
begin
while(l<>nil)do begin
writeln(l^.elem);
l:=l^.sig;
end;
end;

function BuscarElementoOrdenado(l:lista; num:integer):Boolean;
Var
enc:boolean;
begin
    enc:=false;
    while (l<>nil) and (l^.elem < num) do begin
        l:=l^.sig;
    end;
    if (l<>nil) AND (l^.elem = num) then 
        enc:=true;
    BuscarElementoOrdenado:= enc;
end;


Var
l:lista; num:integer;
begin
l:=nil;
insertar(l);
ImprimirLista(l);
readln(num);
write(BuscarElementoOrdenado(l,num));
end.