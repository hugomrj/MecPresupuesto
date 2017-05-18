
function Subprograma_agregar ( id, tp, pg ){


    var subpa_programa = document.getElementById('subpa_programa');
    subpa_programa.value = id;

    var subpa_tp = document.getElementById('subpa_tp');
    subpa_tp.value = tp;

    var subpa_pg = document.getElementById('subpa_pg');
    subpa_pg.value = pg;

    var subpa_sp = document.getElementById('subpa_sp');
    subpa_sp.focus();
    subpa_sp.setSelectionRange(0, subpa_sp.value.length);            


    var subpa_aceptar = document.getElementById('subpa_aceptar');
    subpa_aceptar.addEventListener('click',
        function() {

                var form = document.getElementById("subpa_form");            
                var accion =  form.getAttribute('action') ; 
                var control = AjaxPeticionURL( accion, getDataForm(form) );      

                if (Subprograma_agregar_editar_validacion()){
                    if (control == null){        
                        
                        AjaxPeticion('../../Subprograma/Coleccion/Lista?id='+id,'tab_body');  
                        Subprograma_sub_Registro();
                        
                        subpa_cerrar.click();
                    }
                    else{                    
                        alerta_error(control);
                    }                    
                }
                    
        },
        false
    );
    
  

  
    var subpa_cerrar = document.getElementById('subpa_cerrar');
    subpa_cerrar.addEventListener('click',
        function() {    
            javascript:ocultarVentana('capa_oscura');
            javascript:ocultarVentana('capa_clara');
        },
        false
    );           

};










function Subprograma_agregar_editar_validacion (  ){       
            
    return true;
}







