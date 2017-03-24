

window.onload = function() {

    var idreg = getParametroValor("idreg");   
    CdpJson();
    
        
    var  aceptar = document.getElementById('cdpa_aceptar');
    aceptar.addEventListener('click',
        function()
        {  
            
            var cdpa_id = document.getElementById('cdpa_id').value;
            
            var form = document.getElementById("cdpa_form");            
            var accion =  form.getAttribute('action') ; 
            var control = AjaxPeticionURL( accion, getDataForm(form) );                

            if (control == null){                
                window.location = "../Cdp/Detalle.jspx?idreg="+idreg;                     
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
            window.location = "../Cdp/Detalle.jspx?idreg="+idreg;                     
        },
        false
    );      
    




}
