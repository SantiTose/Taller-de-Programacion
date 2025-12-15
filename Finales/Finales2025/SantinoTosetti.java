package com.mycompany.finaloctubre;
public class SantinoTosetti {
    public static void main(String[] args) {
        Cliente c1= new Cliente(222,"pepe","Lopez");
        Cliente c2= new Cliente(333,"juan","Rodriguez");
        Cliente c3= new Cliente(444,"ana","Gonzalez");
        Poliza p1 = new Poliza(100, 100, true, 1, 10, 2022, 1, 10, 2025, c1);
        Poliza p2 = new Poliza(200, 200, true, 1, 1, 2022, 1, 1, 2025, c2);
        Poliza p3 = new Poliza(300, 300, true, 1, 10, 2022, 1, 9, 2025, c3);
        Poliza p4 = new Poliza(400, 400, true, 1, 10, 2022, 1, 8, 2025, c1);
        Poliza p5 = new Poliza(500, 500, true, 1, 1, 2022, 1, 10, 2025, c1);
        Seguro s = new Seguro();
        s.agregarPoliza(p1, 1);
        s.agregarPoliza(p2, 3);
        s.agregarPoliza(p3, 2);
        s.agregarPoliza(p4, 0);
        s.agregarPoliza(p5, 1);
        System.out.println(s.infoCliente(222));
        s.aumentarCuotas(1.11, 3);
        System.out.println(s.cantidadAVencer(10, 2025));
        
    }   
    
}
