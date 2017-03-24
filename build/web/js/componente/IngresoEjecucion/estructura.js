
function IngresoEjecucion_estructura ( idreg ){


//    AjaxPeticion('../IngresoCertificacion/Coleccion/Estructura?idreg='+idreg,'tab_body');              
    AjaxPeticion('../IngresoEjecucion/Coleccion/Estructura?idreg='+idreg,'tab_body');              
    

    var iee_agregar = document.getElementById('iee_agregar');
    iee_agregar.addEventListener('click',
        function() {    
                        
                    
                mostrarVentana('capa_oscura');
                mostrarVentana('capa_clara');
                
                
                AjaxPeticion( '../IngresoEjecucion/Vista/Agregar' , 'capa_clara' );
                dimensionarVentana('capa_clara', 700, 250);                    
                IngresoEjecucion_agregar ( idreg );            
  
        },
        false
    );               
    




};


