


var eje = 0;
var com = 0;   



window.onload = function() {
          
              
        eje = getParametroValor("eje");   
        com = getParametroValor("com");   
    
    /*
    AjaxPeticion('../../Estructura/Cabecera?tp='+tp+"&pg="+pg
        ,'cabecera_body');  
    */    
    
    
    Nivel_formulario();

    
    
  
    
};

function  Nivel_formulario ( ){
    
    AjaxPeticion('../../Nivel/Coleccion/PresupuestoLista?com='+com,'tab_body');  
    Nivel_tabla_Registro( "nivel_tabla");


    var niv_agregar = document.getElementById('niv_agregar');
    niv_agregar.addEventListener('click',
        function() {   
        
            
                mostrarVentana('capa_oscura');
                mostrarVentana('capa_clara');                           
                dimensionarVentana('capa_clara', 900, 250);                    
                
                
                AjaxPeticion( '../../Nivel/jspf/agregar.jspx' , 'capa_clara' );     
            
                Nivel_agregar( com );
                
        },
        false
    );      
    
    
}




function  Nivel_tabla_Registro (tabla ){

        var tabla_coleccion = document.getElementById( tabla ).getElementsByTagName('tbody')[0];
        var rows = tabla_coleccion.getElementsByTagName('tr');


        for (var i=0 ; i < rows.length; i++)
        {
            rows[i].addEventListener ( 'click',
                function() {                                        
              
                    registroid = this.dataset.linea_id;                                      
                    
                    window.location = "../Estructura/Item.jspx?niv="+registroid;                            
                    
                },
                false
            );
        }
        
        Nivel_tabla_formato(tabla);
        
    }



function  Nivel_tabla_formato (tabla ){

        var tabla_coleccion = document.getElementById( tabla ).getElementsByTagName('tbody')[0];
        var rows = tabla_coleccion.getElementsByTagName('tr');


        for (var i=0 ; i < rows.length; i++)
        {

            cell = tabla_coleccion.rows[i].cells[2] ;                                  
            cell.innerHTML = formatoNumero_p(cell.innerHTML);
            cell.className = "numero";

        }
        
    }
