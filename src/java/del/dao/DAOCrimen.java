package del.dao;

import del.bean.BCrimen;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DAOCrimen {

    Connection cn = null;//connecion
    PreparedStatement pstmt = null;//pa query
    ResultSet rs = null;///resultados

    public DAOCrimen(Connection cn) {
        this.cn = cn;
    }

    public int optener_ultimo() {
        int num = 0;
        try {
            String sql = "select count(*) as num from crimen;";

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

    public void registrar(BCrimen b) {
        try {
            String sql = "select registrar_crimen( '" + b.getIdcrimen() + "', '" + b.getTipo() + "'," + b.getFecha() + ",'" + b.getHora() + "','" + b.getDescripcion() + "', '" + b.getDireccion_ref() + "', '" + b.getImagen() + "'," + b.getLatitud() + "," + b.getLongitud() + "," + b.isEstado() + ",'" + b.getIdusuario() + "','" + b.getUsuario() + "');";
            System.out.println("SQ=======================:" + sql);
            pstmt = cn.prepareStatement(sql);
            pstmt.executeUpdate();
            pstmt.executeQuery();
            cn.commit();
        } catch (SQLException ex) {
            Logger.getLogger(DAOCrimen.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public List listacrimenes() {
        List list = new LinkedList();
        try {
            String sql = "SELECT idcrimen, tipo, fecha, hora, descripcion, direccion_ref, imagen, latitud, longitud, idusuario, usuario, estado FROM seleccionar_crimenes WHERE estado=true;";

            //System.out.println("********" + sql);
            pstmt = cn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {

                BCrimen bCrimen = new BCrimen();

                bCrimen.setIdcrimen(rs.getString("idcrimen"));
                bCrimen.setTipo(rs.getString("tipo"));
                bCrimen.setFecha(rs.getLong("fecha"));
                bCrimen.setHora(rs.getString("hora"));
                bCrimen.setDescripcion(rs.getString("descripcion"));
                bCrimen.setDireccion_ref(rs.getString("direccion_ref"));
                bCrimen.setImagen(rs.getString("imagen"));
                bCrimen.setLatitud(rs.getDouble("latitud"));
                bCrimen.setLongitud(rs.getDouble("longitud"));
                bCrimen.setIdusuario(rs.getString("idusuario"));
                bCrimen.setUsuario(rs.getString("usuario"));
                bCrimen.setEstado(rs.getBoolean("estado"));
                list.add(bCrimen);
            }
            pstmt.close();
            rs.close();
        } catch (SQLException ex) {
            System.out.println("Error : " + ex);
        }
        return list;

    }

    public List listacrimenes_administrar() {
        List list = new LinkedList();
        try {
            String sql = "SELECT idcrimen, tipo, fecha, hora, descripcion, direccion_ref, imagen, latitud, longitud, idusuario, usuario, estado FROM seleccionar_crimenes WHERE estado=false;";

            //System.out.println("********" + sql);
            pstmt = cn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {

                BCrimen bCrimen = new BCrimen();
                bCrimen.setIdcrimen(rs.getString("idcrimen"));
                bCrimen.setTipo(rs.getString("tipo"));
                bCrimen.setFecha(rs.getLong("fecha"));
                bCrimen.setHora(rs.getString("hora"));
                bCrimen.setDescripcion(rs.getString("descripcion"));
                bCrimen.setDireccion_ref(rs.getString("direccion_ref"));
                bCrimen.setImagen(rs.getString("imagen"));
                bCrimen.setLatitud(rs.getDouble("latitud"));
                bCrimen.setLongitud(rs.getDouble("longitud"));
                bCrimen.setIdusuario(rs.getString("idusuario"));
                bCrimen.setUsuario(rs.getString("usuario"));
                bCrimen.setEstado(rs.getBoolean("estado"));
                list.add(bCrimen);
            }
            pstmt.close();
            rs.close();
        } catch (SQLException ex) {
            System.out.println("Error : " + ex);
        }
        return list;
    }

    public void actualizar_crimen(String id_crimen) {

        try {
            String sql = "UPDATE crimen SET estado=true WHERE idcrimen='" + id_crimen + "';";
            System.out.println("SQL" + sql);
            pstmt = cn.prepareStatement(sql);
            pstmt.executeUpdate();
            // pstmt.executeQuery();
            // conn.commit();
        } catch (SQLException ex) {
        }

    }

}
