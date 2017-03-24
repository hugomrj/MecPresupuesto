/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.gov.mec.aplicacion.cajachica_certificacion;

/**
 *
 * @author hugo
 */


public class CajaChicaCertificacion {
        
    private Integer id;
    private Integer uoc_id;
    private Long monto_certificacion;
    private Integer direccion;
    private Long monto_disponible;
    private Integer mes;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUoc_id() {
        return uoc_id;
    }

    public void setUoc_id(Integer uoc_id) {
        this.uoc_id = uoc_id;
    }

    public Long getMonto_certificacion() {
        return monto_certificacion;
    }

    public void setMonto_certificacion(Long monto_certificacion) {
        this.monto_certificacion = monto_certificacion;
    }

    public Integer getDireccion() {
        return direccion;
    }

    public void setDireccion(Integer direccion) {
        this.direccion = direccion;
    }

    public Long getMonto_disponible() {
        return monto_disponible;
    }

    public void setMonto_disponible(Long monto_disponible) {
        this.monto_disponible = monto_disponible;
    }

    public Integer getMes() {
        return mes;
    }

    public void setMes(Integer mes) {
        this.mes = mes;
    }
    
    
    
    
}
