

window.onload = function() {
   
    AjaxPeticion('../PresupuestoVigente/Coleccion/Lista?obj1=230&obj2=230','tab_body');      
            
    fomato_tabla_presupuesto_vigente_lista();        
    
    var vinculo ="";
    vinculo = "../PlanFinanciero/Distribucion.jspx?modo=viatico&registro=";                        
    funcion_tabla_presupuesto_registro(vinculo);
    

};

