

function Direccion_agregar_modal() {

    
    var guardar = document.getElementById('di_guardar');
    guardar.addEventListener('click',
        function() 
        {

            var form = document.getElementById("di_form");            
            var accion =  form.getAttribute('action') ; 
            var control = AjaxPeticionURL( accion, getDataForm(form) );                

            if (control == null)
            {                
            
                
                ocultarVentana('capa_oscura_segunda');
                ocultarVentana('capa_clara_segunda');
                //window.location = "../Direccion/Lista.jspx";                            
                
                
                
            }
            else{                    
                alerta_error(control);
            }
                
           
        }, 
        false
    );  
    
    
    var cancelar = document.getElementById('di_cancelar');
    cancelar.addEventListener('click',
        function()
        {
            ocultarVentana('capa_oscura_segunda');
            ocultarVentana('capa_clara_segunda');
        },
        false
    );        



}
