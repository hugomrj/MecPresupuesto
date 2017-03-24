/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.gov.mec.aplicacion.plandetalle;

/**
 *
 * @author hugo
 */


public class PlanDetalle {
    
    private Integer id;
    private Integer plan_id;
    private String cc;
    private String llamado;
    private String proveedor;
    private String pac;
    private Long monto;
    private Long certificado;
    private String tipo;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCc() {
        return cc;
    }

    public void setCc(String cc) {
        this.cc = cc;
    }

    public String getLlamado() {
        return llamado;
    }

    public void setLlamado(String llamado) {
        this.llamado = llamado;
    }

    public String getProveedor() {
        return proveedor;
    }

    public void setProveedor(String proveedor) {
        this.proveedor = proveedor;
    }

    public String getPac() {
        return pac;
    }

    public void setPac(String pac) {
        this.pac = pac;
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

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public Integer getPlan_id() {
        return plan_id;
    }

    public void setPlan_id(Integer plan_id) {
        this.plan_id = plan_id;
    }
            
    
    
}
