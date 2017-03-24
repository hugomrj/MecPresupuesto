

function PresupuestoVigente_CabeceraLinea (registro){
    
        AjaxPeticion('../PresupuestoVigente/Cabecera/Lista?registro='+registro,'presupuesto_cabecera');      
    
    
    
    var table = document.getElementById( "pvcabe_tabla" ).getElementsByTagName('tbody')[0] ;
    var rows = table.rows.length;
    var cell ;
 
    for(i=0; i<rows; i++)
    {      
        cell = table.rows[i].cells[9] ;                                  
        cell.innerHTML = formatoNumero_p(cell.innerHTML); 
        
    }        
    
};


