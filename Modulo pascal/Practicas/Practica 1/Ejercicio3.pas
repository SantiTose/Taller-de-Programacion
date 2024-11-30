{
3.- Netflix ha publicado la lista de películas que estarán disponibles durante el mes de
diciembre de 2022. De cada película se conoce: código de película, código de género (1: acción,
2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélico, 7: documental y 8: terror) y puntaje
promedio otorgado por las críticas.
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
TALLER DE PROGRAMACIÓN – Módulo Imperativo 2024
2
a. Lea los datos de películas, los almacene por orden de llegada y agrupados por código de
género, y retorne en una estructura de datos adecuada. La lectura finaliza cuando se lee el
código de la película -1.
b. Genere y retorne en un vector, para cada género, el código de película con mayor puntaje
obtenido entre todas las críticas, a partir de la estructura generada en a)..
c. Ordene los elementos del vector generado en b) por puntaje utilizando alguno de los dos
métodos vistos en la teoría.
d. Muestre el código de película con mayor puntaje y el código de película con menor puntaje,
del vector obtenido en el punto c).
}
program Ejercicio3;
type 
    subgenero = 1..8;
    pelicula=record
        codigo:integer;
        genero:subgenero;
        puntaje:real;
        end;
    lista= ^nodo;
    nodo=record
        dato:pelicula;
        sig:lista;
        end;
        
    vector = array [1..8] of integer;
procedure leerpeli(var p:pelicula);
begin
    p.codigo := Random(20)-1;
    if p.codigo<>-1 then begin
        p.genero:= Random(8)+1;
        p.puntaje:=Random(40);
        end;
end;
procedure InsertarOrdenado(var l:lista;p:pelicula);
var
    nue,act,ant:lista;
begin
    new(nue);
    nue^.dato:=p;
    act:=l;
    ant:=l;
    while(act<>nil)and(p.genero<> l^.dato.genero)do begin
        ant:=act;
        act:=act^.sig;
        end;
    if(act=ant)then 
        l:=nue
    else
        ant^.sig:=nue;
        nue^.sig:=act;
end;

procedure cargarpelis(var l:lista);
var
    p:pelicula;
begin
    leerpeli(p);
    while(p.codigo<>-1)do begin
        InsertarOrdenado(l,p);
        leerpeli(p);
        end;
end;

procedure iniciar(var v:vector);
var
    i:integer;
begin
    for i:= 1 to 8 do begin
        v[i]:=-1;
    end;
end;    

procedure buscargenero(var v:vector; l:lista);
var
    gen,codmax:integer; max:real;
begin
    while(l<>nil)do begin
        max:=-1;
        gen:=l^.dato.genero;
            while(l<>nil)and (gen = l^.dato.genero)do begin
                if(max<l^.dato.puntaje)then begin
                    max:=l^.dato.puntaje;
                    codmax:=l^.dato.codigo;
                    end;
                l:=l^.sig;
                end;
            v[gen]:=codmax;
        end;
end;

procedure ordenarvector(var v:vector);
var
    i,j,act:integer;
begin
    for i:=2 to 8 do begin
        act:=v[i];
        j:=i-1;
        while(j<>0) and (v[j]<act)do begin
            v[j+1]:=v[j];
            j:=j-1;
        end;
        v[j+1]:= act;
        end;
end;    

var

l:lista;
v:vector;
begin
    randomize;
    l:=nil;
    cargarpelis(l);
    iniciar(v);
    buscargenero(v,l);
    ordenarvector(v);
    writeln('El codigo de menor puntaje es:', v[1]);
    writeln('El codigo de mayor puntaje es:', v[8]);
end.










