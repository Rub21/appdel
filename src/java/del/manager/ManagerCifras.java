/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package del.manager;

import del.bean.BCifras_por_crimen;
import del.bean.BCifras_totales_crimen;
import del.bean.BCifras_totales_mes;
import del.dao.DAOCifras;
import del.datasource.BDConnecion;
import java.sql.Connection;

/**
 *
 * @author ruben
 */
public class ManagerCifras {

    DAOCifras dAOCifras;
    BCifras_por_crimen bCifras;
    Connection cn = null;

    public ManagerCifras(BDConnecion connecion) {
        this.cn = connecion.getConnection();
    }

    public BCifras_por_crimen listarcifras_robo() {
        dAOCifras = new DAOCifras(cn);
        return dAOCifras.listarcifras_robo();
    }

    public BCifras_totales_crimen listarcifras_totales_crimen() {
        dAOCifras = new DAOCifras(cn);
        return dAOCifras.listarcifras_totales_crimen();
    }

    public BCifras_totales_mes listarcifras_totales_mes() {
        dAOCifras = new DAOCifras(cn);
        return dAOCifras.listarcifras_totales_mes();
    }
}
