/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.gov.mec.aplicacion.viatico_certificacion_numeracion;


/**
 *
 * @author hugo
 */

import java.util.Date;



public class ViaticoCertificacionNumeracion {
    
    private Integer id; 
    private Date fecha;    
    private Integer codigo_interno;
    private Integer mes ;
    private Integer plan_financiero_id ;
    private String tipo_viatico;    
    private Integer dolar;    
    private Long anteriores;    
    
    
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public Integer getCodigo_interno() {
        return codigo_interno;
    }

    public void setCodigo_interno(Integer codigo_interno) {
        this.codigo_interno = codigo_interno;
    }

    public Integer getMes() {
        return mes;
    }

    public void setMes(Integer mes) {
        this.mes = mes;
    }

    public Integer getPlan_financiero_id() {
        return plan_financiero_id;
    }

    public void setPlan_financiero_id(Integer plan_financiero_id) {
        this.plan_financiero_id = plan_financiero_id;
    }
    
    public String getTipo_viatico() {
        return tipo_viatico;
    }

    public void setTipo_viatico(String tipo_viatico) {
        this.tipo_viatico = tipo_viatico.toUpperCase();
    }    

    public Integer getDolar() {
        return dolar;
    }

    public void setDolar(Integer dolar) {
        this.dolar = dolar;
    }

    public Long getAnteriores() {
        return anteriores;
    }

    public void setAnteriores(Long anteriores) {
        this.anteriores = anteriores;
    }
    

}
