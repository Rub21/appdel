/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package del.manager;

import del.bean.BUsuario;
import del.dao.DAONuevoUsuario;
import del.datasource.BDConnecion;
import java.sql.Connection;

/**
 *
 * @author ruben
 */
public class ManagerNuevoUsuario {

    DAONuevoUsuario dAONuevoUsuario;
    BUsuario bUsuario;
    Connection cn = null;

    public ManagerNuevoUsuario(BDConnecion connecion) {
        this.cn = connecion.getConnection();
    }

    public int optener_ultimo() {
        dAONuevoUsuario = new DAONuevoUsuario(cn);
        int ultimo;
        ultimo = dAONuevoUsuario.optener_ultimo();
        return ultimo;
    }

    public boolean registrar(BUsuario bUsuario) {
        dAONuevoUsuario = new DAONuevoUsuario(cn);
        return dAONuevoUsuario.registrar(bUsuario);
    }

}
