/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.gov.mec.aplicacion.llamado;

/**
 *
 * @author hugo
 */
public class Llamado {
    
        
    private Integer id;
    private String cc;
    private String llamado;        
    private String pac;
    private Long monto;

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
    
    
    
}
