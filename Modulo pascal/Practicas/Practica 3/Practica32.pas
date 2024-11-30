{
2. Escribir un programa que:
a. Implemente un módulo que genere aleatoriamente información de ventas de un comercio.
Para cada venta generar código de producto, fecha y cantidad de unidades vendidas. Finalizar
con el código de producto 0. Un producto puede estar en más de una venta. Se pide:

i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de
producto. Los códigos repetidos van a la derecha.

ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
código de producto. Cada nodo del árbol debe contener el código de producto y la
cantidad total de unidades vendidas.

iii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
código de producto. Cada nodo del árbol debe contener el código de producto y la lista de
las ventas realizadas del producto.

Nota: El módulo debe retornar TRES árboles.
b. Implemente un módulo que reciba el árbol generado en i. y una fecha y retorne la cantidad
total de productos vendidos en la fecha recibida.
c. Implemente un módulo que reciba el árbol generado en ii. y retorne el código de producto
con mayor cantidad total de unidades vendidas.
d. Implemente un módulo que reciba el árbol generado en iii. y retorne el código de producto con mayor 
cantidad de ventas
}
program Ejercicio2;
type
    venta = record
        codigo:integer;
        fecha:integer;
        cant:integer;
        end;
        
    ventas = ^nodo;
    nodo = record
        dato:venta;
        hi:ventas;
        hd:ventas;
        end;
        
    producto = record
        codigo:integer;
        cant:integer;
        end;
        
    productos=^nodo2;
    nodo2=record
        dato:producto;
        hi:productos;
        hd:productos;
        end;    
    
    lista = ^nodo3;
    nodo3 =record
        dato:venta;
        sig:lista;
        end;
        
    prodvendido=record
        codigo:integer;
        vendidos:lista;
        end;
        
    prodvendidos=^nodo4;
    nodo4= record
        dato:prodvendido;
        hd:prodvendidos;
        hi:prodvendidos;
        end;
        
    
    procedure AgregarAdelante(var l:lista;v:venta);
    var
        nue:lista;
        
    begin
        new(nue); nue^.dato:=v; nue^.sig:=l; l:=nue;
    end;
    
    procedure AgregarProdVendido(var a:prodvendidos; codigo:integer; v:venta);
    begin
        if a=nil then begin
            new(a); a^.dato.codigo:=codigo; AgregarAdelante(a^.dato.vendidos,v); a^.hd:=nil; a^.hi:=nil;
        end     
        else
            if(codigo = a^.dato.codigo)then
                AgregarAdelante(a^.dato.vendidos,v)
            else begin
                if (codigo > a^.dato.codigo)then
                    AgregarProdVendido(a^.hd,codigo,v)
                else
                    AgregarProdVendido(a^.hi,codigo,v);
            end;
    end;
    
    procedure AgregarProducto(var a:productos; codigo:integer; cantidad:integer);
    begin
        if a=nil then begin
           new(a); a^.dato.codigo:=codigo; a^.dato.cant:=cantidad; a^.hd:=nil; a^.hi:=nil; 
        end
        else
            if (codigo =  a^.dato.codigo)then
                a^.dato.cant:=a^.dato.cant + cantidad
            else begin
                if (codigo > a^.dato.codigo) then 
                    AgregarProducto(a^.hd,codigo,cantidad)
                else
                    AgregarProducto(a^.hi,codigo,cantidad);
            end;
    end;

    procedure GenerarVenta(Var v:venta);
        begin
            v.codigo:=Random(30);
            if v.codigo<>0 then 
                v.fecha:=Random(12)+1;
                v.cant:=Random(1000)+1;
        end;
        
    procedure AgregarVenta(var a:ventas; v:venta);
        begin
            if(a=nil)then begin
                new(a); a^.dato:=v; a^.hi:=nil; a^.hd:=nil;
            end
            else begin
                if(v.codigo >= a^.dato.codigo)then
                    AgregarVenta(a^.hd,v)
                else
                    AgregarVenta(a^.hi,v);  
                
            end;
        end;
    procedure Procesar(var a:ventas; var ap:productos;var apv:prodvendidos);
    var
        v:venta;
    begin
        GenerarVenta(v);
        while(v.codigo<>0)do begin
            AgregarProducto(ap,v.codigo,v.cant);
            AgregarProdVendido(apv,v.codigo,v);
            AgregarVenta(a,v);
            GenerarVenta(v);
        end;
    end;
    
    procedure BuscarFecha(a:ventas;f:integer;var cant:integer);
    begin
        if a<>nil then begin
            if(f=a^.dato.fecha) then
                cant:=cant+a^.dato.cant;
            BuscarFecha(a^.hi,f,cant);
            BuscarFecha(a^.hd,f,cant);
        end;
    end;
    
    procedure BuscarMayor(a:productos; max:integer; var cod:integer);
    begin
        if a<>nil then begin
            if (a^.dato.cant > max)then begin
                max:=a^.dato.cant;
                cod:=a^.dato.codigo;
                end;
            BuscarMayor(a^.hi,cod,max);
            BuscarMayor(a^.hd,cod,max);
        end;
    end;
    
    function ContarElementosLista(l:lista):integer;
    var
        cant:integer;
    begin
        cant:=0;
        while(l<>nil)do begin
            cant:=cant+1;
            l:=l^.sig;
        end;    
    end;
    
    procedure BuscarMayorCantidad(a:prodvendidos; max:integer; var codigo:integer);
    var
        aux:integer;
    begin
        if a<>nil then begin
            aux:=ContarElementosLista(a^.dato.vendidos);
            if(max<aux)then begin
                max:=aux;
                codigo:=a^.dato.codigo;
                end;
            BuscarMayorCantidad(a^.hi,max,codigo);
            BuscarMayorCantidad(a^.hd,max,codigo);
        end;
    end;
    
    var
        a:ventas; ap:productos; apv:prodvendidos;
        cod,cant,max:integer;
    begin
        randomize();
        Procesar(a,ap,apv);
        cant:=0;
        BuscarFecha(a,20,cant);
        writeln(cant);
        max:=-1;
        BuscarMayor(ap,max,cod);
        writeln(cod);
        max:=-1;
        BuscarMayorCantidad(apv,max,cod);
        writeln(cod);
    end.
    
    















































