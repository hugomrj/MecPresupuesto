
function IngresoCertificacion_estructura ( idreg ){


    AjaxPeticion('../IngresoCertificacion/Coleccion/Estructura?idreg='+idreg,'tab_body');              
    

    // agregar dite
    var ice_agregar = document.getElementById('ice_agregar');
    ice_agregar.addEventListener('click',
        function() {    
                        
                    
                mostrarVentana('capa_oscura');
                mostrarVentana('capa_clara');
                
                AjaxPeticion( '../IngresoCertificacion/Vista/Agregar' , 'capa_clara' );
            
                dimensionarVentana('capa_clara', 700, 250);                    

                IngresoCertificacion_agregar ( idreg );            
            
        },
        false
    );               
    


};


