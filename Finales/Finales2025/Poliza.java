package com.mycompany.finaloctubre;
public class Poliza {
    private double montoAsegurado;
    private double montoCuota;
    private boolean vigente;
    private int diaIn;
    private int mesIn;
    private int anioIn;
    private int diaFi;
    private int mesFi;
    private int anioFi;
    private Cliente cliente;
    
    public Poliza(double montoA, double montoC, boolean vig, int diaIn, int mesIn,int anioIn, int diaFi,
            int mesFi, int anioFi, Cliente c){
        this.montoAsegurado = montoA;
        this.montoCuota = montoC;
        this.vigente = vig;
        this.diaIn = diaIn;
        this.mesIn = mesIn;
        this.anioIn = anioIn;
        this.diaFi= diaFi;
        this.mesFi = mesFi;
        this.anioFi = anioFi;
        this.cliente = c;
    }

    public int getDiaIn() {
        return diaIn;
    }

    public int getMesIn() {
        return mesIn;
    }

    public int getAnioIn() {
        return anioIn;
    }

    public int getDiaFi() {
        return diaFi;
    }

    public int getMesFi() {
        return mesFi;
    }

    public int getAnioFi() {
        return anioFi;
    }

    public double getMontoAsegurado() {
        return montoAsegurado;
    }

    public double getMontoCuota() {
        return montoCuota;
    }

    public void setMontoCuota(double montoCuota) {
        this.montoCuota = montoCuota;
    }

    public boolean isVigente() {
        return vigente;
    }

    public void setVigente(boolean vigente) {
        this.vigente = vigente;
    }

    public Cliente getCliente() {
        return cliente;
    }

    @Override
    public String toString() {
        return "Poliza{" + "montoAsegurado=" + montoAsegurado + ", montoCuota=" + montoCuota + ", vigente=" + vigente + ", diaIn=" + diaIn + ", mesIn=" + mesIn + ", anioIn=" + anioIn + ", diaFi=" + diaFi + ", mesFi=" + mesFi + ", anioFi=" + anioFi + ", cliente=" + cliente + '}';
    }
    
    
    
    
}
