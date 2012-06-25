/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package acceso;

import arquetipo.Producto;
import java.sql.*;

/**
 *
 * @author Erasmo E. Leal
 */
public class ProductoBD {
    /*
     * El metodo "agregar" regresa: 1 si se agrega un producto nuevo, 2 si se
     * agrega un producto existente (se agrega la cantidad puesta a la ya
     * existente y se actualizan el costo y precio), 3 si se genera un error
     */

    public static int agregar(Producto producto) throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");

        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/tiendatrivial", "root", "");
        Statement stmt = con.createStatement();
        int upc = producto.getUpc();
        String descripcion = producto.getDescripcion();
        String marca = producto.getMarca();
        double talla = producto.getTalla();
        String tipo = producto.getTipo();
        double costo = producto.getCosto();
        double precio = producto.getPrecio();
        int cantidad = producto.getCantidad();
        String foto = producto.getFoto();
        ResultSet resultado;
        String parametros = "SELECT costo, precio, cantidad FROM Producto WHERE upc='"
                + upc + "'";
        resultado = stmt.executeQuery(parametros);

        if (resultado.next()) {
            cantidad += resultado.getInt("cantidad");
            String paramact = "UPDATE Producto SET costo=" + costo + ", precio="
                    + precio + ", cantidad=" + cantidad + " WHERE upc='" + upc + "'";
            //executeUpdate regresa el numero de renglones afectados por el query, el cual deberia ser 1
            int actualizar = stmt.executeUpdate(paramact);
            if (actualizar == 1) {
                return 2; //se hizo una actualizacion
            }

        } else {
            String paraminsrt = "INSERT INTO Producto VALUES ('" + upc + "', '" + descripcion + "', '" + marca
                    + "', '" + talla + "', '" + tipo + "', " + costo + ", " + precio + ", " + cantidad
                    + ", '" + foto + "')";
            //executeUpdate regresa el numero de renglones afectados por el query, el cual deberia ser 1
            int insertar = stmt.executeUpdate(paraminsrt);
            if (insertar == 1) {
                return 1; //se hizo una insercion
            }
        }
        return 3;//occurio un error
    }
}
