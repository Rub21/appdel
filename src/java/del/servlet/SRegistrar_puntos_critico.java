/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package del.servlet;

import del.bean.BCrimen;
import del.bean.BPuntos_critico;
import del.datasource.BDConnecion;
import del.manager.ManagerCrimen;
import del.manager.ManagerPuntos_critico;
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
public class SRegistrar_puntos_critico extends HttpServlet {

    ManagerPuntos_critico managerPuntos_critico = null;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        ServletContext ctx = this.getServletConfig().getServletContext();
        HttpSession sesion = request.getSession();
        BDConnecion conexion = new BDConnecion(ctx);
        //manager adn bean
        managerPuntos_critico = new ManagerPuntos_critico(conexion);

        //optener el ultimo valor de delitos           
        String idpv = managerPuntos_critico.optener_ultimo() + "pv";//
        System.out.println("ultimo: " + idpv);

        BPuntos_critico bPuntos_critico = new BPuntos_critico();

                        //optener id y nombre:
        /*
         String idusuario_usuario = request.getParameter("idusuario_usuario");
         int posicion = idusuario_usuario.indexOf("-");
         String idusuario = idusuario_usuario.substring(0, posicion);
         String usuario = idusuario_usuario.substring(posicion + 1, idusuario_usuario.length());
         /*System.out.println("idusuario---" + idusuario);
         System.out.println("usuario---" + usuario);*/
        bPuntos_critico.setIdusuario(sesion.getAttribute("idusuario").toString()+"");
        bPuntos_critico.setUsuario(sesion.getAttribute("usuario").toString()+"");

        System.out.println(bPuntos_critico.getIdusuario());
        System.out.println(bPuntos_critico.getUsuario());

        bPuntos_critico.setIdpc(idpv);
        bPuntos_critico.setTipo(request.getParameter("tipo"));
        bPuntos_critico.setDescripcion(request.getParameter("descripcion"));
        bPuntos_critico.setDireccion_ref(request.getParameter("direccion"));
        bPuntos_critico.setLatitud(Double.parseDouble(request.getParameter("latitud")));
        bPuntos_critico.setLongitud(Double.parseDouble(request.getParameter("longitud")));
        bPuntos_critico.setEstado(true);

        managerPuntos_critico.registrar(bPuntos_critico);
        response.sendRedirect("admin/confirmacion.jsp");
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
