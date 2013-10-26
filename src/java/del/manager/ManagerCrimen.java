/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package del.manager;

import del.bean.BCrimen;
import del.dao.DAOCrimen;
import del.datasource.BDConnecion;
import java.sql.Connection;
import java.util.List;



/**
 *
 * @author ruben
 */
public class ManagerCrimen {

    DAOCrimen dAOCrimen;
    BCrimen bHotel;
    Connection cn = null;

    public ManagerCrimen(BDConnecion connecion) {
        this.cn = connecion.getConnection();
    }

    public int optener_ultimo() {
        dAOCrimen = new DAOCrimen(cn);
        int ultimo_crimen;
        ultimo_crimen=dAOCrimen.optener_ultimo();
        return ultimo_crimen;
    }

    public void registrar(BCrimen bCrimen) {
        dAOCrimen = new DAOCrimen(cn);
        dAOCrimen.registrar(bCrimen);
    }

    public List listacrimenes() {
        System.out.println("rrrrrrrrrrrr");
        dAOCrimen = new DAOCrimen(cn);
        return dAOCrimen.listacrimenes(); 
    }
    

}
