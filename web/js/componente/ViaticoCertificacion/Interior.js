

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
   var path = "../ViaticoCertificacion/Coleccion/Interior?codigointerno="+codint;      
   AjaxPeticion(path,'tab_body');      
   
   ViaticoCertificacionColeccionInterior_tabla_registro();
   
   
   
   
    
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
    codigointerno.innerHTML = "Codigo nro. &nbsp; &nbsp; " + codint;
    codigointerno.style.color = "black";
               
        
    var vcint_agregar = document.getElementById('vcint_agregar');
    vcint_agregar.addEventListener('click',  vcint_agregar_click, false);           
    
    vcint_agregar.planf = planf;
    vcint_agregar.presupuesto_id = presupuesto_id;
    vcint_agregar.mes = mes;    
    vcint_agregar.nroid = nroid;
    vcint_agregar.codint = codint;
    
    
    
    
    function vcint_agregar_click(evt)
    {
                mostrarVentana('capa_oscura');
                mostrarVentana('capa_clara');         
                
                AjaxPeticion( '../ViaticoCertificacion/jspf/agregar_interior.jspx' , 'capa_clara' );            
                dimensionarVentana('capa_clara', 900, 250);   
                
                ViaticoCertificacion_agregar_interior( evt.target.planf, 
                                                                evt.target.presupuesto_id, 
                                                                evt.target.mes,
                                                                evt.target.nroid,
                                                                evt.target.codint
                                                                );
      
    }
    
        
    
};

