/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package arquetipo;

/**
 *
 * @author Erasmo E. Leal
 */
public class Usuario {
    private String idusuario;
    private String nombre;
    private String apellido;
    private String password;
    private int nivelacceso;
    private String correo;
    private int intentosfallidos;
    private int resetpassword;

    public Usuario(String idusuario, String nombre, String apellido, String password, int nivelacceso, String correo, int intentosfallidos, int resetpassword) {
        this.idusuario = idusuario;
        this.nombre = nombre;
        this.apellido = apellido;
        this.password = password;
        this.nivelacceso = nivelacceso;
        this.correo = correo;
        this.intentosfallidos = intentosfallidos;
        this.resetpassword = resetpassword;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getIdusuario() {
        return idusuario;
    }

    public void setIdusuario(String idusuario) {
        this.idusuario = idusuario;
    }

    public int getIntentosfallidos() {
        return intentosfallidos;
    }

    public void setIntentosfallidos(int intentosfallidos) {
        this.intentosfallidos = intentosfallidos;
    }

    public int getNivelacceso() {
        return nivelacceso;
    }

    public void setNivelacceso(int nivelacceso) {
        this.nivelacceso = nivelacceso;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getResetpassword() {
        return resetpassword;
    }

    public void setResetpassword(int resetpassword) {
        this.resetpassword = resetpassword;
    }
    
    
}
