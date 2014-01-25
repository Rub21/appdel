/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package del.bean;

/**
 *
 * @author ruben
 */
public class BUsuario {

    String idusuario;
    String nombre;
    String apellidos;
    String Correo;
    String usuario;
    String contrasenia;
    boolean estado;
    String rol;
    int num_ent;

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

    
    public String getIdusuario() {
        return idusuario;
    }

    public void setIdusuario(String idusuario) {
        this.idusuario = idusuario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCorreo() {
        return Correo;
    }

    public void setCorreo(String Correo) {
        this.Correo = Correo;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getContrasenia() {
        return contrasenia;
    }

    public void setContrasenia(String contrasenia) {
        this.contrasenia = contrasenia;
    }

    public boolean isEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

  

    public int getNum_ent() {
        return num_ent;
    }

    public void setNum_ent(int num_ent) {
        this.num_ent = num_ent;
    }

}
