/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package arquetipo;

/**
 *
 * @author hectorgomez
 */
public class Usuario {
    private String id;
    private String nombre;
    private String apellido;
    private String correo;
    private int tipo;
    private String contrasena;
    
    public Usuario(String id, String nombre, String apellido, String correo, int tipo, String contrasena) {
        this.id=id;
        this.nombre=nombre;
        this.apellido=apellido;
        this.correo=correo;
        this.tipo=tipo;
        this.contrasena=contrasena;
    }
    public String getID(){
        return id;
    }
    public void setID(String id){
        this.id=id;
    }
    public String getNombre(){
        return nombre;
    }
    public void setNombre(String nombre){
        this.nombre=nombre;
    }
    public String getApellido(){
        return apellido;
    }
    public void setApellido(String apellido){
        this.apellido=apellido;
    }
    public String getCorreo(){
        return correo;
    }
    public void setCorreo(String correo){
        this.correo=correo;
    }
    public int getTipo(){
        return tipo;
    }
    public void setTipo(int tipo){
        this.tipo=tipo;
    }
    public String getContrasena(){
        return contrasena;
    }
    public void setContrasena(String contrasena){
        this.contrasena = contrasena;
    }
}
