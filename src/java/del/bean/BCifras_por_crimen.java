/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package del.bean;

import java.util.ArrayList;

/**
 *
 * @author ruben
 */
public class BCifras_por_crimen {

    /*String robo;
     String agresion;
     String homicidio;
     String secuestro;
     String accidente;
     String violencia_familiar;
     String otros_incidentes;*/
    private String tipo;
    private int inc_total;
    private ArrayList<BCifras_por_mes> meses;

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public int getInc_total() {
        return inc_total;
    }

    public void setInc_total(int inc_total) {
        this.inc_total = inc_total;
    }

    public ArrayList<BCifras_por_mes> getMeses() {
        return meses;
    }

    public void setMeses(ArrayList<BCifras_por_mes> meses) {
        this.meses = meses;
    }


}
