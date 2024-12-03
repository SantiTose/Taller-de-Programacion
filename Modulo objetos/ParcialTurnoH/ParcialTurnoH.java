package Parciales.ParcialTurnoH;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class ParcialTurnoH {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        int g=5;
        int e=9;
        Supermercado sup=new Supermercado("Pepito's Super", 1232, g,e);
        int i = 0;
        String M = "";   
        int tot=e*g;
        Producto p;
        while(tot!=0){
            String marca =GeneradorAleatorio.generarString(10);
            p=new Producto(i++,GeneradorAleatorio.generarString(10), 
                marca, 
                GeneradorAleatorio.generarInt(30), 
                GeneradorAleatorio.generarDouble(40000));
            sup.AgregarProducto(p);
            if (i == 10){
                M = marca;
            }
            tot--;
        }
        System.out.println("Productos con marca: "+ M + " en la "
                + "gondola 3 son: " + sup.ListarProductos(M, 2));
        
        System.out.println(sup.GondolaMasUnidades());
        System.out.println(sup.toString());
    }
    
}
