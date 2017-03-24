

window.onload = function() {
  
   
   
    var mes = getParametroValor("mes");  
    var planf = getParametroValor("planf");  
    var codint = getParametroValor("codint");  
    var nroid = getParametroValor("nroid");  
       
    
         
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
   var path = "../ViaticoCertificacion/Coleccion/Exterior?codigointerno="+codint;      
   AjaxPeticion(path,'tab_body');      
   ViaticoCertificacionColeccionExterior_tabla_registro();
   
   
   //ViaticoCertificacionNumeracion_listaMes_tabla(mes, planf);
   
   
   
   
    
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
        
    var codigointerno = document.getElementById('codigointerno');    
    codigointerno.innerHTML = "Expediente nro. &nbsp; &nbsp; " + codint;
    codigointerno.style.color = "black";
        
        
        
        
  
        
        
        
        
        
        
        
    var vciext_agregar = document.getElementById('vciext_agregar');
    vciext_agregar.addEventListener('click',  vciext_agregar_click, false);           
    
    vciext_agregar.planf = planf;
    vciext_agregar.presupuesto_id = presupuesto_id;
    vciext_agregar.mes = mes;    
    vciext_agregar.nroid = nroid;
    vciext_agregar.codint = codint;
    
    function vciext_agregar_click(evt)
    {
                mostrarVentana('capa_oscura');
                mostrarVentana('capa_clara');         
                
                AjaxPeticion( '../ViaticoCertificacion/jspf/agregar_exterior.jspx' , 'capa_clara' );      
                dimensionarVentana('capa_clara', 900, 450);   
    
                
                
                ViaticoCertificacion_agregar_exterior( evt.target.planf, 
                                                                evt.target.presupuesto_id, 
                                                                evt.target.mes,
                                                                evt.target.nroid,
                                                                evt.target.codint
                                                                );
        
    }        
        
           
        
    
};

