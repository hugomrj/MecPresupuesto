

window.onload = function() {
   
   
    
    AjaxPeticion('../../Tipo/Coleccion/Lista','tab_body');                          
    Tipo_sub_Registro();
    //Tipo_tabla_formato();    
            
    
};



function Tipo_sub_Registro ( ){

    var tabla = 'tipo_tabla';            
    Tipo_sub_tabla( tabla);

};



function  Tipo_sub_tabla (tabla ){

        //tabla tab rol
        var tabla_coleccion = document.getElementById( tabla ).getElementsByTagName('tbody')[0];
        var rows = tabla_coleccion.getElementsByTagName('tr');


        for (var i=0 ; i < rows.length; i++)
        {
            rows[i].addEventListener ( 'click',
                function() {                                        
              
                    registroid = this.dataset.linea_id;                                       
                    window.location = "../Estructura/Programa.jspx?tp="+registroid;                    
                },
                false
            );
        }
        
    }
