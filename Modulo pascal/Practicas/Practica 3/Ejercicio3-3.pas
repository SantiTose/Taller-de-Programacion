{3. Implementar un programa que contenga:
a. Un módulo que lea información de los finales rendidos por los alumnos de la Facultad de
Informática y los almacene en una estructura de datos. La información que se lee es legajo,
código de materia, fecha y nota. La lectura de los alumnos finaliza con legajo 0. La estructura
generada debe ser eficiente para la búsqueda por número de legajo y para cada alumno deben
guardarse los finales que rindió en una lista.
b. Un módulo que reciba la estructura generada en a. y retorne la cantidad de alumnos con
legajo impar.
c. Un módulo que reciba la estructura generada en a. e informe, para cada alumno, su legajo y
su cantidad de finales aprobados (nota mayor o igual a 4).
d. Un módulo que reciba la estructura generada en a. y un valor real. Este módulo debe
retornar los legajos y promedios de los alumnos cuyo promedio supera el valor ingresado.
}
program Ejercicio33;
type
    subfechas=1..30;
    final = record
        legajo:integer;
        materia:integer;
        fecha:subfechas;
        nota:integer;
        end;
    lista = ^nodo;
    nodo = record
        dato:final;
        sig:lista;
        end;
    alumno = record
        legajo:integer;
        finales:lista;
        end;
    arbol = ^nodo2;
    nodo2= record
        dato:alumno;
        hd:arbol;
        hi:arbol;
        end;
        
procedure leerFinal(var f:final);
begin
    f.legajo:=Random(100);
    if f.legajo <> 0 then begin
        f.materia:=Random(12)+1;
        f.fecha:=Random(30)+1;
        f.nota:=Random(10)+1;
    end;
end;
        
procedure AgregarLista(var l:lista;f:final);
var 
    nue:lista;
begin
    new(nue); nue^.dato:=f;
    nue^.sig:=l;
    l:=nue;
end;

procedure CargarArbol(var a:arbol); //Punto A

procedure AgregarArbol(var a:arbol; f:final); 
begin
    if a= nil then begin
        new(a); a^.hd:=nil;a^.hi:=nil; a^.dato.legajo:=f.legajo; AgregarLista(a^.dato.finales,f);
    end
    else begin
        if(f.legajo = a^.dato.legajo) then
            AgregarLista(a^.dato.finales,f)
        else begin
            if (f.legajo > a^.dato.legajo) then
                AgregarArbol(a^.hd,f)
            else    
                AgregarArbol(a^.hi,f);
        end;
    end;
end;
var
    f:final;
begin
    leerFinal(f);
    while(f.legajo<>0)do begin
        AgregarArbol(a,f);
        leerFinal(f);
    end;
end;

procedure ImprimirArbol(a:arbol); // Comprobar la carga
begin
    if a<>nil then begin
        writeln(a^.dato.legajo);
        ImprimirArbol(a^.hd);
        ImprimirArbol(a^.hi);
    end;
end;

procedure BuscarImpares(a:arbol;var cant:integer); //Punto B
begin
    if(a<>nil)then begin
        if((a^.dato.legajo mod 2) <> 0)then
            cant:=cant+1;
        BuscarImpares(a^.hi,cant);
        BuscarImpares(a^.hd,cant);
        end
end;

procedure ImprimirNotas(a:arbol); // Punto C
    function ContarNotassLista(l:lista):integer;
    var
        cant:integer;
    begin
        cant:=0;
        while(l<>nil)do begin
            if(l^.dato.nota >= 4)then   
                cant:=cant+1;
            l:=l^.sig;
        end;
        ContarNotassLista:=cant;
    end;

var
    notas:integer;
begin
    if a<>nil then begin
        notas:=ContarNotassLista(a^.dato.finales);
        if(notas<>0)then begin
            writeln('Alumno con legajo: ', a^.dato.legajo);
            writeln('Cantidad de finales aprobados: ',notas);
        end;
        ImprimirNotas(a^.hd);
        ImprimirNotas(a^.hi);
    end;
end;

procedure ImprimirPromedios(a:arbol;prom:real); // Punto D
    function CalcularPromedio(a:alumno):real;
    var
        cantExamenes,totNotas:integer;
    begin
        cantExamenes:=0;
        totNotas:=0;
        while(a.finales<>nil)do begin
            cantExamenes:=cantExamenes+1;
            totNotas:=totNotas+a.finales^.dato.nota;
            a.finales:=a.finales^.sig;
        end;
        CalcularPromedio:=totNotas/cantExamenes;
    end;
var
    promAlu:real;
begin
    if(a<>nil)then begin
        promAlu:=CalcularPromedio(a^.dato);
        if(promAlu>= prom)then begin
            writeln('El alumno con legajo: ',a^.dato.legajo);
            writeln('Tiene promedio que supera el ingresado con: ',promAlu);
        end;
        ImprimirPromedios(a^.hd,prom);
        ImprimirPromedios(a^.hi,prom);
        end;
end;
var
    a:arbol; cant:integer;prom:real;
begin
    randomize;
    a:=nil;
    CargarArbol(a); // Punto A
    ImprimirArbol(a);
    cant:=0;
    BuscarImpares(a,cant); // Punto B
    writeln('========');
    writeln(cant);
    writeln('=======');
    ImprimirNotas(a);
    prom:=0;
    ImprimirPromedios(a,prom);
end.









