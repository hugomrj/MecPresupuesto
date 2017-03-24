
function DistribucionIngreso_editar ( id ){

    campos_interaccion_dime();


    
        
        var jsonResponse = AjaxUrl( "../DistribucionIngreso/Linea.json?idreg="+id );  
    
        if (jsonResponse.toString().trim() != "[]")
        {
            var objetoJson = JSON.parse(jsonResponse);                
        
        
            var dime_id = document.getElementById( 'dime_id');
            dime_id.value = objetoJson[0].id;        
        
        
            var dime_direccion = document.getElementById( 'dime_direccion');            
            dime_direccion.value = objetoJson[0].direccion;
        
            var dime_direccion_descripcion = document.getElementById( 'dime_direccion_descripcion');   
            dime_direccion_descripcion.innerHTML = objetoJson[0].direccion_descripcion;
        
        
        
        
            var dime_pf1 = document.getElementById( 'dime_pf1');   
            dime_pf1.value = objetoJson[0].pf1;
            dime_pf1.value = formatoNumero_p(dime_pf1.value);
        
        
            var dime_pf2 = document.getElementById( 'dime_pf2');   
            dime_pf2.value = objetoJson[0].pf2;
            dime_pf2.value = formatoNumero_p(dime_pf2.value);        
        
        
            var dime_pf3 = document.getElementById( 'dime_pf3');   
            dime_pf3.value = objetoJson[0].pf3;
            dime_pf3.value = formatoNumero_p(dime_pf3.value);        
        
            var dime_pf4 = document.getElementById( 'dime_pf4');   
            dime_pf4.value = objetoJson[0].pf4;
            dime_pf4.value = formatoNumero_p(dime_pf4.value);                
        
            var dime_pf5 = document.getElementById( 'dime_pf5');   
            dime_pf5.value = objetoJson[0].pf5;
            dime_pf5.value = formatoNumero_p(dime_pf5.value);                
        
            var dime_pf6 = document.getElementById( 'dime_pf6');   
            dime_pf6.value = objetoJson[0].pf6;
            dime_pf6.value = formatoNumero_p(dime_pf6.value);                
        
            var dime_pf7 = document.getElementById( 'dime_pf7');   
            dime_pf7.value = objetoJson[0].pf7;
            dime_pf7.value = formatoNumero_p(dime_pf7.value);                
        
            var dime_pf8 = document.getElementById( 'dime_pf8');   
            dime_pf8.value = objetoJson[0].pf8;
            dime_pf8.value = formatoNumero_p(dime_pf8.value);                
                
            var dime_pf9 = document.getElementById( 'dime_pf9');   
            dime_pf9.value = objetoJson[0].pf9;
            dime_pf9.value = formatoNumero_p(dime_pf9.value);                
                
            var dime_pf10 = document.getElementById( 'dime_pf10');   
            dime_pf10.value = objetoJson[0].pf10;
            dime_pf10.value = formatoNumero_p(dime_pf10.value);                
                
            var dime_pf11 = document.getElementById( 'dime_pf11');   
            dime_pf11.value = objetoJson[0].pf11;
            dime_pf11.value = formatoNumero_p(dime_pf11.value);                
                
            var dime_pf12 = document.getElementById( 'dime_pf12');   
            dime_pf12.value = objetoJson[0].pf12;
            dime_pf12.value = formatoNumero_p(dime_pf12.value);                
                
            
        
        }    
    
    
    
    
    var dime_editar = document.getElementById('dime_editar');
    dime_editar.addEventListener('click',
        function() {
               
                    var form = document.getElementById("dime_form");            
                    var accion =  form.getAttribute('action') ; 


                    AjaxPeticionURL( accion, getDataForm(form) );

                    datos_tabla_dite_tabla();
                    
                    
                    //datos_tabla_ccld_tabla();
                    
                    dime_cerrar.click();                          
                    
        },
        false
    );
    
       
    
    
    
    
    
    
   
    var dime_cerrar = document.getElementById('dime_cerrar');
    dime_cerrar.addEventListener('click',
        function() {    
            javascript:ocultarVentana('capa_oscura');
            javascript:ocultarVentana('capa_clara');
        },
        false
    );           
    
    


};








