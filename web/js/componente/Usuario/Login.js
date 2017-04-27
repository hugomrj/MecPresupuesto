


window.onload = function() {
            
    var mensaje = AjaxUrl('MensajeAction');    
    alerta_error(mensaje); 
    AjaxUrl('SessionErase.do');    
    

    var cuenta = document.getElementById('cuenta');        
    cuenta.onfocus  = function() {                
            recibirEnfoque('i1');            
    };
    cuenta.onblur  = function() {
            perderEnfoque('i1');
    };
    cuenta.addEventListener('keyup',
        function(event) {                
            if(event.keyCode == 13)
            {                   
                ingresar.click();            
            }            
        },
        false
    );
    
    
    
    var clave = document.getElementById('clave');        
    clave.onfocus  = function() {                
            recibirEnfoque('i2');            
    };
    clave.onblur  = function() {
            perderEnfoque('i2');
    };
    clave.addEventListener('keyup',
        function(event) {                
            if(event.keyCode == 13)
            {                   
                ingresar.click();            
            }            
        },
        false
    );

        
    
    var ingresar = document.getElementById('ingresar');
    ingresar.addEventListener('click',
        function() 
        {
            
            /*
            session = AjaxUrl ("../Usuario/Session") ;
            if (session == null){
                window.location = "../";    
                return;
            }
            else{
                
            }
           */
          
            javascript:document.form_login.submit(); 
            
            
        }, 
        false
    );  

     
                                        
};



































