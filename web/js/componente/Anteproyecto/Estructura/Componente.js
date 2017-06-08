
window.onload = function() {
          
        
    var eje = getParametroValor("eje");   
    
    /*
    AjaxPeticion('../../Estructura/Cabecera?tp='+tp
        ,'cabecera_body');    
    */
        
    AjaxPeticion('../../Componente/Coleccion/PresupuestoLista?eje='+eje,'tab_body');  
    Componente_Tabla();


    
};



function  Componente_Tabla ( ){

        var tabla_coleccion = document.getElementById( 'com_tabla' ).getElementsByTagName('tbody')[0];
        var rows = tabla_coleccion.getElementsByTagName('tr');

        for (var i=0 ; i < rows.length; i++)
        {
            rows[i].addEventListener ( 'click',
                function() {                                        
              
                    registroid = this.dataset.linea_id;                                       
                    deje = this.dataset.linea_eje;             
                                        
                    window.location = "../Estructura/Nivel.jspx?com="+registroid
                            +"&eje="+deje;                    
                },
                false
            );
        }
        
        Componente_Tabla_formato();
        
    }



function  Componente_Tabla_formato ( ){

        var tabla_coleccion = document.getElementById( 'com_tabla' ).getElementsByTagName('tbody')[0];
        var rows = tabla_coleccion.getElementsByTagName('tr');

        for (var i=0 ; i < rows.length; i++)
        {

            cell = tabla_coleccion.rows[i].cells[2] ;                                  
            cell.innerHTML = formatoNumero_p(cell.innerHTML);
            cell.className = "numero";


        }
        
    }
