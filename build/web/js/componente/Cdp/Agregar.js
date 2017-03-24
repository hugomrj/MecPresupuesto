

window.onload = function() {

    
    //?idreg=1
    var registro = getParametroValor("idreg");   
    var cdpa_estructura_id = document.getElementById('cdpa_estructura_id');
    cdpa_estructura_id.value = registro;
    
    
    
    
    
           
    
    var guardar = document.getElementById('cdpa_guardar');
    guardar.addEventListener('click',
        function() 
        {

            var form = document.getElementById("cdpa_form");            
            var accion =  form.getAttribute('action') ; 
            var control = AjaxPeticionURL( accion, getDataForm(form) );                

            if (control == null){                
                window.location = "../Cdp/Detalle.jspx?idreg="+cdpa_estructura_id.value;                      
            }
            else{                    
                alerta_error(control);
            }
        }, 
        false
    );  
    
    
    
    
    var cancelar = document.getElementById('cdpa_cancelar');
    cancelar.addEventListener('click',
        function()
        {
            
            window.location = "../Cdp/Detalle.jspx?idreg="+cdpa_estructura_id.value;
        },
        false
    );        





}
