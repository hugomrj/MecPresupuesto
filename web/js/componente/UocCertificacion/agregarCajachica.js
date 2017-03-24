

function AgregarCajachica (  idreg ){




    var uocc_presupuesto_id = document.getElementById('uocc_presupuesto_id');
    uocc_presupuesto_id.value = idreg;




    var uocc_agregar = document.getElementById('uocc_agregar');
    uocc_agregar.addEventListener('click',
        function() {

                    var form = document.getElementById("uocc_form");            
                    var accion =  form.getAttribute('action') ; 

                    AjaxPeticionURL( accion, getDataForm(form) );
                    
                    datos_tabla_ucol_tabla( idreg );
                    
                    uocc_cerrar.click();                          
                    
        },
        false
    );
    
   
   
   
    var uocc_cerrar = document.getElementById('uocc_cerrar');
    uocc_cerrar.addEventListener('click',
        function() {    
            javascript:ocultarVentana('capa_oscura');
            javascript:ocultarVentana('capa_clara');
        },
        false
    );           
    







};
