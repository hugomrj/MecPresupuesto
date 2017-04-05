/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.gov.mec.aplicacion.viatico_certificacion;




/**
 *
 * @author hugo
 */


import java.util.Date;



public class ViaticoCertificacion {
    
    private Integer id;
    private Integer presupuesto_id;           
    private Integer monto_certificacion;  
    private Integer monto_disponible;  
    private Integer persona;    
    private Integer direccion;    
    private Integer categoria_funcionario;    
    private Integer destino;    
    private Integer certificacion_numeracion;
    private Integer dias;
    private Integer terminal_pasaje;
    private Integer terminal_alojamiento;
    private Integer terminal_alimentacion;
    private Date fecha_inicio;
    private Date fecha_fin;
    private String datosviaje;
    
    
       
    

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getPresupuesto_id() {
        return presupuesto_id;
    }

    public void setPresupuesto_id(Integer presupuesto_id) {
        this.presupuesto_id = presupuesto_id;
    }


    public Integer getMonto_certificacion() {
        return monto_certificacion;
    }

    public void setMonto_certificacion(Integer monto_certificacion) {
        this.monto_certificacion = monto_certificacion;
    }



    public Integer getPersona() {
        return persona;
    }

    public void setPersona(Integer persona) {
        this.persona = persona;
    }

    public Integer getDireccion() {
        return direccion;
    }

    public void setDireccion(Integer direccion) {
        this.direccion = direccion;
    }

    public Integer getCategoria_funcionario() {
        return categoria_funcionario;
    }

    public void setCategoria_funcionario(Integer categoria_funcionario) {
        this.categoria_funcionario = categoria_funcionario;
    }

    public Integer getDestino() {
        return destino;
    }

    public void setDestino(Integer destino) {
        this.destino = destino;
    }

    public Integer getCertificacion_numeracion() {
        return certificacion_numeracion;
    }

    public void setCertificacion_numeracion(Integer certificacion_numeracion) {
        this.certificacion_numeracion = certificacion_numeracion;
    }

    public Integer getMonto_disponible() {
        return monto_disponible;
    }

    public void setMonto_disponible(Integer monto_disponible) {
        this.monto_disponible = monto_disponible;
    }

    public Integer getDias() {
        return dias;
    }

    public void setDias(Integer dias) {
        this.dias = dias;
    }

    public Integer getTerminal_pasaje() {
        return terminal_pasaje;
    }

    public void setTerminal_pasaje(Integer terminal_pasaje) {
        this.terminal_pasaje = terminal_pasaje;
    }

    public Integer getTerminal_alojamiento() {
        return terminal_alojamiento;
    }

    public void setTerminal_alojamiento(Integer terminal_alojamiento) {
        this.terminal_alojamiento = terminal_alojamiento;
    }

    public Integer getTerminal_alimentacion() {
        return terminal_alimentacion;
    }

    public void setTerminal_alimentacion(Integer terminal_alimentacion) {
        this.terminal_alimentacion = terminal_alimentacion;
    }

    public Date getFecha_inicio() {
        return fecha_inicio;
    }

    public void setFecha_inicio(Date fecha_inicio) {
        this.fecha_inicio = fecha_inicio;
    }

    public Date getFecha_fin() {
        return fecha_fin;
    }

    public void setFecha_fin(Date fecha_fin) {
        this.fecha_fin = fecha_fin;
    }

    public String getDatosviaje() {
        return datosviaje;
    }

    public void setDatosviaje(String datosviaje) {
        this.datosviaje = datosviaje;
    }
    
    
    
}
