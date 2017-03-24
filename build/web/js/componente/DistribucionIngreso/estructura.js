

function datos_tabla_dite_tabla (){

    // traer datos de tabla    
    var idreg = getParametroValor("idreg");
    
    AjaxPeticion('../DistribucionIngreso/Coleccion/Estructura?idreg='+idreg,'tab_body');              
    fomato_tabla_dite_tabla();      
    
    editar_tabla_dite_tabla();        
        
    
    // agregar dite
    var dite_agregar = document.getElementById('dite_agregar');
    dite_agregar.addEventListener('click',
        function() {    
                        
                    
                mostrarVentana('capa_oscura');
                mostrarVentana('capa_clara');
                
                AjaxPeticion( '../DistribucionIngreso/Vista/Agregar' , 'capa_clara' );
            
                dimensionarVentana('capa_clara', 900, 250);                    

                var idregistro = getParametroValor("idreg");
                DistribucionIngreso_agregar ( idregistro );            
            
        },
        false
    );               
    
    

};






function fomato_tabla_dite_tabla (){


    var table = document.getElementById( "dite_tabla" ).getElementsByTagName('tbody')[0] ;
    
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



