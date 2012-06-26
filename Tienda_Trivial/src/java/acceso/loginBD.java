/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package acceso;

import arquetipo.Usuario;
import java.sql.*;

/**
 *
 * @author Erasmo E. Leal
 */
public class loginBD {
    /*
     * El metodo entrar regresa: 
     * 1 si el login fue exitoso 
     * 2 si el usuario es correcto, pero la contrasena es incorrecta (se le agrega un "strike" a la
     * cuenta) 
     * 3 si el usuario esta bloqueado 
     * 4 si el usuario no existe 
     * 5 si ocurre un error
     */

    public static int entrar(Usuario usuario) throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");

        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/tiendatrivial", "root", "");
        Statement stmt = con.createStatement();
        String idusuario = usuario.getIdusuario();
        String password = usuario.getPassword();
        String parametros = "SELECT * FROM Usuario WHERE idusuario='" + idusuario + "'";
        ResultSet resultado = stmt.executeQuery(parametros);

        if (resultado.next()) {
            String storedpass = resultado.getString("password");
            int intentosfallidos = resultado.getInt("intentosfallidos");
            if (intentosfallidos == 3) {
                return 3; //login unsuccessful, user is blocked
            }
            if (password.equals(storedpass)) {
                String updateparams = "UPDATE Usuario SET intentosfallidos=0 WHERE idusuario='" + idusuario + "'";
                if (stmt.executeUpdate(updateparams) == 1) {
                    return 1; //login successful, strikes reset to 0
                } else {
                    return 5; //error
                }
            } else {
                intentosfallidos += 1;
                String updateparams = "UPDATE Usuario SET intentosfallidos=" + intentosfallidos
                        + " WHERE idusuario='" + idusuario + "'";
                if (stmt.executeUpdate(updateparams) == 1) {
                    if (intentosfallidos == 3) {
                        return 3; //login unsuccessful (wrong password), user blocked
                    }
                    return 2; //login unsuccessful (wrong password), strike added to user
                } else {
                    return 5; //error
                }
            }

        }
        return 4; //login unsuccessful (user doesn't exist)

    }
}
