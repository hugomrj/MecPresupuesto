
function IngresoEjecucion_estructura ( idreg ){


//    AjaxPeticion('../IngresoCertificacion/Coleccion/Estructura?idreg='+idreg,'tab_body');              
    AjaxPeticion('../IngresoEjecucion/Coleccion/Estructura?idreg='+idreg,'tab_body');   
    fomato_tabla_iee_tabla();
    

    var iee_agregar = document.getElementById('iee_agregar');
    iee_agregar.addEventListener('click',
        function() {    
                        
                    
                mostrarVentana('capa_oscura');
                mostrarVentana('capa_clara');
                
                
                AjaxPeticion( '../IngresoEjecucion/Vista/Agregar' , 'capa_clara' );
                dimensionarVentana('capa_clara', 700, 250);                    
                IngresoEjecucion_agregar ( idreg );            
  
        },
        false
    );               
    


};






function fomato_tabla_iee_tabla (){


    var table = document.getElementById( "iee_tabla" ).getElementsByTagName('tbody')[0] ;
    
    //var rows = table.rows.length;
    var regs = table.getElementsByTagName('tr');        
    var cell ;
        
    for(i=0; i < regs.length; i++)
    {      
        numero = regs[i].dataset.numero;        
        if (numero == "si"){

            cell = table.rows[i].cells[0] ;                                  
            cell.innerHTML = formatoNumero_p(cell.innerHTML); 

            cell = table.rows[i].cells[1] ;                                  
            cell.innerHTML = formatoNumero_p(cell.innerHTML); 
           

            cell = table.rows[i].cells[2] ;                                  
            cell.innerHTML = formatoNumero_p(cell.innerHTML); 
        
            
            
            cell = table.rows[i].cells[3] ;                                  
            cell.innerHTML = formatoNumero_p(cell.innerHTML); 
  
            
            cell = table.rows[i].cells[4] ;                                  
            cell.innerHTML = formatoNumero_p(cell.innerHTML); 

            
            cell = table.rows[i].cells[5] ;                                  
            cell.innerHTML = formatoNumero_p(cell.innerHTML); 
 
            
        }
        
    }

}




