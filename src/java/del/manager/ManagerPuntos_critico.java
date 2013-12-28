/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package del.manager;

import del.bean.BCrimen;
import del.bean.BPuntos_critico;
import del.dao.DAOCrimen;
import del.dao.DAOPuntos_critico;
import del.datasource.BDConnecion;
import java.sql.Connection;
import java.util.List;

/**
 *
 * @author ruben
 */
public class ManagerPuntos_critico {

    DAOPuntos_critico dAOPuntos_critico;
    BPuntos_critico bPuntos_critico;
    Connection cn = null;

    public ManagerPuntos_critico(BDConnecion connecion) {
        this.cn = connecion.getConnection();
    }

    public int optener_ultimo() {
        dAOPuntos_critico = new DAOPuntos_critico(cn);
        int ultimo;
        ultimo = dAOPuntos_critico.optener_ultimo();
        return ultimo;
    }

    public void registrar(BPuntos_critico bPuntos_critico) {
        dAOPuntos_critico = new DAOPuntos_critico(cn);
        dAOPuntos_critico.registrar(bPuntos_critico);
    }

    public List<BPuntos_critico> listar_puntos_critico() {
        dAOPuntos_critico = new DAOPuntos_critico(cn);
        return dAOPuntos_critico.listar_puntos_critico();
    }


}
