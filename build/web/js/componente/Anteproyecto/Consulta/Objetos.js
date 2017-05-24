    
    
    var id  = 0;
    var tp = 0;
    var pg = 0;
    var sp = 0;
    var py = 0;



window.onload = function() 
{

    
    id = getParametroValor("id");   
    tp = getParametroValor("tp");   
    pg = getParametroValor("pg");   
    sp = getParametroValor("sp");   
    py = getParametroValor("py");   
    
    Anteproyecto_consulta_objetos();
   
   
};



function Anteproyecto_consulta_objetos(){
   
    
    AjaxPeticion('../../Estructura/Cabecera?tp='+tp+"&pg="+pg+"&sp="+sp+"&py="+py
        ,'cabecera_body');              
        
    AjaxPeticion('../../Anteproyecto/ObjetoProducto/Lista?tp='+tp+"&pg="+pg+"&sp="+sp+"&py="+py
        ,'tab_body');  
    
        
    Anteproyecto_consulta_objetos_formato();

    
}




function Anteproyecto_consulta_objetos_formato(){


    var tabla = document.getElementById( "anteobjpro_tabla" ).getElementsByTagName('tbody')[0] ;    
    var rows = tabla.getElementsByTagName('tr');
    var cell ;



         for (var i=0 ; i < rows.length; i++)
        {
            
             linea_clase = tabla.rows[i].dataset.linea_clase;                                       
                    
    
            if (linea_clase.toString().trim() ==  "monto"   )
            {
                cell = tabla.rows[i].cells[3] ;                                  
                cell.innerHTML = formatoNumero_p(cell.innerHTML).trim(); 
                cell.className = "numero";    
                
                cell = tabla.rows[i].cells[4] ;                                  
                cell.innerHTML = formatoNumero_p(cell.innerHTML).trim(); 
                cell.className = "numero";                   
                
                cell = tabla.rows[i].cells[5] ;                                  
                cell.innerHTML = formatoNumero_p(cell.innerHTML).trim(); 
                cell.className = "numero";                                   
                
            }   
            
            
            if ( linea_clase.toString().trim() ==  "subtotal"  )
            {
                cell = tabla.rows[i].cells[1] ;                                  
                cell.innerHTML = formatoNumero_p(cell.innerHTML).trim(); 
                cell.className = "numero";    
                cell.style.fontWeight = "600";
                
                cell = tabla.rows[i].cells[2] ;                                  
                cell.innerHTML = formatoNumero_p(cell.innerHTML).trim(); 
                cell.className = "numero";       
                cell.style.fontWeight = "600";
                
                cell = tabla.rows[i].cells[3] ;                                  
                cell.innerHTML = formatoNumero_p(cell.innerHTML).trim(); 
                cell.className = "numero";   
                cell.style.fontWeight = "600";
                                
            }               
            
            
            if ( linea_clase.toString().trim() ==  "titulo_objeto"  )
            {
                
                cell = tabla.rows[i].cells[0] ;                    
                cell.style.fontStyle = "italic";       
                cell.style.paddingLeft = "1rem";       
                
                cell = tabla.rows[i].cells[1] ;                    
                cell.style.fontStyle = "italic";
                cell.style.paddingLeft = "1rem";       
                
                cell = tabla.rows[i].cells[2] ;                    
                cell.style.fontStyle = "italic";
                cell.style.paddingLeft = "1rem";                       
                
                cell = tabla.rows[i].cells[3] ;                    
                cell.style.fontStyle = "italic";
                
            }               
            
        } 
            
        var tabla = document.getElementById( "anteobjpro_tabla" ).getElementsByTagName('tfoot')[0] ;    
        var rows = tabla.getElementsByTagName('tr');
        var cell ;            
            
         for (var i=0 ; i < rows.length; i++)
        {
                cell = tabla.rows[i].cells[1] ;                                  
                cell.innerHTML = formatoNumero_p(cell.innerHTML).trim(); 
                cell.className = "numero";    
                
                cell = tabla.rows[i].cells[2] ;                                  
                cell.innerHTML = formatoNumero_p(cell.innerHTML).trim(); 
                cell.className = "numero";       
                
                cell = tabla.rows[i].cells[3] ;                                  
                cell.innerHTML = formatoNumero_p(cell.innerHTML).trim(); 
                cell.className = "numero";   
                                
          }                 
            
          
}



