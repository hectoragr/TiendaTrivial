/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package acceso;

import arquetipo.Producto;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author hectorgomez
 */
public class buscarProducto extends HttpServlet {

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
        String busDes,busMarca,busTipo,busFoto;
        String queryProd="SELECT upc, descripcion,tipo,marca,talla,precio,foto FROM Producto";
        busDes=busMarca=busTipo=busFoto="";
        int busUpc,busCantidad,params;
        busUpc=busCantidad=params=0;
        double busTalla,busCosto,busPrecio;
        busTalla=busCosto=busPrecio=0.0;
        busUpc = Integer.parseInt(request.getParameter("upc"));
        if(busUpc>0){
            if(params<1){
                queryProd+=" WHERE upc="+busUpc;
            }else{
               
            }
            params++;
        }
        busMarca = request.getParameter("marca");
        if(!busMarca.equals("")){
            if(params<1){
                queryProd+=" WHERE marca='"+busMarca+"'";
            }else{
               queryProd+=" AND marca='"+busMarca+"'";
            }
            params++;
        }
        busTalla = Double.parseDouble(request.getParameter("talla"));
        if(busTalla>0.0){
            if(params<1){
                queryProd+=" WHERE talla="+busMarca;
            }else{
               queryProd+=" AND talla="+busMarca;
            }
            params++;
        }
        busTipo = request.getParameter("tipo");
        if(!busTipo.equals("")){
            if(params<1){
                queryProd+=" WHERE marca='"+busTipo+"'";
            }else{
               queryProd+=" AND marca='"+busTipo+"'";
            }
            params++;
        }
        
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
            Logger.getLogger(buscarProducto.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(buscarProducto.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(buscarProducto.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(buscarProducto.class.getName()).log(Level.SEVERE, null, ex);
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
