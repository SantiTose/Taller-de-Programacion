program Parcial1;
type
    rangomes=1..12;
    compra = record
        cliente:integer;
        mes:rangomes;
        monto:real;
        end;
    vector = array[rangomes] of real;
    cliente = record
        codigo:integer;
        gastos:vector;
        end;
    arbol = ^nodo;
        nodo = record
            dato:cliente;
            hd:arbol;
            hi:arbol;
            end;
            
procedure iniciarVector(v:vector);
var
    i:integer;
begin
    for i:= 1 to 12 do begin
        v[i]:=0;
    end;
end;    
procedure CargarArbol(var a:arbol); // Punto A
    procedure AgregarArbol(var a:arbol; c:compra);
        begin
            if a=nil then begin
                new(a); a^.hd:=nil; a^.hi:=nil; a^.dato.codigo:=c.cliente;
                iniciarVector(a^.dato.gastos);
                a^.dato.gastos[c.mes]:=a^.dato.gastos[c.mes]+c.monto;
            end
            else begin
                if (a^.dato.codigo = c.cliente) then begin
                    a^.dato.gastos[c.mes]:= a^.dato.gastos[c.mes]+c.monto;
                    end
                else begin
                    if a^.dato.codigo < c.cliente then
                        AgregarArbol(a^.hd,c)
                    else
                        AgregarArbol(a^.hi,c);
                    end;
        end;
        end;
    procedure leerCompra(var c: compra);
    begin
        c.cliente:=Random(100);
        if c.cliente<>0 then begin
            c.monto:=(Random(20000)+1) / (Random(10) + 1);
            c.mes:=Random(12)+1;
        end;
    end;
    var
        c:compra;
    begin
        leerCompra(c);
        while c.cliente<>0 do begin
            AgregarArbol(a,c);
            leerCompra(c);
            end;
    end;

function BuscarClienteConMasGastos(a:arbol;c:cliente):integer;// Punto B
    function mesMasGastos(c:cliente):integer; 
    var
        mesmax,i:integer; max:real;
    begin
        max:=-111;
        for i:=1 to 12 do begin
            if c.gastos[i]> max then begin
                max:=c.gastos[i];
                mesmax:=i;
            end;
        mesMasGastos:=mesmax;
        end;
    end;
begin
    if a<>nil then begin
        if(a^.dato.codigo = c.codigo) then 
            BuscarClienteConMasGastos:= mesMasGastos(a^.dato);
        BuscarClienteConMasGastos(a^.hd,c);
        BuscarClienteConMasGastos(a^.hi,c);
        end;
end;

procedure BuscarClientesSinGastos(a:arbol; var cant:integer; mes:rangomes); // Punto C
begin
    if a<>nil then begin
        if (a^.dato.gastos[mes] = 0)then
            cant:=cant+1;
        BuscarClientesSinGastos(a^.hd,cant,mes);
        BuscarClientesSinGastos(a^.hi,cant,mes);
    end;
end;

procedure ImprimirArbol(a:arbol);// Comprobacion
begin
    if a<>nil then begin
        writeln(a^.dato.codigo);
        ImprimirArbol(a^.hd);
        ImprimirArbol(a^.hi);
        end;
end;
var
    a:arbol; cant:integer; c:cliente;
begin
    randomize;
    a:=nil;
    CargarArbol(a);
    ImprimirArbol(a);
    read(c.codigo);
    writeln('======');
    writeln(BuscarClienteConMasGastos(a,c));
    cant:=0;
    writeln('=========');
    BuscarClientesSinGastos(a,cant,10);
    writeln(cant);
end.
            