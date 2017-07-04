

window.onload = function() {



    AjaxPeticion('../Cdp/Coleccion/ConsolidadoObjeto','tab_body');     
    fomato_tabla();        




    
};

 


function fomato_tabla (){

    var table = document.getElementById( "cdpcl_tabla" ).getElementsByTagName('tbody')[0] ;
    var rows = table.rows.length;
    var cell ;
 
    for(i=0; i<rows; i++)
    {      
        
        cell = table.rows[i].cells[2] ;                                  
        cell.innerHTML = formatoNumero_p(cell.innerHTML); 

    }    

}


