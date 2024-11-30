{3.- Implementar un programa que invoque a los siguientes módulos.
a. Un módulo recursivo que retorne un vector de 20 números enteros “random” mayores a 300
y menores a 1550 (incluidos ambos).
b. Un módulo que reciba el vector generado en a) y lo retorne ordenado. (Utilizar lo realizado
en la práctica anterior)
c. Un módulo que realice una búsqueda dicotómica en el vector, utilizando el siguiente
encabezado:
Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice);
Nota: El parámetro “pos” debe retornar la posición del dato o -1 si el dato no se encuentra
en el vector.}
program Ejercicio3;
type
    indice=1..20;
    vector=array[indice]of integer;

procedure CargarVector(var v:vector);
var
    i:indice;
begin
    for i:=1 to 20 do begin
        v[i]:=Random(1250)+300;
    end;
end;

procedure OrdenarInsercion(var v:vector);
var
    i,j:indice; act:integer;
begin
    for i:=2 to 20 do begin
        act:=v[i];
        j:=i-1;
        while(j > 0)and(v[j]> act)do begin
            v[j+1]:=v[j];
            j:=j-1;
            end;
        v[j+1]:=act;
    end;
end;

procedure busquedaDicotomica(v:vector;ini,fin:indice;dato:integer;var pos:integer);
var
    medio:indice;
begin
    medio:=(ini+fin)div 2;
    writeln('Ini:',ini,'/ Fin:',fin,'/ Medio: ',medio,'/ Pos: ',pos);
    if(ini<=fin)then begin
        if (v[medio]=dato)then
            pos:=medio
        else
            if(v[medio]> dato)then
                busquedaDicotomica(v,ini,medio-1,dato,pos)
            else
                busquedaDicotomica(v,medio+1,fin,dato,pos);
    end
    else    
        pos:=-1;
end;
var
    v:vector; ini,fin:indice; dato,pos:integer;
begin
    randomize;
    CargarVector(v);
    OrdenarInsercion(v);
    writeln('Cargado y ordenado');
    dato:= 360;
    ini:=1;
    fin:=20;
    busquedaDicotomica(v,ini,fin,dato,pos);
    writeln('Pos: ',pos);
end.

















