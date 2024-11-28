program parcial_bibliotecaSarmiento;

type

prestamo = record
numero:integer;
isbn:integer;
codigoSocio:integer;
end;


prestamo2 = record
codigoSocio:integer;
cantP:integer;
end;

arbol = ^arbolNodo;
arbolNodo = record
dato:prestamo;
hI: arbol;
hD:arbol;
end;

lista = ^nodo;
nodo = record
dato:prestamo2;
sig:lista;
end;

procedure moduloA(var a:arbol; var l:lista);

	procedure leerPrestamo(var p:prestamo);
	begin
		p.codigoSocio := random(500);
		if(p.codigoSocio <> 0) then
			begin
				p.isbn := random(1000);
				
				p.numero := random(9999);
			end;
	end;

	procedure insertarArbol1(var a:arbol; p:prestamo);
	begin
		if(a = nil) then
			begin
				new(a);
				a^.dato:= p;
				a^.hI:= nil;
				a^.hD:= nil;
			end
			else
				begin
					if(p.isbn >= a^.dato.isbn) then
						insertarArbol1(a^.hD, p)
					else
						insertarArbol1(a^.hI,p);
				end;
	end;
	procedure aga(var l:lista; p:prestamo2);
	var
	n:lista;
	begin
		new(n);
		n^.dato:= p;
		n^.sig:= l;
		l:= n;
	end;
var
p:prestamo;
p2:prestamo2;
pAct,cantPres:integer;
begin
a:= nil;
L:= nil;
leerPrestamo(p);
while(p.codigoSocio <> 0) do begin
	pAct:= p.codigoSocio;
	cantPres:= 0;
while (p.codigoSocio <> 0) and (p.codigoSocio = pAct)  do
	begin
	cantPres:= cantPres +1;
	insertarArbol1(a,p);
	leerPrestamo(p);
end;
	p2.codigoSocio:= pAct;
	p2.CantP:= cantpres;
	aga(l,p2);
end;
end;

function moduloB(a:arbol; isb: integer):integer;
begin
	if(a = nil) then
	moduloB:= 0
	else
	begin
		if(a^.dato.isbn = isb) then
			moduloB:= 1 + moduloB(a^.hD,isb)
		else
		begin
			if(isb < a^.dato.isbn ) then
				moduloB:= moduloB(a^.hi,isb)
			else
				moduloB:= moduloB(a^.hD,isb);
		end;
	end
end;

procedure moduloC(l:lista; x:integer ;var cant:integer);
begin
	if(l^.sig <> nil) then
	moduloC(l^.sig,x,cant);		
			if(l^.dato.cantP > x )then
				cant:= cant +1;
			
end;


procedure imprimirLista(l:lista);
begin
	while(l <> nil) do
	begin
		writeln(l^.dato.CodigoSocio);
		writeln(l^.dato.cantP);
		l:= l^.sig;
	end;
end;
var
a:arbol;
l:lista;
cant,x,isb:integer;
begin
cant:= 0;
moduloA(a,l);
writeln('ingrese un isb para buscar cuantos isbn iguales hay');
readln(isb);
writeln(moduloB(a,isb));
//imprimirLista(l);
writeln('ingrese un valor para X y asi devolver la cantidad de socio mayor a X');
readln(x);
moduloC(l,x,cant);
writeln('cantidad de socios : ', cant);
end.
