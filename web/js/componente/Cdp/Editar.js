

window.onload = function() {
    
    
    


    // objeto
    var objeto = getParametroValor("obj");   
   
    var jsonResponse = AjaxUrl( "../Objeto/Linea.json?obj="+objeto);    
   
    if (jsonResponse.toString().trim() != "[]")
    {
        var objetoJson = JSON.parse(jsonResponse);              
        
        var obj = document.getElementById('obj');
        obj.value = objetoJson[0].obj ;        
        
        var objd = document.getElementById('objd');
        objd.value = objetoJson[0].descripcion ;        
        
    }   

    
    
    
    
    var idreg = getParametroValor("idreg");   

    CdpJson();
        
    

    var  aceptar = document.getElementById('cdpa_aceptar');
    aceptar.addEventListener('click',
        function()
        {  
            
            var cdpa_id = document.getElementById('cdpa_id').value;
            
            
            //var id = getParametroValor("id");                
            //window.location = "../"+Clase+"/Editar.jspx?id="+id;
            
            
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
