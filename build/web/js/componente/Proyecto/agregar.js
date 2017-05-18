
function Proyecto_agregar ( id, tp, pg, sp ){


    var proya_subprograma = document.getElementById('proya_subprograma');
    proya_subprograma.value = id;

    var proya_tp = document.getElementById('proya_tp');
    proya_tp.value = tp;

    var proya_pg = document.getElementById('proya_pg');
    proya_pg.value = pg;

    var proya_sp = document.getElementById('proya_sp');
    proya_sp.value = sp;

    var proya_py = document.getElementById('proya_py');
    proya_py.focus();
    proya_py.setSelectionRange(0, proya_py.value.length);            


    var proya_aceptar = document.getElementById('proya_aceptar');
    proya_aceptar.addEventListener('click',
        function() {

                var form = document.getElementById("proya_form");            
                var accion =  form.getAttribute('action') ; 
                var control = AjaxPeticionURL( accion, getDataForm(form) );      

                if (Subprograma_agregar_editar_validacion()){
                    if (control == null){        
                        
                        AjaxPeticion('../../Proyecto/Coleccion/Lista?id='+id,'tab_body');  
                        Proyecto_sub_Registro();
                        
                        proya_cerrar.click();
                    }
                    else{                    
                        alerta_error(control);
                    }                    
                }
                    
        },
        false
    );
    
  

  
    var proya_cerrar = document.getElementById('proya_cerrar');
    proya_cerrar.addEventListener('click',
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







