/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package del.servlet;

import del.bean.BCrimen;
import del.datasource.BDConnecion;
import del.manager.ManagerCrimen;
import java.io.IOException;
import java.io.PrintWriter;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Hashtable;

import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javazoom.upload.MultipartFormDataRequest;
import javazoom.upload.UploadBean;
import javazoom.upload.UploadException;
import javazoom.upload.UploadFile;

/**
 *
 * @author ruben
 */
public class SRegistrar extends HttpServlet {

    ManagerCrimen managerCrimen = null;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, UploadException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        ServletContext ctx = this.getServletConfig().getServletContext();
        HttpSession sesion = request.getSession();
        BDConnecion conexion = new BDConnecion(ctx);
        //manager adn bean
        managerCrimen = new ManagerCrimen(conexion);

        BCrimen bCrimen = new BCrimen();

        MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);
        mrequest.DEFAULTENCODING = "ISO-8859-1";

        //optener el ultimo valor de delitos           
        String idcrimen = managerCrimen.optener_ultimo() + "c";//
        System.out.println("ultimo: " + idcrimen);

        //captura datos de la apgina web.
        bCrimen.setIdcrimen(idcrimen);
        bCrimen.setTipo(mrequest.getParameter("tipo"));
        bCrimen.setHora(mrequest.getParameter("hora"));
        bCrimen.setDescripcion(mrequest.getParameter("descripcion"));
        bCrimen.setDireccion_ref(mrequest.getParameter("direccion"));

        bCrimen.setLatitud(Double.parseDouble(mrequest.getParameter("latitud")));
        bCrimen.setLongitud(Double.parseDouble(mrequest.getParameter("longitud")));
        bCrimen.setEstado(true);

        //optener id y nombre:
        String idusuario_usuario = mrequest.getParameter("reg_como");
        int posicion = idusuario_usuario.indexOf("-");
        String idusuario = idusuario_usuario.substring(0, posicion);
        String usuario = idusuario_usuario.substring(posicion + 1, idusuario_usuario.length());
        /*System.out.println("idusuario---" + idusuario);
         System.out.println("usuario---" + usuario);*/
        bCrimen.setIdusuario(idusuario);
        bCrimen.setUsuario(usuario);
        bCrimen.setEstado(false);

        //convertir fecha string a timestamp
        String fecha = mrequest.getParameter("fecha");
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        java.util.Date date = sdf.parse(fecha);
        java.sql.Timestamp timest = new java.sql.Timestamp(date.getTime());

        //System.out.println(timest);
        //System.out.println(timest.getTime());
        bCrimen.setFecha(timest.getTime());
        System.out.println(bCrimen.getTipo());
        System.out.println(bCrimen.getFecha());
        System.out.println(bCrimen.getHora());
        System.out.println(bCrimen.getDescripcion());
        System.out.println(bCrimen.getDireccion_ref());
        System.out.println(bCrimen.getIdusuario());
        System.out.println(bCrimen.getIdcrimen());
        System.out.println(bCrimen.getLatitud());
        System.out.println(bCrimen.getLongitud());

        //imagen
        UploadBean upBean;
        //clases for upload images
        upBean = new UploadBean();
        String direccion = request.getSession().getServletContext().getRealPath("crimen_imagenes");
        upBean.setFolderstore(direccion);
        java.text.SimpleDateFormat formato = new java.text.SimpleDateFormat("yyMMddHHmmss");//fecha        
        Hashtable files = mrequest.getFiles();
        String archivo = ((UploadFile) mrequest.getFiles().get("imagen")).getFileName();
        int posicionPunto = archivo.indexOf(".");
        String nombreImagen = archivo.substring(0, posicionPunto);
        nombreImagen = nombreImagen + formato.format(new java.util.Date());
        String extension = archivo.substring(posicionPunto);
        nombreImagen = nombreImagen.replaceAll("\\s", "") + extension;

        ((UploadFile) mrequest.getFiles().get("imagen")).setFileName(nombreImagen);
        UploadFile file = (UploadFile) files.get("imagen");
        upBean.store(mrequest, "imagen");

        bCrimen.setImagen(nombreImagen);

        managerCrimen.registrar(bCrimen);
        response.sendRedirect("admin/confirmacion.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);

        } catch (UploadException ex) {
            Logger.getLogger(SRegistrar.class
                    .getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(SRegistrar.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            try {
                processRequest(request, response);
            } catch (ParseException ex) {
                Logger.getLogger(SRegistrar.class.getName()).log(Level.SEVERE, null, ex);
            }

        } catch (UploadException ex) {
            Logger.getLogger(SRegistrar.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
