{PlayStation Store requiere procesar las compras realizadas por sus clientes durante el año 2022.

a) Implementar un módulo que lea compras de videojuegos. De cada compra se lee código del videojuego, 
código de cliente, día y mes. La lectura finaliza con el código de cliente 0. 
Se sugiere utilizar el módulo leerCompra(). Se deben retornar 2 estructuras de datos:

i. Una estructura eficiente para la búsqueda por código de cliente.

ii. Otra estructura que almacena la cantidad de compras realizadas en cada mes.

b) Implementar un módulo que reciba la estructura generada en a) i, un código de cliente, retorne todas las compras
que realizó dicho cliente. 

c) Implementar un módulo que reciba la estructura generada 
en a) ii y retorne la misma estructura ordenada por cantidad de mayor a menor.

NOTA: Implementar el programa principal, que invoque a los incisos a, b y c.}

program Parcial;
type    
    rangodia= 1..31;
    rangomes= 1..12;
    
    compra = record
    cod:integer;
    cliente:integer;
    dia:rangodia;
    mes:rangomes;
    end;
    
    arbol= ^nodo;
    nodo= record
        dato:compra;
        hi:arbol;
        hd:arbol;
        end;
        
    lista= ^nodol;
    nodol=record
    dato:compra;
    sig:lista;
    end;
    
    vector = array[rangomes] of integer;

procedure leerCompra(var c:compra);
    begin
        c.cliente:= Random(100);
        if(c.cliente <> 0) then begin
            c.dia:= random(31)+1;
            c.mes:=random(12)+1;
            c.cod:=random(20)+1;
    end;
    end;
    
procedure AgregarArbol(var a:arbol ; c:compra);
    begin
    if(a=nil) then begin
        new(a); a^.dato:=c; a^.hd:=nil; a^.hi:=nil;
    end else if c.cod >= a^.dato.cod then AgregarArbol(a^.hd,c)
    else AgregarArbol(a^.hi,c)
    end;
    
procedure IniciarVector(var v:vector);
    var i:integer;
    begin
        for i := 1 to 12 do begin
            v[i]:=0;
        end;
    end;

procedure ProcesarA (var a:arbol; var v:vector);
    var c:compra;
    begin
        leerCompra(c);
        while(c.cliente<>0) do begin
            AgregarArbol(a,c);
            v[c.mes]:= v[c.mes] + 1;
            write(' Codigo: ',c.cod);
            write(' Cliente: ', c.cliente);
            write(' Dia: ', c.dia);
            writeln(' Mes: ',c.mes);
            leerCompra(c);
            
        end;
    end;

procedure AgregarLista(var l:lista; c:compra);
var nuevo:lista;
begin
    new(nuevo); nuevo^.dato:=c; nuevo^.sig:= l; l:=nuevo;
end;

procedure procesarB(a:arbol; num:integer; var l:lista);
begin
    if(a<>nil) then begin
        l:=nil;
    end
    else if a^.dato.cliente = num then 
    begin 
    AgregarLista(l,a^.dato);
    procesarB(a^.hd,num,l)
    end
    else if a^.dato.cliente > num then procesarB(a^.hi,num,l)
    else procesarB(a^.hd,num,l)
end;

procedure procesarC(var v:vector);
var i,j:rangomes; actual:integer;
begin
for i := 2 to 12 do begin
    actual:=v[i];
    j:=i-1;
    while (j>0) AND (v[j] < actual) do begin
        v[j+1]:= j;
        j:=j-1;
        end;
    v[j+1]:=actual;
    end;
end;

var 
a:arbol; l:lista; v:vector; num:integer;
begin
randomize;
IniciarVector(v);
ProcesarA(a,v);

read(num);
procesarB(a,num,l);
if(l<> nil)then
writeln('Compras Cargadas.. ')
else writeln('No Hay compras para cargar');
procesarC(v);
end.










