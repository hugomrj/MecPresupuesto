



function ViaticoCertificacionColeccionInterior_tabla_registro (  ){
    
   ViaticoCertificacionColeccionInterior_tabla_formato ();

    

}




function ViaticoCertificacionColeccionInterior_tabla_formato (){
    
    var table = document.getElementById( "vcmes_tabla" ).getElementsByTagName('tbody')[0] ;
    var rows = table.rows.length;
    var cell ;
 
    for(i=0; i<rows; i++)
    {      
        cell = table.rows[i].cells[10] ;                                  
        cell.innerHTML = formatoNumero_p(cell.innerHTML.toString().trim());
        
        cell = table.rows[i].cells[11] ;                                  
        cell.innerHTML = formatoNumero_p(cell.innerHTML.toString().trim()); 
        
        cell = table.rows[i].cells[12] ;                                  
        cell.innerHTML = formatoNumero_p(cell.innerHTML.toString().trim()); 
        
    }    
};


