

window.onload = function() {
    
    DocumentoJson();
    
    formulario_detalle ( );
    
    var agregar = document.getElementById('doci_agregar');
    agregar.addEventListener('click',
        function()
        {
            window.location = "../Documento/Agregar.jspx";
        },
        false
    );          

    
    var  editar = document.getElementById('doci_editar');
    editar.addEventListener('click',
        function()
        {            
            var id = getParametroValor("id");    
            window.location = "../Documento/Editar.jspx?id="+id;
        },
        false
    );         
    
      
      
  
    var borrar = document.getElementById('doci_borrar');
    borrar.addEventListener('click',
        function()
        {    
            var id = getParametroValor("id");    
            window.location = "../Documento/Borrar.jspx?id="+id;
        },
        false
    );      
          
                    
    var listar = document.getElementById('doci_listar');
    listar.addEventListener('click',
        function()
        {
            window.location = "../Documento/Lista.jspx";
        },
        false
    );           
              
        
    
}




function botones_estados (  ){
    
    if(document.getElementById("dmhe_transpaso")){
        var dmhe_transpaso = document.getElementById("dmhe_transpaso");
        dmhe_transpaso.addEventListener('click',
            function() {   

                    AjaxPeticion( '../DocumentoMovimiento/jspf/transpaso.jspx' , 'capa_clara' );

                    mostrarVentana('capa_oscura');
                    mostrarVentana('capa_clara');                           
                            
                    dimensionarVentana('capa_clara', 900, 250);                    

                    var registro = getParametroValor("id");
                    movimiento_transpaso (  registro );        
            },
            false
        );               
    }
    

    if(document.getElementById("dmhe_salida")){
        var dmhe_salida = document.getElementById("dmhe_salida");
        dmhe_salida.addEventListener('click',
            function() {   

                    AjaxPeticion( '../DocumentoMovimiento/jspf/salida.jspx' , 'capa_clara' );

                    mostrarVentana('capa_oscura');
                    mostrarVentana('capa_clara');                           
      
                    dimensionarVentana('capa_clara', 900, 250);                    

                    var registro = getParametroValor("id");
                    movimiento_salida (  registro );        
            },
            false
        );               
    }
        

    if(document.getElementById("dmhe_archivar")){
        var dmhe_archivar = document.getElementById("dmhe_archivar");
        dmhe_archivar.addEventListener('click',
            function() {   

                    AjaxPeticion( '../DocumentoMovimiento/jspf/archivo.jspx' , 'capa_clara' );

                    mostrarVentana('capa_oscura');
                    mostrarVentana('capa_clara');                           
      
                    dimensionarVentana('capa_clara', 900, 250);                    

                    var registro = getParametroValor("id");
                    movimiento_archivo (  registro );        
            },
            false
        );               
    }
    
}



function movimiento_transpaso ( registro ){

    var dmcat_documento = document.getElementById( 'dmcat_documento');
    dmcat_documento.value = registro;

    var dmcat_usuario = document.getElementById( 'dmcat_usuario');    
    if (dmcat_usuario.value == ""){
        dmcat_usuario.value = 0;
    }    
    dmcat_usuario.onblur  = function() {        
        valor_json_usuario ( "dmcat_usuario_descripcion", dmcat_usuario ) ; 
        zero( 'dmcat_usuario' );     
    };       
    
    var dmcat_qry_usuario = document.getElementById( 'dmcat_qry_usuario');
    dmcat_qry_usuario.addEventListener('click',
        function()
        {
                mostrarVentana('capa_oscura_segunda');
                mostrarVentana('capa_clara_segunda');
                dimensionarVentana('capa_clara_segunda', 700, 500);
                Usuario_ListaSimple("dmcat_usuario");
        },
        false
    );    
    

    var dmcat_aceptar = document.getElementById( 'dmcat_aceptar');
    dmcat_aceptar.addEventListener('click',
        function() 
        {
            var form = document.getElementById("dmcat_form");            
            var accion =  form.getAttribute('action') ; 
            var control = AjaxPeticionURL( accion, getDataForm(form) );                

            if (control == null){                                
                dmcat_cerrar.click();
                formulario_detalle ( );                
            }
            else{                    
                alerta_error(control);
            }
        }, 
        false
    );  
    
    var dmcat_cerrar = document.getElementById('dmcat_cerrar');
    dmcat_cerrar.addEventListener('click',
        function()
        {
                ocultarVentana('capa_oscura');
                ocultarVentana('capa_clara');
        },
        false
    );            
}



function movimiento_salida ( registro ){

    var dmcas_documento = document.getElementById( 'dmcas_documento');
    dmcas_documento.value = registro;

    var dmcas_usuario = document.getElementById( 'dmcas_usuario');    
    dmcas_usuario.value = AjaxUrl("../Usuario/Session");
    dmcas_usuario.value = dmcas_usuario.value.toString().trim();
    
        
    var dmcas_aceptar = document.getElementById( 'dmcas_aceptar');
    dmcas_aceptar.addEventListener('click',
        function() 
        {
            var form = document.getElementById("dmcas_form");            
            var accion =  form.getAttribute('action') ; 
            var control = AjaxPeticionURL( accion, getDataForm(form) );                

            if (control == null){                                
                dmcas_cerrar.click();
                formulario_detalle ( );                
            }
            else{                    
                alerta_error(control);
            }
        }, 
        false
    );  
    
    var dmcas_cerrar = document.getElementById('dmcas_cerrar');
    dmcas_cerrar.addEventListener('click',
        function()
        {
                ocultarVentana('capa_oscura');
                ocultarVentana('capa_clara');
        },
        false
    );            
}


function movimiento_archivo ( registro ){

    var dmcaa_documento = document.getElementById( 'dmcaa_documento');
    dmcaa_documento.value = registro;

    var dmcaa_usuario = document.getElementById( 'dmcaa_usuario');    
    dmcaa_usuario.value = AjaxUrl("../Usuario/Session");
    dmcaa_usuario.value = dmcaa_usuario.value.toString().trim();
    
        
    var dmcaa_aceptar = document.getElementById( 'dmcaa_aceptar');
    dmcaa_aceptar.addEventListener('click',
        function() 
        {
            var form = document.getElementById("dmcaa_form");            
            var accion =  form.getAttribute('action') ; 
            var control = AjaxPeticionURL( accion, getDataForm(form) );                

            if (control == null){                                
                dmcaa_cerrar.click();
                formulario_detalle ( );                
            }
            else{                    
                alerta_error(control);
            }
        }, 
        false
    );  
    
    var dmcaa_cerrar = document.getElementById('dmcaa_cerrar');
    dmcaa_cerrar.addEventListener('click',
        function()
        {
                ocultarVentana('capa_oscura');
                ocultarVentana('capa_clara');
        },
        false
    );            
}




function formulario_detalle ( ){

    var codigoid = document.getElementById('doci_id').value;      

    // cuadricula de movimientos
    AjaxPeticion('../DocumentoMovimiento/Coleccion/Lista?doc='+codigoid,
        'movi_tabla');   

    // boton en el caso de ser propietario
    AjaxPeticion('../DocumentoMovimiento/HTML/Estado?doc='+codigoid,
        'movi_boton');       
    botones_estados (  );
    
    }