/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package py.gov.mec.aplicacion.documento_movimiento;


import java.util.Date;
import py.gov.mec.aplicacion.documento.Documento;
import py.gov.mec.aplicacion.documento_movimiento_estado.DocumentoMovimientoEstado;
import py.gov.mec.sistema.usuario.Usuario;


/*
 * @author hugo
 */


public class DocumentoMovimiento {
    
    private Integer id;
    private Documento documento;
    private Date fecha;
    private DocumentoMovimientoEstado estado;
    private Usuario usuario;
    private String comentario;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Documento getDocumento() {
        return documento;
    }

    public void setDocumento(Documento documento) {
        this.documento = documento;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public DocumentoMovimientoEstado getEstado() {
        return estado;
    }

    public void setEstado(DocumentoMovimientoEstado estado) {
        this.estado = estado;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }
    
    
    
}


