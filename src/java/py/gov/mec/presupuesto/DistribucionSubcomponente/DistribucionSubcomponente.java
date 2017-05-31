/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.gov.mec.presupuesto.DistribucionSubcomponente;



/**
 *
 * @author hugo
 */
public class DistribucionSubcomponente {
    
    private Integer id;
    private Integer presupuesto;
    private Integer subcomponente;
    private Long monto;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getPresupuesto() {
        return presupuesto;
    }

    public void setPresupuesto(Integer presupuesto) {
        this.presupuesto = presupuesto;
    }

    public Integer getSubcomponente() {
        return subcomponente;
    }

    public void setSubcomponente(Integer subcomponente) {
        this.subcomponente = subcomponente;
    }

    public Long getMonto() {
        return monto;
    }

    public void setMonto(Long monto) {
        this.monto = monto;
    }
    
}

