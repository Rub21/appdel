/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package del.manager;

import del.bean.BCrimen;
import del.bean.BPuntos_vigilancia;
import del.dao.DAOCrimen;
import del.dao.DAOPuntos_vigilancia;
import del.datasource.BDConnecion;
import java.sql.Connection;
import java.util.List;

/**
 *
 * @author ruben
 */
public class ManagerPuntos_vigilancia {

    DAOPuntos_vigilancia dAOPuntos_vigilancia;
    BPuntos_vigilancia bPuntos_vigilancia;
    Connection cn = null;

    public ManagerPuntos_vigilancia(BDConnecion connecion) {
        this.cn = connecion.getConnection();
    }

    public int optener_ultimo() {
        dAOPuntos_vigilancia = new DAOPuntos_vigilancia(cn);
        int ultimo;
        ultimo = dAOPuntos_vigilancia.optener_ultimo();
        return ultimo;
    }

    public void registrar(BPuntos_vigilancia bPuntos_vigilancia) {
        dAOPuntos_vigilancia = new DAOPuntos_vigilancia(cn);
        dAOPuntos_vigilancia.registrar(bPuntos_vigilancia);
    }

    public List<BPuntos_vigilancia> listar_puntos_vigilancia() {
        dAOPuntos_vigilancia = new DAOPuntos_vigilancia(cn);
        return dAOPuntos_vigilancia.listar_puntos_vigilancia();
    }


}
