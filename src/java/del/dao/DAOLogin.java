/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package del.dao;

import del.bean.BUsuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author ruben
 */
public class DAOLogin {
    
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    
    public DAOLogin(Connection conn) {
        this.conn = conn;
        
    }
    
    public BUsuario autenticar(String usuario, String password) {
        boolean banndera = false;
        BUsuario bUsuario = new BUsuario();
        try {
            
            String sql = "SELECT  contrasenia, idusuario FROM usuario where usuario='" + usuario + "';";
            
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                
                bUsuario.setUsuario(usuario);
                String contrasenia = rs.getString("contrasenia");
                if (contrasenia.equals(password)) {
                    bUsuario.setIdusuario(rs.getString("idusuario"));
                    banndera = true;
                    bUsuario.setEstado(banndera);
                    
                }
                
            }
            
            pstmt.close();
            rs.close();
        } catch (SQLException ex) {
            System.out.println("Error en en User: " + ex);
        }
        return bUsuario;
    }
}
