/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package del.dao;

import del.bean.BUsuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ruben
 */
public class DAONuevoUsuario {

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    public DAONuevoUsuario(Connection conn) {
        this.conn = conn;

    }

    public int optener_ultimo() {
        int num = 0;
        try {
            String sql = "SELECT count(*) as num  FROM usuario;";

            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                num = rs.getInt("num");
            }

            pstmt.close();
            rs.close();
        } catch (SQLException ex) {
            System.out.println("Error en optener posicion  : " + ex);
        }
        return num + 1;

    }

    public boolean registrar(BUsuario bUsuario) {
        boolean verificacor = false;
        try {
            String sql = "INSERT INTO usuario(idusuario, nombre, apellidos, usuario, contrasenia, estado,rol, correo)\n"
                    + "VALUES ('" + bUsuario.getIdusuario() + "', '" + bUsuario.getNombre() + "', '" + bUsuario.getApellidos() + "', '" + bUsuario.getUsuario() + "', '" + bUsuario.getContrasenia() + "'," + bUsuario.isEstado() + ",'" + bUsuario.getRol() + "', '" + bUsuario.getCorreo() + "');";
            System.out.println("SQ=======================:" + sql);
            pstmt = conn.prepareStatement(sql);
            pstmt.executeUpdate();
            
            conn.commit();
            verificacor = true;
        } catch (SQLException ex) {
            Logger.getLogger(DAOCrimen.class.getName()).log(Level.SEVERE, null, ex);

        }
        return true;

    }
}
