package Parciales.ParcialTurnoH;
public class Producto {
    private int codigo;
    private String nombre;
    private String marca;
    private int cantTotal;
    private double precio;
    
    public Producto(int codigo,String nombre,String marca,
            int cantTotal,double precio){
        setCodigo(codigo);
        setNombre(nombre);
        setMarca(marca);
        setCantTotal(cantTotal);
        setPrecio(precio);
    }

    @Override
    public String toString() {
        return "Producto{" + "codigo=" + codigo + ", nombre=" + nombre + ", marca=" + marca + ", cantTotal=" + cantTotal + ", precio=" + precio + '}';
    }
    
    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public int getCantTotal() {
        return cantTotal;
    }

    public void setCantTotal(int cantTotal) {
        this.cantTotal = cantTotal;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }
}
