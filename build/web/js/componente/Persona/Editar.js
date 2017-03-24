

window.onload = function() {
    
    
    PersonaJson();
    
    
    var Clase = "Persona";
    var filtroID = "?id="+document.getElementById('pe_persona').value;
    
    
    
    var guardar = document.getElementById('pe_guardar');
    guardar.addEventListener('click',
        function() 
        {
            var form = document.getElementById("pe_form");            
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
    


    var cancelar = document.getElementById('pe_cancelar');
    cancelar.addEventListener('click',
        function() 
        {
            window.location = "../"+Clase+"/Lista.jspx";      
        }, 
        false
    );  
    
    
    
    
    
}