function campos_interaccion_dime ( )
{
    
    var dime_pf1 = document.getElementById( 'dime_pf1');
    if (dime_pf1.value == ""){
        dime_pf1.value = 0;
    }
    dime_pf1.onblur  = function() {
        zero( 'dime_pf1');
    };
    dime_pf1.onkeyup  = function() {
        dime_pf1.value = formatoNumero(dime_pf1.value);                       
    };    
    
    
    var dime_pf2 = document.getElementById( 'dime_pf2');
    if (dime_pf2.value == ""){
        dime_pf2.value = 0;
    }
    dime_pf2.onblur  = function() {
        zero( 'dime_pf2');
    };
    dime_pf2.onkeyup  = function() {
        dime_pf2.value = formatoNumero(dime_pf2.value);
    };    
    
    
    var dime_pf3 = document.getElementById( 'dime_pf3');
    if (dime_pf3.value == ""){
        dime_pf3.value = 0;
    }
    dime_pf3.onblur  = function() {
        zero( 'dime_pf3');
    };
    dime_pf3.onkeyup  = function() {
        dime_pf3.value = formatoNumero(dime_pf3.value);
    };        
    
    
    var dime_pf4 = document.getElementById( 'dime_pf4');
    if (dime_pf4.value == ""){
        dime_pf4.value = 0;
    }
    dime_pf4.onblur  = function() {
        zero( 'dime_pf4');
    };
    dime_pf4.onkeyup  = function() {
        dime_pf4.value = formatoNumero(dime_pf4.value);
    };        
    

    var dime_pf5 = document.getElementById( 'dime_pf5');
    if (dime_pf5.value == ""){
        dime_pf5.value = 0;
    }
    dime_pf5.onblur  = function() {
        zero( 'dime_pf5');
    };
    dime_pf5.onkeyup  = function() {
        dime_pf5.value = formatoNumero(dime_pf5.value);
    };            
    
    
    var dime_pf6 = document.getElementById( 'dime_pf6');
    if (dime_pf6.value == ""){
        dime_pf6.value = 0;
    }
    dime_pf6.onblur  = function() {
        zero( 'dime_pf6');
    };
    dime_pf6.onkeyup  = function() {
        dime_pf6.value = formatoNumero(dime_pf6.value);
    };            
    
    
    
    var dime_pf7 = document.getElementById( 'dime_pf7');
    if (dime_pf7.value == ""){
        dime_pf7.value = 0;
    }
    dime_pf7.onblur  = function() {
        zero( 'dime_pf7');
    };
    dime_pf7.onkeyup  = function() {
        dime_pf7.value = formatoNumero(dime_pf7.value);
    };            
    
    
    var dime_pf8 = document.getElementById( 'dime_pf8');
    if (dime_pf8.value == ""){
        dime_pf8.value = 0;
    }
    dime_pf8.onblur  = function() {
        zero( 'dime_pf8');
    };
    dime_pf8.onkeyup  = function() {
        dime_pf8.value = formatoNumero(dime_pf8.value);
    };            
    
    
    var dime_pf9 = document.getElementById( 'dime_pf9');
    if (dime_pf9.value == ""){
        dime_pf9.value = 0;
    }
    dime_pf9.onblur  = function() {
        zero( 'dime_pf9');
    };
    dime_pf9.onkeyup  = function() {
        dime_pf9.value = formatoNumero(dime_pf9.value);
    };            
    
    
    
    var dime_pf10 = document.getElementById( 'dime_pf10');
    if (dime_pf10.value == ""){
        dime_pf10.value = 0;
    }
    dime_pf10.onblur  = function() {
        zero( 'dime_pf10');
    };
    dime_pf10.onkeyup  = function() {
        dime_pf10.value = formatoNumero(dime_pf10.value);
    };            
    
    

    var dime_pf11 = document.getElementById( 'dime_pf11');
    if (dime_pf11.value == ""){
        dime_pf11.value = 0;
    }
    dime_pf11.onblur  = function() {
        zero( 'dime_pf11');
    };
    dime_pf11.onkeyup  = function() {
        dime_pf11.value = formatoNumero(dime_pf11.value);
    };            
    
    
    
    var dime_pf12 = document.getElementById( 'dime_pf12');
    if (dime_pf12.value == ""){
        dime_pf12.value = 0;
    }
    dime_pf12.onblur  = function() {
        zero( 'dime_pf12');
    };
    dime_pf12.onkeyup  = function() {
        dime_pf12.value = formatoNumero(dime_pf12.value);
    };            
    
    
    
}





