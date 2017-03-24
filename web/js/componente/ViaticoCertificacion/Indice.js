

window.onload = function() {
  
   
    var mes = getParametroValor("mes");  
    var planf = getParametroValor("planf");  
         
    // cabecera
    var jsonPlanf = AjaxUrl( "../PlanFinanciero/Linea.json?registro="+planf );  
     var presupuesto_id = 0;
     
    if (jsonPlanf.toString().trim() != "[]")
    {
        var objetoJson = JSON.parse(jsonPlanf);       
        presupuesto_id = objetoJson[0].presupuesto_id;      
    }
    PresupuestoVigente_CabeceraLinea(presupuesto_id);
   
   
   
   // cuadricula
   var path = "../ViaticoCertificacionNumeracion/Coleccion/ListaMes?mes="+mes+"&planf="+planf;      
   AjaxPeticion(path,'tab_body');         
   ViaticoCertificacionNumeracion_listaMes_tabla(mes, planf);
   

    
   
    
    //nombremes    
    var mes = getParametroValor("mes");
    var jsonResponse = AjaxUrl( "../Mes/Linea.json?idregistro="+mes );    
   
    if (jsonResponse.toString().trim() != "[]")
    {
        var objetoJson = JSON.parse(jsonResponse);    
        var nombremes = document.getElementById('nombremes');        
        nombremes.innerHTML =   objetoJson[0].descripcion ;
        nombremes.style.color = "black";
    }                                                                
        





   
    






    var vci_agregar = document.getElementById('vci_agregar');
    vci_agregar.addEventListener('click',  vci_agregar_click, false);     
        
    vci_agregar.planf = planf;    
    vci_agregar.mes = mes;    
    
    function vci_agregar_click(evt)
    {
                mostrarVentana('capa_oscura');
                mostrarVentana('capa_clara');         
                
                AjaxPeticion( '../ViaticoCertificacionNumeracion/jspf/agregar.jspx' , 'capa_clara' );            
                dimensionarVentana('capa_clara', 700, 250);   
                
                ViaticoCertificacionNumeracion_agregar( evt.target.planf,                                                                 
                                                                evt.target.mes );
    }
    
    

        
        
    
};

