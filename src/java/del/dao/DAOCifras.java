/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package del.dao;

import del.bean.BCifras_por_crimen;
import del.bean.BCrimen;
import del.bean.BCifras_por_mes;
import del.bean.BCifras_totales_crimen;
import del.bean.BCifras_totales_mes;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

/**
 *
 * @author ruben
 */
public class DAOCifras {

    Connection cn = null;//connecion
    PreparedStatement pstmt = null;//pa query
    ResultSet rs = null;///resultados

    public DAOCifras(Connection cn) {
        this.cn = cn;
    }

    public BCifras_por_crimen listarcifras_robo() {

        ArrayList<BCifras_por_mes> list_meses = new ArrayList<BCifras_por_mes>();
        BCifras_por_crimen bCifras = new BCifras_por_crimen();
        //cantidade crimen total de robo
        int cant_total = 0;

        try {
            String sql = "select mes, cantidad from data_robo";

            System.out.println("********" + sql);
            pstmt = cn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {

                BCifras_por_mes bCrimen_Mes = new BCifras_por_mes();

                bCrimen_Mes.setMes(rs.getString("mes"));
                bCrimen_Mes.setCantidad(rs.getInt("cantidad"));

                cant_total = cant_total + bCrimen_Mes.getCantidad();

                list_meses.add(bCrimen_Mes);

            }

            bCifras.setMeses(list_meses);
            bCifras.setInc_total(cant_total);
            bCifras.setTipo("Robo");

            pstmt.close();
            rs.close();
        } catch (SQLException ex) {
            System.out.println("Error : " + ex);
        }
        return bCifras;
    }

    public BCifras_por_crimen listarcifras_agresion() {

        ArrayList<BCifras_por_mes> list_meses = new ArrayList<BCifras_por_mes>();
        BCifras_por_crimen bCifras = new BCifras_por_crimen();
        //cantidade crimen total de robo
        int cant_total = 0;

        try {
            String sql = "select mes, cantidad from data_agresion";

            System.out.println("********" + sql);
            pstmt = cn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {

                BCifras_por_mes bCrimen_Mes = new BCifras_por_mes();

                bCrimen_Mes.setMes(rs.getString("mes"));
                bCrimen_Mes.setCantidad(rs.getInt("cantidad"));

                cant_total = cant_total + bCrimen_Mes.getCantidad();

                list_meses.add(bCrimen_Mes);

            }

            bCifras.setMeses(list_meses);
            bCifras.setInc_total(cant_total);
            bCifras.setTipo("Agresión");

            pstmt.close();
            rs.close();
        } catch (SQLException ex) {
            System.out.println("Error : " + ex);
        }
        return bCifras;
    }

    public BCifras_totales_crimen listarcifras_totales_crimen() {

        //
        BCifras_totales_crimen bCifras_totales = new BCifras_totales_crimen();
        ArrayList<BCifras_por_crimen> list_cifras_crimen = new ArrayList<BCifras_por_crimen>();

        try {
            String sql = "select tipo, count(*) as cantidad  from crimen GROUP BY  tipo ORDER By tipo ASC;";

            System.out.println("********" + sql);
            pstmt = cn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {

                BCifras_por_crimen bCifras_por_crimen = new BCifras_por_crimen();

                bCifras_por_crimen.setInc_total(rs.getInt("cantidad"));
                bCifras_por_crimen.setTipo(rs.getString("tipo"));

                list_cifras_crimen.add(bCifras_por_crimen);

            }

            bCifras_totales.setCifras_crimen(list_cifras_crimen);

            pstmt.close();
            rs.close();
        } catch (SQLException ex) {
            System.out.println("Error : " + ex);
        }
        return bCifras_totales;

    }

    public BCifras_totales_mes listarcifras_totales_mes() {
        //
        BCifras_totales_mes bCifras_totales_mes = new BCifras_totales_mes();

        ArrayList<BCifras_por_mes> list_cifras_mes = new ArrayList<BCifras_por_mes>();

        try {
            String sql = "select substring(to_timestamp(fecha/1000)::text,0,8) as mes , count(*) as cantidad  from crimen GROUP BY  mes ORDER By mes ASC;";

            System.out.println("********" + sql);
            pstmt = cn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {

                BCifras_por_mes bCifras_por_mes = new BCifras_por_mes();

                bCifras_por_mes.setCantidad(rs.getInt("cantidad"));
                bCifras_por_mes.setMes(rs.getString("mes"));

                list_cifras_mes.add(bCifras_por_mes);

            }

            bCifras_totales_mes.setCifras_mes(list_cifras_mes);

            pstmt.close();
            rs.close();
        } catch (SQLException ex) {
            System.out.println("Error : " + ex);
        }
        return bCifras_totales_mes;

    }

}
