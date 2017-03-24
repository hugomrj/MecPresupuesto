


function Reactivacion_busqueda( div ){


    AjaxPeticion('../Reactivacion/Sub/Busqueda.jspx', div);
    
       
    
    
    // div idconsulta
    AjaxPeticion('../Reactivacion/Consulta/Busqueda', 'idconsulta');
    sub_tabla_tabla_qry_reactivacion();
    
    //buscarTexto
   
    
    var buscarTexto = document.getElementById('buscarTexto');

    buscarTexto.addEventListener('keypress', function(e) {
            if (e.keyCode === 13) {
                
                AjaxPeticion('../Reactivacion/Consulta/Busqueda?buscar=' +buscarTexto.value,
                    'idconsulta');
                sub_tabla_tabla_qry_reactivacion();
            
            
                    // creo que hay que darle funcionalidad aca
            
            
            
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





    function sub_tabla_tabla_qry_reactivacion (  ){

        //tabla tab rol
        var tabla_coleccion = document.getElementById( "tabla_qry_reactivacion" );
        var rows = tabla_coleccion.getElementsByTagName('tr');

        for (var i=0 ; i < rows.length; i++)
        {
            rows[i].addEventListener ( 'click',
                function() {
                    
                    
                    registroid = this.getElementsByTagName('id')[0].dataset.linea_id;

//                    alert(registroid);
  
                    var jsonResponse = AjaxUrl( "../Reactivacion/Linea.json?idreg="+registroid );    

                    if (jsonResponse.toString().trim() != "null")
                    {      

                        var objetoJson = JSON.parse(jsonResponse);    

                        var uoca_cc = document.getElementById('uoca_cc');  
                        uoca_cc.value = objetoJson.cc ;

                        var uoca_llamado = document.getElementById('uoca_llamado');  
                        uoca_llamado.value = objetoJson.llamado ;

                        var uoca_proveedor = document.getElementById('uoca_proveedor');  
                        uoca_proveedor.value = objetoJson.proveedor ;

                        var uoca_pac = document.getElementById('uoca_pac');  
                        if( objetoJson.pac ) {
                            uoca_pac.value = objetoJson.pac ;
                        }
                        else
                        {
                            uoca_pac.value = "";
                        }

                        var uoca_monto = document.getElementById('uoca_monto');  
                        uoca_monto.value = objetoJson.monto ;

                        var pdsa_tipo = document.getElementById('uoca_tipo');  
                        pdsa_tipo.value = "RA" ;


                        document.getElementById('cerrar_busqueda').click();
                        
                    }

                },
                false
            );
        }
    };


