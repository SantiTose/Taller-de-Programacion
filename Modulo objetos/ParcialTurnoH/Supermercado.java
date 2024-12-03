package Parciales.ParcialTurnoH;
public class Supermercado {
    private String nombre;
    private int direccion;
    private int g,e;
    private int auxG,auxE;
    private Producto[][] productos;

    public Supermercado(String nombre,int direccion,int g,int e){
        setDireccion(direccion);
        setNombre(nombre);
        setE(e);
        setG(g);
        productos = new Producto[g][e];
        auxG=0;
        auxE=0;
    }
    
    public void AgregarProducto(Producto p){
        if(auxG<g){
            if(auxE<e){
            productos[auxG][auxE]= p;
            System.out.println("Cargue en la pos:"+ auxG+""+auxE);
            auxE++;
        }
        else{   
            auxG++;
            if ((auxE<e)&&(auxG<g)){
            auxE=0;
            productos[auxG][auxE]=p;
            auxE++;
            }
        }}
    }
    
    public String ListarProductos(String M,int Gond){
     String aux="";
     
     for (int i = 0;i<e;i++){
         if ((productos[Gond][i].getMarca()).equals(M)){
             aux+=productos[Gond][i].toString();
         }
     }
     return aux;
    }
    
    public int GondolaMasUnidades(){
        int gon=-1;
        int max=-11;
        int cont=0;
        for(int i =0;i<g;i++){
            cont=0;
            for (int j =0;j<e;j++){
                cont +=productos[i][j].getCantTotal();
            }
            if(cont > max){
                max=cont;
                gon=i;
            }
        }
        return gon;
    }

    @Override
    public String toString() {
        String aux="Supermercado: "+ nombre+" Direccion: "+direccion+
                '\n';
        for (int i =0;i<g;i++){
            aux+="Gondola: "+i+'\n';
            for (int j=0;j<e;j++){
                aux+="Estante: " + productos[i][j].toString()+'\n';
            }
        }
        return aux;
    }
    
    
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getDireccion() {
        return direccion;
    }

    public void setDireccion(int direccion) {
        this.direccion = direccion;
    }

    private int getG() {
        return g;
    }

    private void setG(int g) {
        this.g = g;
    }

    private int getE() {
        return e;
    }

    private void setE(int e) {
        this.e = e;
    }

}
