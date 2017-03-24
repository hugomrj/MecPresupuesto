

window.onload = function() {
   
    AjaxPeticion('../Persona/Coleccion/Todos','tab_body');      
    
    //
    Personas_sub_Registro( );
    
};





function Personas_sub_Registro(   ){

    var tabla = 'pcl_tabla';

    var vinculo_coleccion = '../PlanDetalle/Vista/Registro';
    //var prefijo = "ccld_" ;
        
    sub_tabla( tabla, vinculo_coleccion, 800, 250);


};






    function sub_tabla (tabla , vinculo, largo, ancho ){

        //tabla tab rol
        var tabla_coleccion = document.getElementById( tabla );
        var rows = tabla_coleccion.getElementsByTagName('tr');

        for (var i=0 ; i < rows.length; i++)
        {
            rows[i].addEventListener ( 'click',
                function() {
                                        
                    registroid = this.getElementsByTagName('id')[0].dataset.linea_id;                    
                    
                    window.location = "../Persona/Registro.jspx?id="+registroid;
                    
                },
                false
            );
        }
    }


