/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.itx.execute;

import nebuleuse.ORM.Persistencia;
import py.gov.mec.aplicacion.documento.Documento;

/**
 *
 * @author hugo
 */
public class NewMain {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws Exception {
        // TODO code application logic here
        
        Documento doc = new Documento();
        Persistencia per = new Persistencia();
        
        doc = (Documento) per.filtrarId(doc ,19);
        doc= (Documento) per.delete(doc);
        
        
        
    }
    
}