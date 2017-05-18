
function Programa_agregar ( cabecera ){

    
//    Programa_agregar_editar_json ( registro );
    var proga_tp = document.getElementById('proga_tp');
    proga_tp.value = cabecera;


    var proga_aceptar = document.getElementById('proga_aceptar');
    proga_aceptar.addEventListener('click',
        function() {

                var form = document.getElementById("proga_form");            
                var accion =  form.getAttribute('action') ; 
                var control = AjaxPeticionURL( accion, getDataForm(form) );      

            
                if (Programa_agregar_editar_validacion()){
                    if (control == null){        
                        AjaxPeticion('../../Programa/Coleccion/Lista?tp='+cabecera,'tab_body');    
                        Programa_sub_Registro();
                        proga_cerrar.click();
                    }
                    else{                    
                        alerta_error(control);
                    }                    
                }
            
            

                    
                    
        },
        false
    );
    
  

  
    var proga_cerrar = document.getElementById('proga_cerrar');
    proga_cerrar.addEventListener('click',
        function() {    
            javascript:ocultarVentana('capa_oscura');
            javascript:ocultarVentana('capa_clara');
        },
        false
    );           

};










function Programa_agregar_editar_validacion (  ){       
    
         
    var proga_descripcion = document.getElementById('proga_descripcion');    
    if (proga_descripcion.value == '') 
    {
        
        alerta_error("El valor de la descripcion esta vacia");
        proga_descripcion.focus();
        return false;
        
        
    }        
    return true;
}




