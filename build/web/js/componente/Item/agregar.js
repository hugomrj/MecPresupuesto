

function Item_agregar ( niv ){


    var itea_nivel = document.getElementById('itea_nivel');
    itea_nivel.value = niv;




    var itea_aceptar = document.getElementById('itea_aceptar');
    itea_aceptar.addEventListener('click',
        function() {

                var form = document.getElementById("itea_form");            
                var accion =  form.getAttribute('action') ; 
                var control = AjaxPeticionURL( accion, getDataForm(form) );      



                if (Item_agregar_editar_validacion()){
                    if (control == null){        
                        
                        //AjaxPeticion('../../Subcomponente/Coleccion/Lista?com='+com,'tab_body');  
                        Item_formulario();

                        itea_cerrar.click();
                    }
                    else{                    
                        alerta_error(control);
                    }                    
                }
                    
        },
        false
    );
    
  

  
    var itea_cerrar = document.getElementById('itea_cerrar');
    itea_cerrar.addEventListener('click',
        function() {    
            javascript:ocultarVentana('capa_oscura');
            javascript:ocultarVentana('capa_clara');
        },
        false
    );           

};










function Item_agregar_editar_validacion (  ){       
            
    return true;
}







