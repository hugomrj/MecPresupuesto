

window.onload = function() {
   

    
    AjaxPeticion('../CajaChica/Coleccion/Todos','tab_body');     



    var vinculo ="";
    vinculo = "../Cajachica/Distribucion.jspx?registro=";                        
    funcion_tabla_cajachica_registro(vinculo);
    fomato_tabla ();


    
};



function funcion_tabla_cajachica_registro( link )
{
    var tabla_qry = document.getElementById('pvcl_tabla').getElementsByTagName('tbody')[0];
    var regs = tabla_qry.getElementsByTagName('tr');

    for (var i=0 ; i < regs.length; i++)
    {

        regs[i].addEventListener ( 'click',
            function() {

                var registro_id = this.dataset.registro_id;                                    
                window.location = link + registro_id ;                                                
                        
            },
            false
        );

    }

};








function fomato_tabla (){

    var table = document.getElementById( "pvcl_tabla" ).getElementsByTagName('tbody')[0] ;
    var rows = table.rows.length;
    var cell ;
 
    for(i=0; i<rows; i++)
    {      
        cell = table.rows[i].cells[8] ;                                  
        cell.innerHTML = formatoNumero_p(cell.innerHTML); 
        
    }    

    for(i=0; i<rows; i++)
    {      
        cell = table.rows[i].cells[9] ;                                  
        cell.innerHTML = formatoNumero_p(cell.innerHTML); 
        
    }    
    
    for(i=0; i<rows; i++)
    {      
        cell = table.rows[i].cells[10] ;                                  
        cell.innerHTML = formatoNumero_p(cell.innerHTML); 
        
    }        

}

