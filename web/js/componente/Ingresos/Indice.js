

window.onload = function() {
         
    AjaxPeticion('../PresupuestoVigente/Coleccion/ListaIngreso','tab_body');      
        
    //fomato_tabla();        

    fomato_tabla_presupuesto_vigente_lista();        
        
    var link = "../Ingresos/Detalle.jspx?idreg=";                  
    funcion_tabla_presupuesto_registro(link);
    
};
