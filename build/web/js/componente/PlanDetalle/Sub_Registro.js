


function PlanDetalle_sub_Registro(   ){

    var tabla = 'ccld_tabla';

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
                    
                    //registroid = this.getElementsByTagName('id')[0].innerHTML;
                                        
                    registroid = this.getElementsByTagName('id')[0].dataset.linea_id;

                    mostrarVentana('capa_oscura');
                    mostrarVentana('capa_clara');

                    dimensionarVentana('capa_clara', largo, ancho);
                    AjaxPeticion( vinculo, 'capa_clara' );

                    funcionalidad_formulario(registroid);

                },
                false
            );
        }
    }





function funcionalidad_formulario ( registroid ){

    // cargar datos del jsom
    var jsonResponse = AjaxUrl( "../PlanDetalle/Linea.json?idreg="+registroid );    
    
    if (jsonResponse.toString().trim() != "null")
    {        
        var objetoJson = JSON.parse(jsonResponse);    

        var pdsr_id = document.getElementById('pdsr_id');  
        pdsr_id.value = objetoJson.id ;

        var pdsr_plan_id = document.getElementById('pdsr_plan_id');  
        pdsr_plan_id.value = objetoJson.plan_id ;

        var pdsr_cc = document.getElementById('pdsr_cc');  
        pdsr_cc.value = objetoJson.cc ;

        var pdsr_llamado = document.getElementById('pdsr_llamado');  
        pdsr_llamado.value = objetoJson.llamado ;

        var pdsr_proveedor = document.getElementById('pdsr_proveedor');  
        pdsr_proveedor.value = objetoJson.proveedor ;

        var pdsr_pac = document.getElementById('pdsr_pac');  
        pdsr_pac.value = objetoJson.pac ;

        var pdsr_monto = document.getElementById('pdsr_monto');  
        pdsr_monto.value = objetoJson.monto ;

        var pdsr_certificado = document.getElementById('pdsr_certificado');  
        pdsr_certificado.value = objetoJson.certificado ;

        var pdsr_tipo = document.getElementById('pdsr_tipo');  
        pdsr_tipo.value = objetoJson.tipo ;


    }


    var pdsr_editar = document.getElementById('pdsr_editar');
    pdsr_editar.addEventListener('click',
        function() {    
            
            
            var form = document.getElementById("pdsr_form");
            var accion =  "../PlanDetalle/Controlador/Editar" ;
            AjaxPeticionURL(accion, getDataForm(form));
              
                datos_tabla_ccld_tabla();
              
                javascript:ocultarVentana('capa_oscura');
                javascript:ocultarVentana('capa_clara');       



        },
        false
    );      




    var pdsr_borrar = document.getElementById('pdsr_borrar');
    pdsr_borrar.addEventListener('click',
        function() {    
            
            
            var form = document.getElementById("pdsr_form");
            var accion =  "../PlanDetalle/Controlador/Borrar" ;
            AjaxPeticionURL(accion, getDataForm(form));
              
                datos_tabla_ccld_tabla();
              
                javascript:ocultarVentana('capa_oscura');
                javascript:ocultarVentana('capa_clara');        
        },
        false
    );      




    var pdsr_cerrar = document.getElementById('pdsr_cerrar');
    pdsr_cerrar.addEventListener('click',
        function() {    
            javascript:ocultarVentana('capa_oscura');
            javascript:ocultarVentana('capa_clara');
        },
        false
    );           
   
    
    
};