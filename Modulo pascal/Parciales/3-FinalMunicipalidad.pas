program Final;
type
    rangocategorias = 1..6;
    rangohora = 1..24;
    rangomes = 1..12;
    rangodia = 1..31;
    tipodireccion = record
        calle:integer;
        altura:integer;
        end;
    tipofecha = record
        hora:rangohora;
        dia:rangodia;
        mes:rangomes;
        end;
    denuncia = record
        categoria:rangocategorias;
        dni:integer;
        direccion: tipodireccion;
        fecha:tipofecha;
        end;
    lista = ^nodo;
    nodo = record
        dato:denuncia;
        sig:lista;
        end;
    datolista = record
        numero:integer;
        cantdenuncias:integer;
        cantJulio:integer;
        end;
    lista1 = ^nodo1;
    nodo1 = record
        dato:datolista;
        sig:lista1;
        end;
    
procedure generarAlta(var l:lista); // Punto A
    procedure leerDenuncia(var d:denuncia);
    begin
        d.dni:=Random(300);
        if d.dni<>0 then begin
            d.categoria:=Random(6)+1;
            d.direccion.calle:=Random(100)+1;
            d.direccion.altura:=Random(100)+1;
            d.fecha.hora:=Random(24)+1;
            d.fecha.dia:=Random(31)+1;
            d.fecha.mes:=Random(12)+1;
        end;
    end;
    procedure AgregarOrdenado(var l:lista;nue:lista);
    var
        ant,act:lista;
    begin
        if l = nil then begin
            l:=nue;
            end
        else begin
            ant:=l;
            act:=l;
            while((act<>nil)and(act^.dato.direccion.calle< nue^.dato.direccion.calle))do begin
                ant:=act;
                act:=act^.sig;
            end;
            ant^.sig:=nue;
            nue^.sig:=act;
        end;
    end;
    procedure AgruparCategoria(var l:lista; d:denuncia);
    var
        nue,ant,act:lista;
    begin
        new(nue); nue^.sig:=nil; 
        nue^.dato:=d;
        ant:=l; act:=l;
        if l=nil then begin
            l:=nue;
            end
        else begin
            while((act<>nil) and(d.categoria > act^.dato.categoria)) do begin
                ant:=act;
                act:=act^.sig;
                end;
        AgregarOrdenado(act,nue);
        end;
    end;
var
    d:denuncia;
begin
    leerDenuncia(d);
    while d.dni<>0 do begin
        AgruparCategoria(l,d);
        leerDenuncia(d);
    end;
    
end;

procedure CrearNuevaLista(var l:lista1; li:lista);
    procedure verSiEsta(var nodo:lista1;l:lista1;dato:datolista);
    begin
        nodo:=nil;
        while(l<>nil)do begin
                if(dato.numero = l^.dato.numero)then
                    nodo:=l
                else 
                    l:=l^.sig;
            end;
    end;
     procedure AgregarLista(var l:lista1; d:datolista);
     var
         nue,nodo:lista1; 
     begin
         new(nue); nue^.dato:=datolista; nue^.sig:=nil;
         verSiEsta(nodo,l,dato)
         if(nodo <> nil)then begin
            nue^.sig:=l;
            l:=nue;
            end;
     end;
var
    dato:datolista;
begin
    while(li<>nil) do begin
        dato.numero:= li^.dato.direccion.calle;
        dato.cantdenuncias:=0;
        dato.cantJulio:=0;
        while(li<>nil) and(dato.numero = li^.dato.direccion.calle)do begin
            dato.cantdenuncias:=dato.cantdenuncias+1;
            if(li^.dato.fecha.mes = 7)then
                dato.cantJulio:=dato.cantJulio+1;
            li:=li^.sig;
            end;
        AgregarLista(l,dato);
        end;
end;

procedure imprimirLista(l:lista);
begin
    while(l<>nil)do begin
        writeln(l^.dato.direccion.calle);
        l:=l^.sig;
    end;
end;
var
    l:lista;
begin
    l:=nil;
    randomize;
    generarAlta(l);
    imprimirLista(l);
end.