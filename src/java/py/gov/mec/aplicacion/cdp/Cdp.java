/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.gov.mec.aplicacion.cdp;


/*
 * @author hugo
 */


import java.util.Date;


public class Cdp {
        
    private Integer id;
    private Integer estructura_id;
    private Integer unr;
    private Long pac_numero;
    private String cc;
    private String descripcion;
    private Long certificacion_actual;
    private Date fecha;
    private Integer cdp_numero;

    
    
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getEstructura_id() {
        return estructura_id;
    }

    public void setEstructura_id(Integer estructura_id) {
        this.estructura_id = estructura_id;
    }

    public Integer getUnr() {
        return unr;
    }

    public void setUnr(Integer unr) {
        this.unr = unr;
    }

    public Long getPac_numero() {
        return pac_numero;
    }

    public void setPac_numero(Long pac_numero) {
        this.pac_numero = pac_numero;
    }

    public String getCc() {
        return cc;
    }

    public void setCc(String cc) {
        this.cc = cc;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Long getCertificacion_actual() {
        return certificacion_actual;
    }

    public void setCertificacion_actual(Long certificacion_actual) {
        this.certificacion_actual = certificacion_actual;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public Integer getCdp_numero() {
        return cdp_numero;
    }

    public void setCdp_numero(Integer cdp_numero) {
        this.cdp_numero = cdp_numero;
    }

    
}

