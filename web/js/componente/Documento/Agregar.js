

window.onload = function() {
               
              
    var doci_expediente_numero = document.getElementById( 'doci_expediente_numero');
    if (doci_expediente_numero.value == ""){
        doci_expediente_numero.value = 0;
    }    
    doci_expediente_numero.onblur  = function() {                
        zero( 'doci_expediente_numero' );     
    };        
              
    doci_expediente_numero.focus();
    doci_expediente_numero.select();
              
              
              
    var doci_direccion = document.getElementById( 'doci_direccion');
    if (doci_direccion.value == ""){
        doci_direccion.value = 0;
    }    
    doci_direccion.onblur  = function() {        
        valor_json_direccion ( "doci_direccion_descripcion", doci_direccion ) ; 
        zero( 'doci_direccion' );     
    };    
    


    var doci_qry_direccion = document.getElementById( 'doci_qry_direccion');
    doci_qry_direccion.addEventListener('click',
        function()
        {  
                mostrarVentana('capa_oscura_segunda');
                mostrarVentana('capa_clara_segunda');
                dimensionarVentana('capa_clara_segunda', 700, 500);                
                Busqueda_relacionada("Direccion", "doci_" , "di_direccion_descripcion", "Descripcion");      
        },
        false
    );    

    // agregar direciones si no existe
    var doci_qry_direccion_agregar = document.getElementById( 'doci_qry_direccion_agregar');
    doci_qry_direccion_agregar.addEventListener('click',
        function()
        {
                mostrarVentana('capa_oscura_segunda');
                mostrarVentana('capa_clara_segunda');
                dimensionarVentana('capa_clara_segunda', 700, 500);                    
                AjaxPeticion( '../Direccion/jspf/agregar_modal.jspx' , 'capa_clara_segunda' );            
                Direccion_agregar_modal();
        },
        false
    );    



              
              
    
    var guardar = document.getElementById('doci_guardar');
    guardar.addEventListener('click',
        function() 
        {            
            
            
            
            session = AjaxUrl ("../Usuario/Session") ;
            if (session == null){
                window.location = "../";    
                return;
            }
                        
            
            if (DocumentoAgregar_validacion()){
                
                var form = document.getElementById("doci_form");            
                var accion =  form.getAttribute('action') ; 
                var control = AjaxPeticionURL( accion, getDataForm(form) );                
                // si es numero es codigo id para ir a registro
                if (!(isNaN(control)))
                {   
                   //alert("es numero");                        
                    window.location = "../Documento/Registro.jspx?id="+control.toString().trim();                    
                }
                else
                {    
                    alerta_error(control);
                }

            }

        }, 
        false
    );  
    
    
    var cancelar = document.getElementById('doci_cancelar');
    cancelar.addEventListener('click',
        function()
        {
            window.location = "../Documento/Lista.jspx";
        },
        false
    );        



}





function DocumentoAgregar_validacion (  ){
    
    
    // si el valor de disponible es menor a lo certificado
    
    var doci_expediente_numero = document.getElementById('doci_expediente_numero');        
    if (doci_expediente_numero.value == 0) {
        alerta_error("Falta numero de expediente");
        document.getElementById('doci_expediente_numero').focus();
        return false;
    }         
    
    var doci_fecha_documento = document.getElementById('doci_fecha_documento');    
    if (doci_fecha_documento.value == '') {
        alerta_error("El valor de la fecha del documento esta vacio");
        doci_fecha_documento.focus();
        return false;
    }    
    
    var doci_direccion_descripcion = document.getElementById('doci_direccion_descripcion').innerHTML;
    if (doci_direccion_descripcion.toString().trim().length == 0 ) {
        alerta_error("Falta cargar direccion");
        document.getElementById('doci_direccion').focus();
        return false;
    }     
    
    return true;
    
    
    
}


