/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package del.dao;

import del.bean.BCrimen;
import del.bean.BPuntos_critico;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ruben
 */
public class DAOPuntos_critico {

    Connection cn = null;//connecion
    PreparedStatement pstmt = null;//pa query
    ResultSet rs = null;///resultados

    public DAOPuntos_critico(Connection cn) {
        this.cn = cn;
    }

    public int optener_ultimo() {
        int num = 0;
        try {
            String sql = "SELECT count(*) as num  FROM puntos_critico;";

            System.out.println("==========SQL:" + sql);
            pstmt = cn.prepareStatement(sql);
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

    public void registrar(BPuntos_critico b) {

        try {
            String sql = "select registrar_puntos_critico( '" + b.getIdpc() + "', '" + b.getTipo() + "','" + b.getDescripcion() + "', '" + b.getDireccion_ref() + "'," + b.getLatitud() + "," + b.getLongitud() + "," + b.isEstado() + ",'" + b.getIdusuario() + "','" + b.getUsuario() + "');";
            System.out.println("SQ=======================:" + sql);
            pstmt = cn.prepareStatement(sql);
            pstmt.executeUpdate();
            pstmt.executeQuery();
            cn.commit();
        } catch (SQLException ex) {
            Logger.getLogger(DAOCrimen.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public List<BPuntos_critico> listar_puntos_critico() {

        List list = new LinkedList();
        try {
            String sql = "SELECT idpc, tipo, descripcion, direccion_ref, latitud, longitud, estado,idusuario, usuario FROM seleccionar_puntos_critico;";

            System.out.println("********" + sql);
            pstmt = cn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {

                BPuntos_critico bPuntos_critico = new BPuntos_critico();

                bPuntos_critico.setIdpc(rs.getString("idpc"));
                bPuntos_critico.setTipo(rs.getString("tipo"));
                bPuntos_critico.setDescripcion(rs.getString("descripcion"));
                bPuntos_critico.setDireccion_ref(rs.getString("direccion_ref"));
                bPuntos_critico.setLatitud(rs.getDouble("latitud"));
                bPuntos_critico.setLongitud(rs.getDouble("longitud"));
                bPuntos_critico.setIdusuario(rs.getString("idusuario"));
                bPuntos_critico.setUsuario(rs.getString("usuario"));

                list.add(bPuntos_critico);
            }
            pstmt.close();
            rs.close();
        } catch (SQLException ex) {
            System.out.println("Error : " + ex);
        }
        return list;

    }

}
