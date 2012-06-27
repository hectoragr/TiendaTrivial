/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package arquetipo;

/**
 *
 * @author Erasmo E. Leal
 */
public class Producto {

    private String upc;
    private String descripcion;
    private String marca;
    private double talla;
    private String tipo;
    private double costo;
    private double precio;
    private int cantidad;
    private String foto;

    public Producto(String upc, int cantidad, String tipo, String marca, double talla, String descripcion,  double costo, double precio, String foto) {
        this.upc = upc;
        this.descripcion = descripcion;
        this.marca = marca;
        this.talla = talla;
        this.tipo = tipo;
        this.costo = costo;
        this.precio = precio;
        this.cantidad = cantidad;
        this.foto = foto;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public double getCosto() {
        return costo;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public double getTalla() {
        return talla;
    }

    public void setTalla(double talla) {
        this.talla = talla;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getUpc() {
        return upc;
    }

    public void setUpc(String upc) {
        this.upc = upc;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }
    
    
}
