{4.- Una librería requiere el procesamiento de la información de sus productos. De cada
producto se conoce el código del producto, código de rubro (del 1 al 8) y precio.
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
a. Lea los datos de los productos y los almacene ordenados por código de producto y
agrupados por rubro, en una estructura de datos adecuada. El ingreso de los productos finaliza
cuando se lee el precio 0.
b. Una vez almacenados, muestre los códigos de los productos pertenecientes a cada rubro.
c. Genere un vector (de a lo sumo 30 elementos) con los productos del rubro 3. Considerar que
puede haber más o menos de 30 productos del rubro 3. Si la cantidad de productos del rubro 3
es mayor a 30, almacenar los primeros 30 que están en la lista e ignore el resto.
d. Ordene, por precio, los elementos del vector generado en c) utilizando alguno de los dos
métodos vistos en la teoría.
e. Muestre los precios del vector resultante del punto d).
f. Calcule el promedio de los precios del vector resultante del punto d).}
program Ejercicio4;
type
    subrango= 1..8;
    producto = record
        codigo:integer;
        rubro:subrango;
        precio:real;
        end;
    lista=^nodo;
    nodo=record
        dato:producto;
        sig:lista;
        end;
    vector = array [0..30]of producto;
procedure leerProducto(var p:producto);
begin
    p.precio:= Random(400);

    if p.precio<>0 then begin
        p.rubro:= Random(8)+1;
        p.codigo:=Random(30);
    end;
end;
procedure AgregarOrdenado(var l:lista;p:producto);
var
    ant,act,nue:lista;
begin
    new(nue); nue^.dato:=p;
    act:=l;
    ant:=l;
    
    while(act<>nil)and(p.rubro > act^.dato.rubro)do begin
        ant:=act;
        act:=act^.sig;

    end;
    if (act=ant) then begin
        l:=nue;
        end
    else begin
        while(act<>nil)and (p.codigo > act^.dato.codigo)do begin
            ant:=act;
            act:=act^.sig;
        end;
        ant^.sig:=nue;
        nue^.sig:=act;
    end;
end;

procedure cargarLista(var l:lista);
var
    p:producto;
begin
    leerProducto(p);
    while(p.precio<>0)do begin
        AgregarOrdenado(l,p); {Agrega por coigo y agrupados en codigo de rubro}
        leerProducto(p);
    end;
end;
procedure ImprimirLista(l:lista);
var
    rubro:subrango;
begin
    while(l<>nil)do begin
        rubro:=l^.dato.rubro;
        writeln('Codigos del rubro', rubro);
        while(l<>nil) and (l^.dato.rubro = rubro) do begin
        writeln(l^.dato.codigo);
        l:=l^.sig;
        end;
    end;
end;

var
l:lista;
begin
    l:=nil;
    cargarLista(l);
    ImprimirLista(l);
end.
