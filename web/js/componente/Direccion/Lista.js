

window.onload = function() {
   
    AjaxPeticion('../Direccion/Coleccion/Lista','tab_body');      
    
    //
    Direccion_sub_Registro( );
    
};





function Direccion_sub_Registro (   ){

    var tabla = 'dcl_tabla';

    var vinculo_coleccion = '../';
            
    direccion_sub_tabla( tabla, 800, 250);


};






    function direccion_sub_tabla (tabla , largo, ancho ){

        //tabla tab rol
        var tabla_coleccion = document.getElementById( tabla ).getElementsByTagName('tbody')[0];
        var rows = tabla_coleccion.getElementsByTagName('tr');


        for (var i=0 ; i < rows.length; i++)
        {
            rows[i].addEventListener ( 'click',
                function() {
                                        
                    //registroid = this.getElementsByTagName('id')[0].dataset.linea_id;                    
                    registroid = this.dataset.linea_id;                    
                    
                    window.location = "../Direccion/Registro.jspx?id="+registroid;
                    
                },
                false
            );
        }
    }


