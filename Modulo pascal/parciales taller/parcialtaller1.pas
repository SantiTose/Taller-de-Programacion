{IMPORTANTE: Cree un programa en Pascal. Utilice su apellido como nombre del programa 
y del archivo .pas, y guárdelo en el Escritorio de su computadora.

La biblioteca Sarmiento necesita un sistema para obtener estadísticas sobre los libros prestados. 
De cada préstamo se conoce: el número de préstamo, ISBN del libro y código de socio. 
La lectura finaliza con código de socio 0 y todos los préstamos realizados a un mismo socio se leen consecutivamente.

a) Implementar un módulo que lea información de los préstamos y genere: 
i. Una estructura de datos eficiente para la búsqueda por ISBN del libro.
ii. Una estructura donde se almacenen códigos de socios junto a su cantidad de préstamos.

b) Implementar un módulo que reciba la estructura generada en a) y un ISBN y retorne la cantidad de préstamos de ese ISBN.

c) Realizar un módulo recursivo que reciba la estructura generada en 
a) ii y un valor X y retorne la cantidad de socios con cantidad de préstamos superior al valor X.

NOTA: Implementar el programa principal, que invoque a los incisos a, b y c.
En caso de ser necesario, puede utilizar los módulos que se encuentran a continuación.
}

program Ejer;
type
    
    prestamo = record
        numero:integer;
        isbn:integer;
        cod:integer;
        end;
    
    socio = record
        numero:integer;
        prestamos:integer;
        end;
    
    arbol= ^nodoa;
    nodoa = record
        dato: prestamo;
        hi:arbol;
        hd:arbol;
        end;
    
    lista=^nodo;
    nodo = record
        dato: socio;
        sig:lista;
        end;

procedure GenPrestamos(p:prestamo);
    begin
    read(p.cod);
    if(p.cod <> 0 ) then begin
        read(p.numero); 
        read(p.isbn); 
        end;
    end;

procedure CargarArbol(var a:arbol; p:prestamo);
    begin
    if(a=nil)then begin
        new(a); a^.dato:=p; a^.hi:=nil; a^.hd:=nil;
        end
    else 
        begin 
        if(a^.dato.isbn >= p.isbn) then 
            CargarArbol(a^.hi,p)
        else 
            CargarArbol(a^.hd,p);
        end;
        end;

procedure CargarLista(var l:lista; s:socio);
    var
    nuevo:lista;
    begin
        new(nuevo); nuevo^.dato:=s; nuevo^.sig:=nil;
        if(l=nil) then
            l:=nuevo
        else begin
            nuevo^.sig:=l;
            l:=nuevo;
            end;
    end;

procedure Procesar(var a:arbol; var l:lista);
var 
p:prestamo; s:socio; aux:integer;
begin
    GenPrestamos(p);
    aux:= p.cod;
    while(p.cod <> 0) do begin
        s.prestamos:= 0;
        while(p.cod <> 0 ) and (aux = p.cod) do begin
            CargarArbol(a,p);
            GenPrestamos(p);
            s.prestamos:= s.prestamos+1;
            end;
        s.numero:= aux;
        CargarLista(l,s);
        end;
end;

function buscar(a:arbol; isbn:integer):integer;
var
aux:integer;
begin
    aux:=0;
    if(a^.dato.isbn < isbn) then buscar(a^.hd,isbn)
    else if (a^.dato.isbn > isbn) then buscar(a^.hi,isbn)
    else if (a^.dato.isbn = isbn)  then begin
        aux:=aux+1;
        buscar(a^.hi,isbn);
        end;
    buscar:=aux;
end;

var
a:arbol; l:lista;
begin
randomize;
a:= nil;
l:=nil;

end.