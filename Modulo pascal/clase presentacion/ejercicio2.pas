{.- El administrador de un edificio de oficinas cuenta, en papel, con la información del pago de 
las expensas de dichas oficinas.  
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos: 
a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De cada oficina 
se ingresa el código de identificación, DNI del propietario y valor de la expensa. La lectura 
finaliza cuando se ingresa el código de identificación -1, el cual no se procesa. 
b. Ordene el vector, aplicando el método de inserción, por código de identificación de la 
oficina. 
c. Ordene el vector aplicando el método de selección, por código de identificación de la oficina.}


program p2p2p2p2p2;

const
	dimF = 300;

type
	indice = 1 .. dimf;
	oficina = record
		codigo:integer;
		dni:integer;
		valor:real;
	end;
	
	vector = array[indice] of oficina;

procedure Generarof(var o:oficina; var sigue:boolean);
var leer:integer; leer2:real;
begin
writeln('Escribe el numero de oficina');
readln(leer);
if (leer <> -1) then begin
o.codigo := leer;
writeln('Ingrese su DNI');
readln(leer);
o.dni:= leer;
writeln('Ingrese el precio de expensa');
readln(leer2);
o.valor:= leer2;
sigue:= true;
end
else begin
sigue:= false;
end;
end;

procedure GenerarVec(var V:vector ; var dimL:integer);

var sigue: boolean;
begin
if(diml<dimf) then begin
diml:=diml+1;
Generarof(v[diml], sigue);
while(sigue= true) and (diml<dimf) do begin
Generarof(v[diml], sigue);
diml:= diml+1;
end;
end;
end;

Procedure insercion ( var v: vector; dimLog: integer );
Var
 i, j: indice; actual: oficina;	
		
begin
 for i:= 2 to dimLog do begin 
     actual:= v[i];
     j:= i-1; 
     while (j > 0) AND (v[j].codigo > actual.codigo) do      
       begin
         v[j+1]:= v[j];
         j:= j - 1;                  
       end;  
     v[j+1]:= actual; 
 end;
end;

var
v:vector; diml:integer;

begin
	randomize;
	diml:= 0;
	GenerarVec(v,diml);
	insercion(v,diml);
	
end.