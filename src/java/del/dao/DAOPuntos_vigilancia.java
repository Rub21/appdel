/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package del.dao;

import del.bean.BCrimen;
import del.bean.BPuntos_vigilancia;
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
public class DAOPuntos_vigilancia {

    Connection cn = null;//connecion
    PreparedStatement pstmt = null;//pa query
    ResultSet rs = null;///resultados

    public DAOPuntos_vigilancia(Connection cn) {
        this.cn = cn;
    }

    public int optener_ultimo() {
        int num = 0;
        try {
            String sql = "SELECT count(*) as num  FROM puntos_vigilancia;";

            System.out.println("==========SQL crimen= : " + sql);
            pstmt = cn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                num = rs.getInt("num");
            }

            pstmt.close();
            rs.close();
        } catch (SQLException ex) {
            System.out.println("Error en optener posicion de crimen : " + ex);
        }
        return num + 1;

    }

    public void registrar(BPuntos_vigilancia b) {

        try {
            String sql = "select registrar_puntos_vigilancia( '" + b.getIdpv() + "', '" + b.getTipo() + "','" + b.getDescripcion() + "', '" + b.getDireccion_ref() + "'," + b.getLatitud() + "," + b.getLongitud() + "," + b.isEstado() + ",'" + b.getIdusuario() + "','" + b.getUsuario() + "');";
            System.out.println("SQ=======================:" + sql);
            pstmt = cn.prepareStatement(sql);
            pstmt.executeUpdate();
            pstmt.executeQuery();
            cn.commit();
        } catch (SQLException ex) {
            Logger.getLogger(DAOCrimen.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public List<BPuntos_vigilancia> listar_puntos_vigilancia() {

        List list = new LinkedList();
        try {
            String sql = "SELECT idpv, tipo, descripcion, direccion_ref, latitud, longitud, estado,idusuario, usuario FROM seleccionar_puntos_vigilancia;";

            System.out.println("********" + sql);
            pstmt = cn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {

                BPuntos_vigilancia bPuntos_vigilancia = new BPuntos_vigilancia();

                bPuntos_vigilancia.setIdpv(rs.getString("idpv"));
                bPuntos_vigilancia.setTipo(rs.getString("tipo"));
                bPuntos_vigilancia.setDescripcion(rs.getString("descripcion"));
                bPuntos_vigilancia.setDireccion_ref(rs.getString("direccion_ref"));
                bPuntos_vigilancia.setLatitud(rs.getDouble("latitud"));
                bPuntos_vigilancia.setLongitud(rs.getDouble("longitud"));
                bPuntos_vigilancia.setIdusuario(rs.getString("idusuario"));
                bPuntos_vigilancia.setUsuario(rs.getString("usuario"));

                list.add(bPuntos_vigilancia);
            }
            pstmt.close();
            rs.close();
        } catch (SQLException ex) {
            System.out.println("Error : " + ex);
        }
        return list;

    }

}
