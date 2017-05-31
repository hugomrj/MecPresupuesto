

window.onload = function() {
   
   
    
    AjaxPeticion('../../Eje/Coleccion/PresupuestoLista','tab_body');                          
    Eje_Tabla();
    //Tipo_tabla_formato();    
            
    
};



function Eje_Tabla ( ){

    
    Eje_Tabla_Registro( "eje_tabla");

};



function  Eje_Tabla_Registro (tabla ){

        //tabla tab rol
        var tabla_coleccion = document.getElementById( tabla ).getElementsByTagName('tbody')[0];
        var rows = tabla_coleccion.getElementsByTagName('tr');


        for (var i=0 ; i < rows.length; i++)
        {
            rows[i].addEventListener ( 'click',
                function() {                                        
              
                    registroid = this.dataset.linea_id;                                       
                    window.location = "../Estructura/Componente.jspx?eje="+registroid;                    
                },
                false
            );
        }
        
        Eje_Tabla_formato(tabla);
        
        
    }



function  Eje_Tabla_formato ( tabla ){

        //tabla tab rol
        var tabla = document.getElementById( tabla ).getElementsByTagName('tbody')[0];
        var rows = tabla.getElementsByTagName('tr');
        var cell ;

        for (var i=0 ; i < rows.length; i++)
        {
            cell = tabla.rows[i].cells[2] ;                                  
            cell.innerHTML = formatoNumero_p(cell.innerHTML);
            cell.className = "numero";
        }
      
    
    
    }
