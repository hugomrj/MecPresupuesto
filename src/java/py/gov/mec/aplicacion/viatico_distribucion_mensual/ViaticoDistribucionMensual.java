/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.gov.mec.aplicacion.viatico_distribucion_mensual;


/**
 *
 * @author hugo
 */


public class ViaticoDistribucionMensual {
    
    private Integer id; 
    private Integer direccion; 
    private Integer mes ;
    private Long monto;
    private Long certificado;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getDireccion() {
        return direccion;
    }

    public void setDireccion(Integer direccion) {
        this.direccion = direccion;
    }

    public Integer getMes() {
        return mes;
    }

    public void setMes(Integer mes) {
        this.mes = mes;
    }

    public Long getMonto() {
        return monto;
    }

    public void setMonto(Long monto) {
        this.monto = monto;
    }

    public Long getCertificado() {
        return certificado;
    }

    public void setCertificado(Long certificado) {
        this.certificado = certificado;
    }
    
    
}
