/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package acceso;

import arquetipo.Usuario;
import java.sql.*;

/**
 *
 * @author hectorgomez
 */
public class UsuarioBD {

    static int agregar(Usuario usuario) throws ClassNotFoundException, SQLException{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8889/tiendatrivial", "root", "root");
        Statement stmt = con.createStatement();
        String id = usuario.getIdusuario();
        String nombre = usuario.getNombre();
        String apellido = usuario.getApellido();
        String correo = usuario.getCorreo();
        int tipo = usuario.getNivelacceso();
        String contrasena = usuario.getPassword();
        ResultSet resultado;
        String parametros = "SELECT * FROM Usuario WHERE idusuario = '"+id+"' ";
        resultado = stmt.executeQuery(parametros);
        if (!resultado.next()) {
            String paraminsrt = "INSERT INTO Usuario VALUES ('" + id + "', '" + nombre + "', '" + apellido
                    + "', '" + contrasena + "', '" + tipo + "', '" + correo + "', '" + 0 + "', '"+ true + "')";
            //executeUpdate regresa el numero de renglones afectados por el query, el cual deberia ser 1
            return stmt.executeUpdate(paraminsrt);
        }

        return 2;//occurio un error
    }
    
}
