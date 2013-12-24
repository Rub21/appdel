/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package del.dao;

import del.bean.BDensidad;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ruben
 */
public class DAODensidad {

    Connection cn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    public DAODensidad(Connection cn) {
        this.cn = cn;

    }

    public List<BDensidad> listadensidad() {

        ArrayList<BDensidad> list = new ArrayList<BDensidad>();
        try {
            String sql = "select gid,num_nodes(geom) as cantidad from polygon";

            System.out.println("********" + sql);
            pstmt = cn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {

                BDensidad bDensidad = new BDensidad();
                String gid = rs.getString("gid");
                int cantidad = rs.getInt("cantidad");

                bDensidad.setGid(gid);
                bDensidad.setCantidad(cantidad);
                list.add(bDensidad);

            }

            pstmt.close();
            rs.close();
        } catch (SQLException ex) {
            System.out.println("Error : " + ex);
        }
        return list;
    }
}
