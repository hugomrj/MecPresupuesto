

window.onload = function() {
   
    
    var registro = getParametroValor("idreg");        
    PresupuestoVigente_CabeceraLinea(registro);
    
    datos_tabla_ucol_tabla(registro);

    
};





function datos_tabla_ucol_tabla (registro){

    // traer datos de tabla    
    var idreg = getParametroValor("idreg");
    
    AjaxPeticion('../UocCertificacion/Coleccion/Lista?idreg='+registro,'tab_body');              
    fomato_tabla_ucol_tabla();        




    var ucd_reactivacion = document.getElementById('ucd_reactivacion');
    ucd_reactivacion.addEventListener('click',
        function() {            
                       
                mostrarVentana('capa_oscura');
                mostrarVentana('capa_clara');
            
                AjaxPeticion( '../UocCertificacion/jspf/AgregarReactivacion.jspx' , 'capa_clara' );
                dimensionarVentana('capa_clara', 800, 250);                    
     
                AgregarReactivacion( registro );
            
        },
        false
    );  
    
    
    
    
    
    
    var ucd_llamado = document.getElementById('ucd_llamado');
    ucd_llamado.addEventListener('click',
        function() {            
           
                mostrarVentana('capa_oscura');
                mostrarVentana('capa_clara');            
                AjaxPeticion( '../UocCertificacion/jspf/AgregarLlamado.jspx' , 'capa_clara' );
                dimensionarVentana('capa_clara', 800, 250);         
                
                AgregarLlamado( registro );
                          
        },
        false
    );      
    
    
    
    
    

    var ucd_cajachica = document.getElementById('ucd_cajachica');
    ucd_cajachica.addEventListener('click',
        function() {            
           
                mostrarVentana('capa_oscura');
                mostrarVentana('capa_clara');            
                AjaxPeticion( '../UocCertificacion/jspf/AgregarCajaChica.jspx' , 'capa_clara' );
                dimensionarVentana('capa_clara', 800, 250);                         
                AgregarCajachica( idreg );
            
        },
        false
    );         
    
    
    

    //PlanDetalle_sub_Registro();

};









function fomato_tabla_ucol_tabla (){

    var table = document.getElementById( "ucol_tabla" ).getElementsByTagName('tbody')[0] ;
    var rows = table.rows.length;
    var cell ;
 
    for(i=0; i<rows; i++)
    {      
        cell = table.rows[i].cells[4] ;                                  
        cell.innerHTML = formatoNumero_p(cell.innerHTML); 

        
        cell = table.rows[i].cells[5] ;                                  
        cell.innerHTML = formatoNumero_p(cell.innerHTML); 

        
        
    }    


}


