


function PlanDetalle_sub_Agregar(  idreg ){



//    vdta_campos_interaccion();

    var pdsa_agregar = document.getElementById('pdsa_agregar');
    pdsa_agregar.addEventListener('click',
        function() {


                    var pdsa_plan_id = document.getElementById('pdsa_plan_id');
                    pdsa_plan_id.value = idreg;
           
               
                    var form = document.getElementById("pdsa_form");            
                    var accion =  form.getAttribute('action') ; 

                    AjaxPeticionURL( accion, getDataForm(form) );
                
                    
                    datos_tabla_ccld_tabla();
                    
                    pdsa_cerrar.click();                          
                    
               
                
        },
        false
    );
    
   
   
   
    var pdsa_cerrar = document.getElementById('pdsa_cerrar');
    pdsa_cerrar.addEventListener('click',
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
    







};
