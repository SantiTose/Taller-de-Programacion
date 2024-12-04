program AlquileresAutos;
type
    rangodias  = 1..7;
    alquiler = record
        dni:integer;
        chasis:integer;
        dias:rangodias;
        end;
    arbol = ^nodo;
    nodo = record
        dato:alquiler;
        hd:arbol;
        hi:arbol;
        end;
    vector = array [rangodias] of arbol;
    
procedure cargarVector(var v:vector); // Punto A
    procedure leerAlquiler(var a:alquiler);
    begin
        a.chasis:=Random(100);
        if(a.chasis<>0)then begin
            a.dni:=Random(100)+1;
            a.dias:=Random(7)+1;
        end;
    end;
    procedure AgregarArbol(var a:arbol; al:alquiler);
    begin
        if a = nil then begin
            new(a); a^.dato:=al; a^.hd:=nil; a^.hi:=nil;
            end
        else begin
            if (a^.dato.chasis < al.chasis)then 
                AgregarArbol(a^.hd,al)
            else    
                AgregarArbol(a^.hi,al);
        end;
    end;
var
    al:alquiler;
begin
    leerAlquiler(al);
    while (al.chasis<>0)do begin
        AgregarArbol(v[al.dias],al);
        leerAlquiler(al);
    end;
end;

procedure ImprimirVector(v:vector); // Comprobacion
    procedure ImprimirArbol(a:arbol);
    begin
        if a<>nil then begin
            write(a^.dato.chasis, ' ');
            ImprimirArbol(a^.hd);
            ImprimirArbol(a^.hi);
        end;    
    end;
var
    i:integer;
begin
    for i:= 1 to 7 do begin
        writeln( 'Arbol: ', i);
        ImprimirArbol(v[i]);
        writeln('');
    end;
end; 


function totalAlquileres(v:vector; dni:integer):integer; // Punto B
    procedure buscarDniArbol(a:arbol;dni:integer;var cant:integer);
        begin
            if a<>nil then begin
                if(a^.dato.dni = dni) then
                    cant:=cant+1;
                buscarDniArbol(a^.hd,dni,cant);
                buscarDniArbol(a^.hi,dni,cant);
            end;
        end;    
var
    i,cant:integer;
begin
    cant:=0;
    for i:=1 to 7 do begin
        buscarDniArbol(v[i],dni,cant);
        end;
        totalAlquileres:=cant;
end;

function cantidadEntreChasis(v:vector;dia:rangodias;cha1,cha2:integer):integer;
    procedure buscarArbol(a:arbol;cha1,cha2:integer;var cant:integer);
    begin
        if a<>nil then begin
            if(cha1<=a^.dato.chasis)and(a^.dato.chasis<=cha2)then begin
                    cant:=cant+1;
                    buscarArbol(a^.hd,cha1,cha2,cant);
                    buscarArbol(a^.hi,cha1,cha2,cant);
            end;
        end;    
    end;
var
    cant:integer;
begin
    cant:=0;
    buscarArbol(v[dia],cha1,cha2,cant);
    cantidadEntreChasis:=cant;
end;

var
    v:vector; cant:integer;
begin
    randomize();
    cargarVector(v);
    ImprimirVector(v);
    cant:= totalAlquileres(v,32);
    writeln('El dni: 32 tuvo: ', cant, ' alquileres');
    writeln('cant: ', cantidadEntreChasis(v,3,1,30));
end.
    