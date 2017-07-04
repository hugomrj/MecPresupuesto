

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

    
    //?idreg=1
    var registro = getParametroValor("idreg");   
    var cdpa_estructura_id = document.getElementById('cdpa_estructura_id');
    cdpa_estructura_id.value = registro;
    
    
    
    var cdpa_unr = document.getElementById('cdpa_unr');
    cdpa_unr.onkeypress  = function (event) {
                        if (event.which == 13 || event.keyCode == 13) {                            
                            document.getElementById('cdpa_pac_numero').focus();
                        }
                        return true;
                    };


    var cdpa_pac_numero = document.getElementById('cdpa_pac_numero');
    cdpa_pac_numero.onkeypress  = function (event) {
                        if (event.which == 13 || event.keyCode == 13) {                            
                            document.getElementById('cdpa_cc').focus();
                        }
                        return true;
                    };

    var cdpa_cc = document.getElementById('cdpa_cc');
    cdpa_cc.onkeypress  = function (event) {
                        if (event.which == 13 || event.keyCode == 13) {                            
                            document.getElementById('cdpa_descripcion').focus();
                        }
                        return true;
                    };


    var cdpa_descripcion = document.getElementById('cdpa_descripcion');
    cdpa_descripcion.onkeypress  = function (event) {
                        if (event.which == 13 || event.keyCode == 13) {                            
                            document.getElementById('cdpa_certificacion_actual').focus();
                        }
                        return true;
                    };

    
    
    var cdpa_certificacion_actual = document.getElementById('cdpa_certificacion_actual');
    cdpa_certificacion_actual.onkeypress  = function (event) {
                        if (event.which == 13 || event.keyCode == 13) {                            
                            document.getElementById('cdpa_fecha').focus();
                        }
                        return true;
                    };    
    cdpa_certificacion_actual.onblur  = function() {        
         cdpa_certificacion_actual.value = formatoNumero_p(cdpa_certificacion_actual.value);     
    };    
    
    
    
    
    var cdpa_fecha = document.getElementById('cdpa_fecha');
    cdpa_fecha.onkeypress  = function (event) {
                        if (event.which == 13 || event.keyCode == 13) {                            
                            document.getElementById('cdpa_cdp_numero').focus();
                        }
                        return true;
                    };

    
    
    var cdpa_pac_numero = document.getElementById('cdpa_pac_numero');          
    cdpa_pac_numero.value = 0;
    
           
    cdpa_pac_numero.onblur  = function() {        
        cdpa_pac_numero.value = formatoNumero_p(cdpa_pac_numero.value);     
    };                  
           
           
           
    
    
           
    
    var guardar = document.getElementById('cdpa_guardar');
    guardar.addEventListener('click',
        function() 
        {



            if (CDPagregar_validacion()){

                    var form = document.getElementById("cdpa_form");            
                    var accion =  form.getAttribute('action') ; 
                    var control = AjaxPeticionURL( accion, getDataForm(form) );                

                    if (control == null){                
                        window.location = "../Cdp/Detalle.jspx?idreg="+cdpa_estructura_id.value;                      
                    }
                    else{                    
                        alerta_error(control);
                    }

            }               
            
        }, 
        false
    );  
    
    
    
    
    var cancelar = document.getElementById('cdpa_cancelar');
    cancelar.addEventListener('click',
        function()
        {
            
            window.location = "../Cdp/ConsolidadoObjetos.jspx";
        },
        false
    );        





}






function CDPagregar_validacion (  ){
    
    var cdpa_pac_numero = document.getElementById('cdpa_pac_numero');        
    if (cdpa_pac_numero.value == 0) {
        alerta_error("Falta pac numero");
        document.getElementById('cdpa_pac_numero').focus();
        return false;
    }       
    
    
    return true;
}