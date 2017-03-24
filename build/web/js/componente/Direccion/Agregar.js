

window.onload = function() {

    
           
    
    var guardar = document.getElementById('di_guardar');
    guardar.addEventListener('click',
        function() 
        {

            var form = document.getElementById("di_form");            
            var accion =  form.getAttribute('action') ; 
            var control = AjaxPeticionURL( accion, getDataForm(form) );                

            if (control == null){                
                window.location = "../Direccion/Lista.jspx";                            
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
            window.location = "../Direccion/Lista.jspx";
        },
        false
    );        



}
