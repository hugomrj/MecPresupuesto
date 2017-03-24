

window.onload = function() {

    
           
    
    var guardar = document.getElementById('pa_guardar');
    guardar.addEventListener('click',
        function() 
        {

            var form = document.getElementById("pa_form");            
            var accion =  form.getAttribute('action') ; 
            var control = AjaxPeticionURL( accion, getDataForm(form) );                

            if (control == null){                
                window.location = "../Persona/Lista.jspx";                            
            }
            else{                    
                alerta_error(control);
            }
                
           
        }, 
        false
    );  
    
    
    var cancelar = document.getElementById('pa_cancelar');
    cancelar.addEventListener('click',
        function()
        {
            window.location = "../Persona/Lista.jspx";
        },
        false
    );        



}
