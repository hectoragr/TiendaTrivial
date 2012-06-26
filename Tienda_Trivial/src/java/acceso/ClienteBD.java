/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package acceso;

import arquetipo.Cliente;
import java.sql.*;

/**
 *
 * @author Erasmo E. Leal
 */
public class ClienteBD {
    /*
     * El metodo "agregar" regresa: 1 si se agrega un cliente nuevo, 3 si se genera un error
     */

    public static int agregar(Cliente cliente) throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");

        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/tiendatrivial", "root", "");
        Statement stmt = con.createStatement();
        String nombre = cliente.getNombre();
        String apellido = cliente.getApellido();
        String sexo = cliente.getSexo();
        int dia = cliente.getDia();
        int mes = cliente.getMes();
        int ano = cliente.getAno();
        String correo = cliente.getCorreo();
        String direccion = cliente.getDireccion();
        String colonia = cliente.getColonia();
        String cp = cliente.getCp();
        String ciudad = cliente.getCiudad();
        String estado = cliente.getEstado();
        String telefono = cliente.getTelefono();
        String celular = cliente.getCelular();
        ResultSet resultado;
        String parametros = "SELECT MAX(idcliente) AS maximo FROM Cliente";
        resultado = stmt.executeQuery(parametros);

        if (resultado.next()) {
            int idcliente = resultado.getInt("maximo");
            //int i = Integer.parseInt(idcliente);
            int siguienteid = idcliente++; //PLACEHOLDER "2"!!!
            String paraminsrt = "INSERT INTO Cliente VALUES ('" + 2 + "', '" + nombre + "', '" + apellido
                    + "', '" + sexo + "', '" + ano + "-" + mes + "-" + dia + "', '" + correo + "', '" + direccion + "', '" + colonia
                    + "', '" + cp + "', '" + ciudad + "', '" + estado + "', '" + telefono + "', '" + celular + "')";
            //executeUpdate regresa el numero de renglones afectados por el query, el cual deberia ser 1
            return stmt.executeUpdate(paraminsrt);
        }

        return 2;//occurio un error
    }
}
