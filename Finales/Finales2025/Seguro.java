
package com.mycompany.finaloctubre;

public class Seguro {
    
    private int[] cantidadPolizas;
    private Poliza[][] polizasDeRubros;

    public Seguro(){
        cantidadPolizas = new int[10];
        polizasDeRubros = new Poliza[10][200];
    }
    
    public void agregarPoliza(Poliza unaPoliza, int unRubro){
        if(cantidadPolizas[unRubro] < 200){
            polizasDeRubros[unRubro][cantidadPolizas[unRubro]] = unaPoliza;
            cantidadPolizas[unRubro]++;
        }
    }
  
    public String infoCliente(int unDNI){
        String res = "Informacion de las polizas del cliente con dni: "+ unDNI + '\n';
        int cantidadDeRubros = cantidadPolizas.length;
        for (int i = 0; i<cantidadDeRubros; i++){
            for(int j = 0; j< cantidadPolizas[i]; j++){
                if(polizasDeRubros[i][j].getCliente().getDni() == unDNI){
                    res+=polizasDeRubros[i][j].toString() + '\n';
                }
            }
        }
        return res;
    }
    
    public void aumentarCuotas(double unPorcentaje, int unRubro){
        for(int i = 0; i<cantidadPolizas[unRubro];i++){
            if(polizasDeRubros[unRubro][i].isVigente()){
                polizasDeRubros[unRubro][i].setMontoCuota(polizasDeRubros[unRubro][i].getMontoCuota() * unPorcentaje);
            }
        }
    }
    
    public int cantidadAVencer(int mes, int anio){
        int cantidad = 0;
        int cantidadDeRubros = cantidadPolizas.length;
        for (int i = 0; i<cantidadDeRubros; i++){
            for(int j = 0; j < cantidadPolizas[i]; j++){
                if(polizasDeRubros[i][j].getAnioFi() == anio){
                    if(polizasDeRubros[i][j].getMesFi() == mes){
                        cantidad++;
                    }
                }
            }
        }
        return cantidad;
    }
    
}