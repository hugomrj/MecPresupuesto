

window.onload = function() {
    
    DocumentoJson();        
    var codigoid = document.getElementById('doci_id').value;                
    
    
    var borrar = document.getElementById('doci_borrar');
    borrar.addEventListener('click',
        function() 
        {            
                
                var form = document.getElementById("doci_form");            
                var accion =  form.getAttribute('action') ; 
                var control = AjaxPeticionURL( accion, getDataForm(form) );                

                
                alert(control);
                
                if (control == null)
                {   
                                           
                    //window.location = "../Documento/Registro.jspx?id="+control.toString().trim();  
                    window.location = "../Documento/Lista.jspx";
                }
                else
                {    
                    alerta_error(control);
                }

        }, 
        false
    );  
        
    
    

    var cancelar = document.getElementById('doci_cancelar');
    cancelar.addEventListener('click',
        function()
        {
            window.location = "../Documento/Registro.jspx?id="+codigoid;                    
        },
        false
    );         
        
    
        
    
}
