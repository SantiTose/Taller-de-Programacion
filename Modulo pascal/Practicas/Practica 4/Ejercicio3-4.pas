{3. Implementar un programa modularizado para una librería. Implementar módulos para:
a. Almacenar los productos vendidos en una estructura eficiente para la búsqueda por
código de producto. De cada producto deben quedar almacenados su código, la
cantidad total de unidades vendidas y el monto total. De cada venta se lee código de
venta, código del producto vendido, cantidad de unidades vendidas y precio unitario. El
ingreso de las ventas finaliza cuando se lee el código de venta -1.
b. Imprimir el contenido del árbol ordenado por código de producto.
c. Retornar el código de producto con mayor cantidad de unidades vendidas.
d. Retornar la cantidad de códigos que existen en el árbol que son menores que un valor
que se recibe como parámetro.
e. Retornar el monto total entre todos los códigos de productos comprendidos entre dos
valores recibidos (sin incluir) como parámetros.}
program Ejercicio34;
type
    producto = record
        codigo:integer;
        unidades:integer;
        monto:real;
        end;
    venta = record
        codventa:integer;
        codprod:integer;
        cant:integer;
        precio:real;
        end;
    arbol = ^nodo;
    nodo = record
        dato: producto;
        hd:arbol;
        hi:arbol;
        end;
procedure GenerarArbol(var a:arbol); // Punto A
    procedure AgregarArbol(var a:arbol; v:venta);
    begin
        if a=nil then begin
            new(a); a^.hd:=nil; a^.hi:=nil; a^.dato.codigo:=v.codprod; a^.dato.unidades:=1; a^.dato.monto:=v.precio;
        end
        else begin
            if(v.codprod = a^.dato.codigo)then begin
                a^.dato.unidades:=a^.dato.unidades +v.cant;
                a^.dato.monto:= a^.dato.monto + v.precio;
                end
            else begin
                if(v.codprod>a^.dato.codigo)then 
                    AgregarArbol(a^.hd,v)
                else
                    AgregarArbol(a^.hi,v);
            end;
        end;
    end;
    procedure leerVenta(var v:venta);
    begin
        v.codprod:=Random(100)-1;
        if v.codprod<>-1 then begin
            v.codventa:=Random(100);
            v.cant:=Random(30)+1;
            v.precio:=Random(400);
        end;
    end;
var 
    v:venta;
begin
    leerVenta(v);
    while(v.codprod<>-1)do begin
        AgregarArbol(a,v);
        leerVenta(v);
    end;
end;    

procedure ImprimirArbol(a:arbol); // Punto B
    procedure ImprimirVenta(p:producto);
    begin
        writeln('=================');
        writeln('Producto con codigo: ',p.codigo);
        writeln('Unidades: ',p.unidades);
        writeln('Monto: ',p.monto);
    end;
begin
    if a<>nil then begin
        ImprimirVenta(a^.dato);
        ImprimirArbol(a^.hd);
        ImprimirArbol(a^.hi);
    end;
end;

procedure BuscarMayor(a:arbol;var max:integer;var codmax:integer); // Punto C
begin
    if a<>nil then begin
        if(max<a^.dato.unidades)then begin
            max:=a^.dato.unidades;
            codmax:=a^.dato.codigo;
            end;
        BuscarMayor(a^.hd,max,codmax);
        BuscarMayor(a^.hi,max,codmax);
    end;    
end;

procedure ContarCodigos(a:arbol;val:integer;var cant:integer); // Punto D
begin
    if a<>nil then begin
        if(a^.dato.codigo<val)then
            cant:=cant+1;
        ContarCodigos(a^.hd,val,cant);
        ContarCodigos(a^.hi,val,cant);
    end;
end;

procedure MontoConLimites(a:arbol;var monTotal:real; val1,val2:integer); // Punto E
begin
    if a<> nil then begin
        if(a^.dato.codigo>val1)then begin
            if (a^.dato.codigo<val2)then 
                monTotal:=a^.dato.monto+monTotal
        end;
        MontoConLimites(a^.hd,monTotal,val1,val2);
        MontoConLimites(a^.hi,monTotal,val1,val2);
    end;
end;
var
    a:arbol; cod,cant,val1,val2:integer; monto:real;
begin
    a:=nil;
    randomize;
    GenerarArbol(a);// Punto A
    ImprimirArbol(a); //Punto B
    cant:=0;
    BuscarMayor(a,cant,cod); // Punto C
    writeln('El codigo con mas unidades es: ',cod);
    ContarCodigos(a,Random(100),cant); // Punto D
    writeln('La cantidad de codigos menores a ese valor son: ',cant);
    val1:=Random(50);
    val2:=Random(50)+50;
    MontoConLimites(a,monto,val1,val2);
    writeln('El monto total entre ',val1,' y ',val2, ' es: ', monto);
end.





