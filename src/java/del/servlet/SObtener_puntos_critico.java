/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package del.servlet;

import com.google.gson.Gson;
import del.bean.BPuntos_critico;
import del.datasource.BDConnecion;
import del.manager.ManagerPuntos_critico;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ruben
 */
public class SObtener_puntos_critico extends HttpServlet {

    ManagerPuntos_critico managerPuntos_critico = null;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        ServletContext ctx = this.getServletConfig().getServletContext();
        BDConnecion conexion = new BDConnecion(ctx);
        managerPuntos_critico = new ManagerPuntos_critico(conexion);

        List<BPuntos_critico> list = new LinkedList<BPuntos_critico>();
        try {
            list = managerPuntos_critico.listar_puntos_critico();

            String json = new Gson().toJson(list);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
         response.getWriter().write("var puntos_criticos =" + json);

           // response.getWriter().write(json);
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
