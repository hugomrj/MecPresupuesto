/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.gov.mec.estructura.proposito;






/**
 *
 * @author hugo
 */
public class Proposito {
            
    private Integer id;    
    private Integer subcomponente;
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

    public Integer getSubcomponente() {
        return subcomponente;
    }

    public void setSubcomponente(Integer subcomponente) {
        this.subcomponente = subcomponente;
    }

}


