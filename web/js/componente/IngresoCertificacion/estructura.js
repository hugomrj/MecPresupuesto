
function IngresoCertificacion_estructura ( idreg ){


    AjaxPeticion('../IngresoCertificacion/Coleccion/Estructura?idreg='+idreg,'tab_body');     
    fomato_tabla_ice_tabla ();
    

    // agregar dite
    var ice_agregar = document.getElementById('ice_agregar');
    ice_agregar.addEventListener('click',
        function() {    
                        
                    
                mostrarVentana('capa_oscura');
                mostrarVentana('capa_clara');
                
                AjaxPeticion( '../IngresoCertificacion/Vista/Agregar' , 'capa_clara' );
            
                dimensionarVentana('capa_clara', 700, 250);                    

                IngresoCertificacion_agregar ( idreg );            
            
        },
        false
    );               
    


};






function fomato_tabla_ice_tabla (){


    var table = document.getElementById( "ice_tabla" ).getElementsByTagName('tbody')[0] ;
    
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



