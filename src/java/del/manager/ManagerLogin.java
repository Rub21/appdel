/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package del.manager;

import del.bean.BUsuario;
import java.sql.Connection;
import del.dao.DAOLogin;
import del.datasource.BDConnecion;

/**
 *
 * @author ruben
 */
public class ManagerLogin {

    DAOLogin dAOLogin;
    Connection cn = null;

    public ManagerLogin(BDConnecion connecion) {
        this.cn = connecion.getConnection();
    }

    public BUsuario autenticar(String usuario, String password) {
        dAOLogin = new DAOLogin(cn);
        return dAOLogin.autenticar(usuario, password);
    }
}
