{{IMPORTANTE: Cree un programa en Pascal. Utilice su apellido como nombre del programa y del 
archivo .pas, y guárdelo en el Escritorio de su computadora.

El Correo Argentino necesita procesar los envíos entregados durante el mes de Agosto de 2023. 
De cada envío se conoce el código del cliente, día, código postal y peso del paquete.

a) Implementar un módulo que lea envíos, genere y retorne una estructura adecuada para la búsqueda por código postal, 
donde para cada código postal se almacenen juntos todos los envíos (código de cliente, día y peso del paquete). 
La lectura finaliza con peso de paquete 0. Se sugiere utilizar el módulo leerEnvio( ).

b) Implementar un módulo que reciba la estructura generada en a) y un código postal, 
y retorne todos los envíos de dicho código postal.

c) Realizar un módulo recursivo que reciba la estructura que retorna el inciso b) y 
retorne los dos códigos de cliente correspondientes al envío con mayor y menor peso.

NOTA: Implementar el programa principal, que invoque a los incisos a, b y c.}

program Parcial2;
type
    envio = record
        codigo:integer;
        dia:integer;
        postal:integer;
        peso:real;
        end;
    
    datoenvio = record
        cliente:integer;
        dia:integer;
        peso:real;
        end;
    
    lista= ^nodo;
    nodo = record
        dato:datoenvio;
        sig:lista;
        end;
    
    datoarbol = record
        cod:integer;
        envios:lista;
        end;
        
    arbol = ^nodoa;
    nodoa= record
        dato: datoarbol;
        hi:arbol;
        hd:arbol;
        end;
    

procedure leerEnvio(var e : envio);
    begin
  e.peso := Random(50);
  if (e.peso <> 0) then
  begin
    e.codigo := Random(100) + 1;
    e.postal := Random(100) + 1;
    e.dia := Random(31) + 1;
  end;
    end;

procedure agregaradelante(var l:lista ; e:envio);
    var nuevo:lista;
    begin
    new(nuevo); 
    nuevo^.dato.cliente:= e.codigo;
    nuevo^.dato.dia := e.dia;
    nuevo^.dato.peso:=e.peso;
    nuevo^.sig:=l;
    l:=nuevo;
    end;

procedure AgregarArbol(var a:arbol; e:envio);
    begin
    if(a=nil) then begin
        new(a); a^.dato.cod:=e.postal; a^.hi:=nil; a^.hd:=nil;
        agregaradelante(a^.dato.envios,e);
        end
    else if (a^.dato.cod = e.postal) then agregaradelante(a^.dato.envios, e)
    else begin if (a^.dato.cod < e.postal) then AgregarArbol(a^.hd,e)
        else AgregarArbol(a^.hi,e);
    end;
    end;
    
procedure ImprimirEnvio(e:envio);
    begin
    write(' Postal: ', e.postal);
    write(' Codigo: ', e.codigo);
    write(' Dia: ', e.dia);
    writeln(' Peso: ', e.peso:0:2);
    end;

function BuscarPostal(a:arbol; p:integer):lista;
    begin
    if (a = nil) then
        BuscarPostal := nil
    else begin
        if (a^.dato.cod > p) then
            BuscarPostal := BuscarPostal(a^.hi, p) 
        else if (a^.dato.cod < p) then  
            BuscarPostal := BuscarPostal(a^.hd, p)
        else
            BuscarPostal := a^.dato.envios;
    end;
    end;

procedure ImprimirLista(l:lista);
    begin
    while(l<>nil) do begin
    
    write(' Cliente: ',l^.dato.cliente);
    write(' Dia: ',l^.dato.dia);
    writeln(' Peso: ',l^.dato.peso:0:2);
    l:=l^.sig;
    end;
    end;

procedure MayorMenor(max,min:real; var cmax,cmin:integer; l:lista);
begin
if(l<>nil) then begin
if(max < l^.dato.peso) then begin
    max:=l^.dato.peso;
    cmax:=l^.dato.cliente;
    end;
if(min > l^.dato.peso) then begin
    min:= l^.dato.peso;
    cmin:=l^.dato.cliente;
    end;
MayorMenor(max,min,cmax,cmin,l^.sig);
end;

end;

var
e:envio; p,cmax,cmin:integer; l:lista; max,min:real; a:arbol;
begin
    randomize;
    a:=nil;
    leerEnvio(e);
    while (e.peso <> 0) do begin
    AgregarArbol(a,e);
    ImprimirEnvio(e);
    leerEnvio(e);
    end;
    read(p);
    l:= BuscarPostal(a,p);
    ImprimirLista(l);
    max:=-1;
    min:=999999;
    MayorMenor(max,min,cmax,cmin,l);
    writeln('El Mayor peso lo tiene el cliente: ', cmax);
    writeln('El menor peso lo tiene el cliente: ', cmin);
end.}