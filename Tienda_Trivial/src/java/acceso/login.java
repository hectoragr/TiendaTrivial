/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package acceso;

import arquetipo.Usuario;
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
import javax.servlet.http.HttpSession;

/**
 *
 * @author Erasmo E. Leal
 */
public class login extends HttpServlet {

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
        HttpSession session = request.getSession();
        String idusuario = request.getParameter("usuarioLog");
        String password = request.getParameter("passLog");

        Usuario usuario = new Usuario(idusuario, "", "", password, 0, "", 0, 0);
        String url;
        switch (loginBD.entrar(usuario)) {
            case 1:
                url = "/bienvenido.jsp";
                session.setAttribute("idusuario", usuario.getIdusuario());
                session.setAttribute("nombre", usuario.getNombre());
                session.setAttribute("apellido", usuario.getApellido());
                session.setAttribute("nivelacceso", usuario.getNivelacceso());
                session.setAttribute("resetpassword", usuario.getResetpassword());
                session.setAttribute("intentosfallidos",null);
                session.setAttribute("usuariofail", null);
                break;
            case 2:
                url = "/index.jsp";
                session.setAttribute("usuariofail",usuario.getIdusuario());
                session.setAttribute("intentosfallidos",usuario.getIntentosfallidos());
                break;
            case 3:
                url = "/index.jsp";
                session.setAttribute("usuariofail", usuario.getIdusuario());
                session.setAttribute("intentosfallidos",usuario.getIntentosfallidos());
                break;
            default:
                url = "/error.jsp";
        }
        ServletContext sc = this.getServletContext();
        RequestDispatcher dispatcher = sc.getRequestDispatcher(url);
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
            Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
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
