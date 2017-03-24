

window.onload = function() {
  
   
    var mes = getParametroValor("mes");  
    var uoc_id = getParametroValor("uoc_id");  
         
    // cabecera
    Cajachica_CabeceraLinea(uoc_id);    
   
    
    
   
   // cuadricula
   var path = "../CajaChicaCertificacion/Coleccion/ListaMes?mes="+mes+"&uoc_id="+uoc_id;      
   AjaxPeticion(path,'tab_body');         
   CajachicaDistribucion_listaMes_tabla( mes, uoc_id );
   
   
   
   
    
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
        
    vci_agregar.uoc_id = uoc_id;    
    vci_agregar.mes = mes;    
    
    function vci_agregar_click(evt)
    {
                mostrarVentana('capa_oscura');
                mostrarVentana('capa_clara');         
                
                AjaxPeticion( '../CajachicaCertificacion/jspf/agregar.jspx' , 'capa_clara' );          
                
                
                dimensionarVentana('capa_clara', 700, 250);   
                
                CajachicaCertificacion_agregar( evt.target.uoc_id,                                                                 
                                                                evt.target.mes );
                                                                
    }
    
    
  
        
    
};

