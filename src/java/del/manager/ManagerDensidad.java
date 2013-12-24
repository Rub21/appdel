/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package del.manager;

import del.bean.BDensidad;
import del.dao.DAOLogin;
import del.dao.DAODensidad;
import del.datasource.BDConnecion;
import java.sql.Connection;
import java.util.List;

/**
 *
 * @author ruben
 */
public class ManagerDensidad {

    DAODensidad dAODensidad;
    Connection cn = null;

    public ManagerDensidad(BDConnecion connecion) {
        this.cn = connecion.getConnection();
    }

    public List<BDensidad> listadensidad() {
        dAODensidad = new DAODensidad(cn);
        return dAODensidad.listadensidad();
    }

}
