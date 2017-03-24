


function Llamado_busqueda( div ){


    AjaxPeticion('../Llamado/Sub/Busqueda.jspx', div);
    
    
    // div idconsulta
    AjaxPeticion('../Llamado/Consulta/Busqueda', 'idconsulta');
    sub_tabla_tabla_qry_llamado();
    
    
    
    //buscarTexto
    var buscarTexto = document.getElementById('buscarTexto');

    buscarTexto.addEventListener('keypress', function(e) {
            if (e.keyCode === 13) {
                
                AjaxPeticion('../Llamado/Consulta/Busqueda?buscar=' +buscarTexto.value,
                    'idconsulta');
                sub_tabla_tabla_qry_llamado();
            
            
            
            } 
        }, false
    ); 



    var cerrar_busqueda = document.getElementById('cerrar_busqueda');
    cerrar_busqueda.addEventListener('click',
        function() {    
            javascript:ocultarVentana('capa_oscura_segunda');
            javascript:ocultarVentana('capa_clara_segunda');            
        },
        
        false
    );           

};





    function sub_tabla_tabla_qry_llamado (  ){

        //tabla tab rol
        var tabla_coleccion = document.getElementById( "tabla_qry_llamado" );
        var rows = tabla_coleccion.getElementsByTagName('tr');

        for (var i=0 ; i < rows.length; i++)
        {
            rows[i].addEventListener ( 'click',
                function() {
                    
                    
                    registroid = this.getElementsByTagName('id')[0].dataset.linea_id;


                    var jsonResponse = AjaxUrl( "../Llamado/Linea.json?idreg="+registroid );    

                    if (jsonResponse.toString().trim() != "null")
                    {      
                        var objetoJson = JSON.parse(jsonResponse);    

                        var uocl_llamado = document.getElementById('uocl_llamado');  
                        uocl_llamado.value = objetoJson.llamado ;

                        var uocl_pac = document.getElementById('uocl_pac');  
                        uocl_pac.value = objetoJson.pac ;

                        var uocl_monto = document.getElementById('uocl_monto');  
                        uocl_monto.value = objetoJson.monto ;

                        var uocl_tipo = document.getElementById('uocl_tipo');  
                        uocl_tipo.value = "LL" ;

                        document.getElementById('cerrar_busqueda').click();
                        
                    }

                },
                false
            );
        }
    };


