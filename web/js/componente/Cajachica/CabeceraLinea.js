


function Cajachica_CabeceraLinea (registro){

    AjaxPeticion('../CajaChica/Cabecera/Linea?registro='+registro,'presupuesto_cabecera');      
    
    var table = document.getElementById( "pvcabe_tabla" ).getElementsByTagName('tbody')[0] ;
    var rows = table.rows.length;
    var cell ;
 
    for(i=0; i<rows; i++)
    {      
        cell = table.rows[i].cells[8] ;                                  
        cell.innerHTML = formatoNumero_p(cell.innerHTML); 
    }        
    
};
