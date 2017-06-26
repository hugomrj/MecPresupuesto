

window.onload = function() {
   
    AjaxPeticion('../PresupuestoVigente/Coleccion/Lista?obj1=230&obj2=230','tab_body');      
            
    fomato_tabla_presupuesto_vigente_lista();        
    
    var vinculo ="";
    vinculo = "../PlanFinanciero/Distribucion.jspx?modo=viatico&registro=";                        
    funcion_tabla_presupuesto_registro(vinculo);
    
    
    
   //vi_direcciones
    
    var vi_direcciones = document.getElementById('vi_direcciones');
    vi_direcciones.addEventListener('click',
        function() 
        {
            window.location = "../ViaticoDistribucionMensual/Lista.jspx";                            
        }, 
        false
    );  
        
    
    

};

