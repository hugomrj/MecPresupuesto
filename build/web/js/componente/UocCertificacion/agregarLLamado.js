


function AgregarLlamado (  idreg ){


    var uocl_presupuesto_id = document.getElementById('uocl_presupuesto_id');
    uocl_presupuesto_id.value = idreg;




    var uocl_agregar = document.getElementById('uocl_agregar');
    uocl_agregar.addEventListener('click',
        function() {

                    var form = document.getElementById("uocl_form");            
                    var accion =  form.getAttribute('action') ; 

                    AjaxPeticionURL( accion, getDataForm(form) );
                    
                    datos_tabla_ucol_tabla( idreg );
                    
                    uocl_cerrar.click();                          
                    
        },
        false
    );
    
   

    
    
   
    var uocl_cerrar = document.getElementById('uocl_cerrar');
    uocl_cerrar.addEventListener('click',
        function() {    
            javascript:ocultarVentana('capa_oscura');
            javascript:ocultarVentana('capa_clara');
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











