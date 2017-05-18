/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.gov.mec.estructura.programa;

import py.gov.mec.estructura.tipo.Tipo;



/**
 *
 * @author hugo
 */
public class Programa {
            
    private Integer id;    
    private Tipo tp;
    private Integer pg;
    private String descripcion;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }



    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Tipo getTp() {
        return tp;
    }

    public void setTp(Tipo tp) {
        this.tp = tp;
    }

    public Integer getPg() {
        return pg;
    }

    public void setPg(Integer pg) {
        this.pg = pg;
    }


    
}



