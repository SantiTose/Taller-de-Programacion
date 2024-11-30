program Ejercicio2;
const 
	dimf=300;
type 
	indice=1..dimf;
	oficinas = record
		codigo:integer;
		dni:integer;
		valor:real;
		end;
	vector = array [0..300] of oficinas;

procedure leerof(var o:oficinas);
begin
    o.codigo:= Random(10)-1;
    if (o.codigo <> -1) then begin
    o.dni:= Random(2202)+1;
    o.valor:=Random(300)+1;
    end;
end;
	
procedure cargar(var v:vector; var diml:indice);
	var
		off:oficinas;
	begin
		leerof(off);
		while ((off.codigo<>-1)AND(diml<dimf)) do begin
			v[diml]:=off;
			diml:=diml+1;
			leerof(off);
		    end;
	end;
	
procedure OrdenarInsercion(var v:vector; diml:indice);
	var 
		i,j:indice; 
		actual: oficinas;
	begin
		for i:=2 to diml do begin
			actual:=v[i];
			j:=i-1;
			while(j>0)and(v[j].codigo > actual.codigo) do
				begin
					v[j+1]:=v[j];
					j:=j-1;
				end;
			v[j+1]:=actual;
	    end;
	end;
procedure OrdenarSeleccion(var v:vector; var diml:indice);
	var
		i,j,pos:indice; item:oficinas;
	begin
		for i:=1 to diml-1 do begin
			pos:=i;
			for j:= i+1 to diml do begin
				if v[j].codigo < v[pos].codigo then begin
					pos:=j;
					end;
			    end;
			item:=v[pos];
			v[pos]:=v[i];
			v[i]:=item;
	    end;
	end;
var
	v:vector; diml:indice;
begin
	diml:=1;
	cargar(v,diml);
	writeln('Vector Cargado');
	OrdenarInsercion(v,diml);
	writeln('Vector ordenado por insercion');
	OrdenarSeleccion(v,diml);
	writeln('Vector ordenado por seleccion');
end.
