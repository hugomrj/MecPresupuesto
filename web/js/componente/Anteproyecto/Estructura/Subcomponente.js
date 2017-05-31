


var eje = 0;
var com = 0;   



window.onload = function() {
          
              
        eje = getParametroValor("eje");   
        com = getParametroValor("com");   
    
    /*
    AjaxPeticion('../../Estructura/Cabecera?tp='+tp+"&pg="+pg
        ,'cabecera_body');  
    */    
    
    
    Subcomponente_formulario();

    
    
  
    
};

function  Subcomponente_formulario ( ){
    
    AjaxPeticion('../../Subcomponente/Coleccion/PresupuestoLista?com='+com,'tab_body');  
    Subcomponente_tabla_Registro( "subcom_tabla");


    var subcom_agregar = document.getElementById('subcom_agregar');
    subcom_agregar.addEventListener('click',
        function() {   
        
            
                mostrarVentana('capa_oscura');
                mostrarVentana('capa_clara');                           
                dimensionarVentana('capa_clara', 900, 250);                    
                
                
                AjaxPeticion( '../../Subcomponente/jspf/agregar.jspx' , 'capa_clara' );     
            
                 Subcomponente_agregar( com );
                
        },
        false
    );      
    
    
}




function  Subcomponente_tabla_Registro (tabla ){

        var tabla_coleccion = document.getElementById( tabla ).getElementsByTagName('tbody')[0];
        var rows = tabla_coleccion.getElementsByTagName('tr');


        for (var i=0 ; i < rows.length; i++)
        {
            rows[i].addEventListener ( 'click',
                function() {                                        
              
                    registroid = this.dataset.linea_id;                                      
                    
                    window.location = "../Estructura/Proposito.jspx?scom="+registroid;                            
                    
                },
                false
            );
        }
        
        Subcomponente_tabla_formato(tabla);
        
    }



function  Subcomponente_tabla_formato (tabla ){

        var tabla_coleccion = document.getElementById( tabla ).getElementsByTagName('tbody')[0];
        var rows = tabla_coleccion.getElementsByTagName('tr');


        for (var i=0 ; i < rows.length; i++)
        {

            cell = tabla_coleccion.rows[i].cells[2] ;                                  
            cell.innerHTML = formatoNumero_p(cell.innerHTML);
            cell.className = "numero";

        }
        
    }
