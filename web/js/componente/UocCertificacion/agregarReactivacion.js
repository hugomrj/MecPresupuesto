

function AgregarReactivacion (  idreg ){




    var uoca_presupuesto_id = document.getElementById('uoca_presupuesto_id');
    uoca_presupuesto_id.value = idreg;




    var uoca_agregar = document.getElementById('uoca_agregar');
    uoca_agregar.addEventListener('click',
        function() {

    /*
                    var uoca_presupuesto_id = document.getElementById('uoca_presupuesto_id');
                    uoca_presupuesto_id.value = idreg;
   */
  
                    var form = document.getElementById("uoca_form");            
                    var accion =  form.getAttribute('action') ; 

                    AjaxPeticionURL( accion, getDataForm(form) );
                    
                    datos_tabla_ucol_tabla( idreg );
                    
                    uoca_cerrar.click();                          
                    
        },
        false
    );
    
   
   
   
    var uoca_cerrar = document.getElementById('uoca_cerrar');
    uoca_cerrar.addEventListener('click',
        function() {    
            javascript:ocultarVentana('capa_oscura');
            javascript:ocultarVentana('capa_clara');
        },
        false
    );           
    


   
    var vinculo_reactivacion = document.getElementById('vinculo_reactivacion');
    vinculo_reactivacion.addEventListener('click',
        function() {  
                        
            mostrarVentana('capa_oscura_segunda');
            mostrarVentana('capa_clara_segunda');
            dimensionarVentana('capa_clara_segunda', 900, 700);                        
            Reactivacion_busqueda('capa_clara_segunda');
                        
        },
        false
    );           
    

/*
    var vinculo_llamado = document.getElementById('vinculo_llamado');
    vinculo_llamado.addEventListener('click',
        function() {  
            
            mostrarVentana('capa_oscura_segunda');
            mostrarVentana('capa_clara_segunda');
            dimensionarVentana('capa_clara_segunda', 900, 700);
                        
            Llamado_busqueda('capa_clara_segunda');
            
            
        },
        false
    );           
   */ 





};
