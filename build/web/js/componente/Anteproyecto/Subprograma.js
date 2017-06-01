
window.onload = function() {
          
          
    
    var id = getParametroValor("id");   
    var tp = getParametroValor("tp");   
    var pg = getParametroValor("pg");   
    
    
    AjaxPeticion('../../Estructura/Cabecera?tp='+tp+"&pg="+pg
        ,'cabecera_body');  
    
    
    AjaxPeticion('../../Subprograma/Coleccion/Lista?id='+id,'tab_body');  
    Subprograma_sub_Registro();


    var subp_agregar = document.getElementById('subp_agregar');
    subp_agregar.addEventListener('click',
        function() {   
        
            
                mostrarVentana('capa_oscura');
                mostrarVentana('capa_clara');                           
                dimensionarVentana('capa_clara', 900, 250);                    
                
                AjaxPeticion( '../../Subprograma/jspf/agregar.jspx' , 'capa_clara' );     
            
                Subprograma_agregar(id, tp, pg );
                
        },
        false
    );    
    
};



function  Subprograma_sub_Registro ( ){

        var tabla_coleccion = document.getElementById( 'subp_tabla' ).getElementsByTagName('tbody')[0];
        var rows = tabla_coleccion.getElementsByTagName('tr');


        for (var i=0 ; i < rows.length; i++)
        {
            rows[i].addEventListener ( 'click',
                function() {                                        
              
                    registroid = this.dataset.linea_id;                                       
                    dtp = this.dataset.linea_tp;             
                    dpg = this.dataset.linea_pg;                         
                    dsp = this.dataset.linea_sp;                         
                    
                    window.location = "../Estructura/Proyecto.jspx?id="+registroid
                        +"&tp="+dtp+"&pg="+dpg+"&sp="+dsp;                              
                    
                },
                false
            );
        }
        
        Subprograma_tabla_formato ( );
        
    }




function  Subprograma_tabla_formato ( ){


        var table = document.getElementById( 'subp_tabla' ).getElementsByTagName('tbody')[0];
        var rows = table.getElementsByTagName('tr');


        for (var i=0 ; i < rows.length; i++)
        {
    
            cell = table.rows[i].cells[2] ;                                  
            cell.innerHTML = formatoNumero_p(cell.innerHTML).trim(); 
            cell.className = "numero";

            cell = table.rows[i].cells[3] ;                                  
            cell.innerHTML = formatoNumero_p(cell.innerHTML).trim(); 
            cell.className = "numero";        

            cell = table.rows[i].cells[4] ;                                  
            cell.innerHTML = formatoNumero_p(cell.innerHTML).trim(); 
            cell.className = "numero";       
    
        }
      
    
    
    
    var table = document.getElementById( "subp_tabla" ).getElementsByTagName('tfoot')[0] ;
    var rows = table.rows.length;
    var cell ;
 
 
    for(i=0; i<rows; i++)
    {      
        cell = table.rows[i].cells[2] ;                                  
        cell.innerHTML = formatoNumero_p(cell.innerHTML).trim(); 
        cell.className = "numero";
        

        cell = table.rows[i].cells[3] ;                                  
        cell.innerHTML = formatoNumero_p(cell.innerHTML).trim(); 
        cell.className = "numero";        
        
        
        cell = table.rows[i].cells[4] ;                                  
        cell.innerHTML = formatoNumero_p(cell.innerHTML).trim(); 
        cell.className = "numero";                
        
        
    }    
           
    
    
    }
