/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package py.gov.mec.aplicacion.persona;

/**
 *
 * @author hugo
 */
public class Persona {
    
        
    private Integer persona;
    private Integer cedula;
    private String nombres;

    public Integer getPersona() {
        return persona;
    }

    public void setPersona(Integer persona) {
        this.persona = persona;
    }

    public Integer getCedula() {
        return cedula;
    }

    public void setCedula(Integer cedula) {
        this.cedula = cedula;
    }

    public String getNombres() {        
        return nombres;        
    }

    public void setNombres(String nombres) {
        
        if (nombres.equals("")){
            this.nombres = null;
        }
        else{
            this.nombres = nombres;
        }
        
    }
    
}

