/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package acceso;

import arquetipo.Producto;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Erasmo E. Leal
 */
public class agregarProducto extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        double talla, costo, precio;
        talla=costo=precio=0.0;
        String upc,descripcion,marca,tipo,imagen;
        upc=descripcion=marca=tipo=imagen="";
        int cantidad=0;
        if(request.getParameter("upc")!=null){
            upc = request.getParameter("upc");
        }
        if(request.getParameter("descripcion")!=null){
            descripcion = request.getParameter("descripcion");
        }
        if(request.getParameter("marca")!=null){
            marca = request.getParameter("marca");
        }
        if(request.getParameter("talla")!=null){
            talla = Double.parseDouble(request.getParameter("talla"));
        }
        if(request.getParameter("tipo")!=null){
            tipo = request.getParameter("tipo");
        }
        if(request.getParameter("costo")!=null){
            costo = Double.parseDouble(request.getParameter("costo"));
        }
        if(request.getParameter("precio")!=null){
            precio = Double.parseDouble(request.getParameter("precio"));
        }
        if(request.getParameter("cantidad")!=null){
            cantidad = Integer.parseInt(request.getParameter("cantidad"));
        }
        if(request.getParameter("imagen")!=null){
            imagen = request.getParameter("imagen");
        }
        
        Producto producto = new Producto(upc, cantidad, tipo, marca, talla, descripcion, costo,
                                      precio, imagen);//REEMPLAZAR CON VARIABLES
                                                                  //UNA VEZ IMPLEMENTADAS
        
        //CODIGO UTILIZADO PARA PRUEBA, REEMPLAZAR CON LAS REDIRECCIONES APROPIADAS!!!
        String url;
        switch(ProductoBD.agregar(producto)){
            //en caso de insercion
            case 1: url = "/forms/productoActualizado.jsp";//DIRECCION NO INCLUIDA EN EL REPOSITORIO
                break;
            //en caso de actualizacion
            case 2: url = "/forms/productoActualizado.jsp";//DIRECCION NO INCLUIDA EN EL REPOSITORIO
                break;
            //en caso de error
            default: url = "/error.jsp";//DIRECCION NO INCLUIDA EN EL REPOSITORIO
        }
        ServletContext sc=this.getServletContext();
        RequestDispatcher dispatcher=sc.getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(agregarProducto.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(agregarProducto.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(agregarProducto.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(agregarProducto.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
