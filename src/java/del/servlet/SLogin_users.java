/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package del.servlet;

import del.bean.BUsuario;
import del.datasource.BDConnecion;
import del.manager.ManagerLogin;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ruben
 */
public class SLogin_users extends HttpServlet {

    ManagerLogin managerLogin = null;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        ServletContext ctx = this.getServletConfig().getServletContext();

        HttpSession sesion = request.getSession();

        BDConnecion conexion = new BDConnecion(ctx);
        managerLogin = new ManagerLogin(conexion);
        try {

            String usuario = request.getParameter("user");
            String password = request.getParameter("password");

            BUsuario bUsuario = new BUsuario();

            bUsuario = managerLogin.autenticar(usuario, password);

            System.out.println("login uausrio");
            System.out.println(bUsuario.isEstado());
            
            if (bUsuario.isEstado()) {

                sesion.setAttribute("usuario", bUsuario.getUsuario());
               sesion.setAttribute("idusuario", bUsuario.getIdusuario());

                response.sendRedirect("admin/registrar.jsp");
            } else {
                sesion.setAttribute("error", "Usuario  y Password Incorectos, vuelva a intentar");
                response.sendRedirect("admin/login_user.jsp");
            }

        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
