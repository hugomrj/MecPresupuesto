/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.gov.mec.estructura.proyecto;
import py.gov.mec.estructura.subprograma.*;



/**
 *
 * @author hugo
 */
public class Proyecto {
            
    private Integer id;    
    private Integer tp;
    private Integer pg;
    private Integer sp;
    private Integer py;
    private Subprograma subprograma;
    private String descripcion;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getTp() {
        return tp;
    }

    public void setTp(Integer tp) {
        this.tp = tp;
    }

    public Integer getPg() {
        return pg;
    }

    public void setPg(Integer pg) {
        this.pg = pg;
    }

    public Integer getSp() {
        return sp;
    }

    public void setSp(Integer sp) {
        this.sp = sp;
    }

    public Integer getPy() {
        return py;
    }

    public void setPy(Integer py) {
        this.py = py;
    }

    public Subprograma getSubprograma() {
        return subprograma;
    }

    public void setSubprograma(Subprograma subprograma) {
        this.subprograma = subprograma;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
}

