



function ViaticoCertificacionColeccionExterior_tabla_registro (  ){
    
   ViaticoCertificacionColeccionExterior_tabla_formato ();

    ViaticoCertificacionColeccionExterior_memo();

}




function ViaticoCertificacionColeccionExterior_tabla_formato (){
    
    var table = document.getElementById( "vcmes_tabla" ).getElementsByTagName('tbody')[0] ;
    var rows = table.rows.length;
    var cell ;
 
    for(i=0; i<rows; i++)
    {      
        cell = table.rows[i].cells[3] ;                                  
        cell.innerHTML = formatoNumero_p(cell.innerHTML.toString().trim()); 
        
    }    
};




function ViaticoCertificacionColeccionExterior_memo (){
    
    var mes = getParametroValor("mes");  
    var planf = getParametroValor("planf");      
    var nroid = getParametroValor("nroid");      
    
    
    
   // memo
   var path = "../ViaticoCertificacion/Exterior/Memo?mes="+mes
           +"&planf="+planf
           +"&nroid="+nroid ;      
   AjaxPeticion(path,'tab_memo');         
    
    var table = document.getElementById( "vcem_tabla" ).getElementsByTagName('tbody')[0] ;
    var rows = table.rows.length;
    var cell ; 
    for(i=0; i<rows; i++)
    {      
        cell = table.rows[i].cells[9] ;                                  
        cell.innerHTML = formatoNumero_p(cell.innerHTML); 
        cell = table.rows[i].cells[10] ;                                  
        cell.innerHTML = formatoNumero_p(cell.innerHTML); 
        cell = table.rows[i].cells[11] ;                                  
        cell.innerHTML = formatoNumero_p(cell.innerHTML); 
        cell = table.rows[i].cells[12] ;                                  
        cell.innerHTML = formatoNumero_p(cell.innerHTML); 
            
    }       
    
    
    
    
};


    