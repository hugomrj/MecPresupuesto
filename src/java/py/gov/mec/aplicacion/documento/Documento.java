/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package py.gov.mec.aplicacion.documento;

import java.util.Date;
import py.gov.mec.aplicacion.direccion.Direccion;


/*
 * @author hugo
 */


public class Documento {
    
    private Integer id;
    private Date fecha_documento;
    private Date fecha_entrada;
    private Direccion direccion;
    private String  descripcion;
    private Long expediente_numero;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getFecha_documento() {
        return fecha_documento;
    }

    public void setFecha_documento(Date fecha_documento) {
        this.fecha_documento = fecha_documento;
    }

    public Date getFecha_entrada() {
        return fecha_entrada;
    }

    public void setFecha_entrada(Date fecha_entrada) {
        this.fecha_entrada = fecha_entrada;
    }

    public Direccion getDireccion() {
        return direccion;
    }

    public void setDireccion(Direccion direccion) {
        this.direccion = direccion;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Long getExpediente_numero() {
        return expediente_numero;
    }

    public void setExpediente_numero(Long expediente_numero) {
        this.expediente_numero = expediente_numero;
    }
    
    
    
    
    
}
