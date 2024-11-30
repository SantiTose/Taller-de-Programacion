{2.- Escribir un programa que:
a. Implemente un módulo recursivo que genere y retorne una lista de números enteros
“random” en el rango 100-200. Finalizar con el número 100.
b. Un módulo recursivo que reciba la lista generada en a) e imprima los valores de la lista en el
mismo orden que están almacenados.
c. Implemente un módulo recursivo que reciba la lista generada en a) e imprima los valores de
la lista en orden inverso al que están almacenados.
d. Implemente un módulo recursivo que reciba la lista generada en a) y devuelva el mínimo
valor de la lista.
e. Implemente un módulo recursivo que reciba la lista generada en a) y un valor y devuelva
verdadero si dicho valor se encuentra en la lista o falso en caso contrario.
}

program Ejercicio1;
type
    lista=^nodo;
    nodo = record
        dato:integer;
        sig:lista;
        end;
procedure CargarLista(var l:lista);
var 
    num:integer; nue:lista;
begin
    num:=Random(100)+100;
    if (num<>100)then begin
        new(nue); nue^.dato:=num; nue^.sig:=l;
        l:=nue;
        CargarLista(l);
    end;
end;
procedure Imprimir(l:lista);
begin
    if (l<>nil)then begin
        writeln(l^.dato);
        Imprimir(l^.sig);
    end;
end;
procedure ImprimirInverso(l:lista);
begin
    if(l<>nil)then begin
        ImprimirInverso(l^.sig);
        writeln(l^.dato);
    end;
end;
function BuscarMenor(l:lista; min:integer):integer;
begin
    if(l<>nil)then begin
        if(min > l^.dato)then 
            min:=l^.dato;
        BuscarMenor:= BuscarMenor(l^.sig,min);
         end   
    else
            BuscarMenor:=min;
end;
function Valor(l:lista;num:integer):boolean;
begin
    if(l<>nil)then begin
        if(l^.dato=num)then
            Valor:=true
        else
            Valor:=Valor(l^.sig,num);
        end
    else    
        Valor:=false;
end;
var
    l:lista;
    num:integer;
    min:integer;
begin
    randomize;
    l:=nil;
    CargarLista(l);
    Imprimir(l);
    writeln('===========================================================');
    ImprimirInverso(l);
    min:=9999;
    writeln('===========================================================');
    writeln(BuscarMenor(l,min));
    writeln('===========================================================');
    writeln(Valor(l,150));
end.













