program CorreoArgentino;
type
    envio = record
        codigo:integer;
        dia:integer;
        peso:real;
        end;
    lista = ^nodo1;
    nodo1 = record
        dato:envio;
        sig:lista;
        end;
    datoarbol = record
        codigo:integer;
        envios:lista;
        end;
    arbol = ^nodo;
    nodo = record
        dato:datoarbol;
        hd:arbol;
        hi:arbol;
        end;
procedure generarArbol(var a:arbol); // Punto A
    procedure leerEnvio(var e:envio);
    begin
        e.codigo:=Random(1000);
        if e.codigo<>0 then begin
            e.dia:=Random(30)+1;
            e.peso:=Random(20000)/(Random(10)+1);
        end;
    end;
    procedure AgregarLista(var l:lista; e:envio);
    var
        nue:lista;
    begin
        new(nue); nue^.sig:=l; nue^.dato:=e; l:=nue;
    end;
    procedure agregarArbol(var a:arbol; e:envio;cod:integer);
    begin
        if a =nil then begin
            new (a); a^.dato.codigo:=cod; a^.hd:=nil; a^.hi:=nil;
            AgregarLista(a^.dato.envios,e);
        end
        else begin
            if (a^.dato.codigo = cod) then 
                AgregarLista(a^.dato.envios,e)
            else begin
                if (a^.dato.codigo < cod) then 
                    agregarArbol(a^.hd,e,cod)
                else
                    agregarArbol(a^.hi,e,cod);
            end;    
        end;
    end;
var 
    e:envio; cod:integer;
begin
    leerEnvio(e);
    while(e.codigo<>0)do begin
        cod:=Random(50)+1;
        agregarArbol(a,e,cod);
        leerEnvio(e);
        end;
end;
procedure imprimirArbol(a:arbol);
begin
    if a<>nil then begin
        write(a^.dato.codigo, ' ');
        imprimirArbol(a^.hd);
        imprimirArbol(a^.hi);
    end;    
end;

procedure buscarEnvios(a:arbol;cod:integer;var l:lista);
begin
    if a<>nil then begin
        if( a^.dato.codigo = cod) then begin
            l:=a^.dato.envios;
            write(a^.dato.codigo);
            end
        else begin
            buscarEnvios(a^.hd,cod,l);
            buscarEnvios(a^.hi,cod,l);
            end;
    end;
end;

procedure imprimirLista(l:lista);
begin
    while(l<>nil)do begin
        write('cod: ', l^.dato.codigo,' ');
        write(' peso: ' ,l^.dato.peso:0:2, ' ');
        writeln('');
        l:=l^.sig;
    end;
end;

procedure BuscarMenorYMayor(var codmin,codmax:integer; var min,max:real; l:lista);
begin
    if l<>nil then begin
        if(l^.dato.peso > max)then begin
            max:=l^.dato.peso;
            codmax:=l^.dato.codigo;
        end;
        if(l^.dato.peso < min) then begin
            min:=l^.dato.peso;
            codmin:=l^.dato.codigo;
        end;
        BuscarMenorYMayor(codmin,codmax,min,max,l^.sig);
    end;
end;

var
    a:arbol; l:lista; codmax,codmin:integer; max,min:real;
begin
    randomize();
    a:=nil;
    generarArbol(a);
    imprimirArbol(a);
    writeln('');
    writeln('=======');
    buscarEnvios(a,5,l);
    writeln('');
    writeln('=======');
    imprimirLista(l);
    min:=9999;
    max:=-1111;
    BuscarMenorYMayor(codmin,codmax,min,max,l);
    writeln('');
    writeln('=======');
    writeln('Codigo menor: ', codmin,' Codigo Mayor: ',codmax);
end.