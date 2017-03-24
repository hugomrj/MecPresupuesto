

function ViaticoCertificacion_agregar_exterior ( planf, presupuesto_id, mes, nroid, codint ){
    
   
    
    document.getElementById('vicae_certificacion_numeracion').value = nroid ;
    document.getElementById('vicae_presupuesto_id').value = presupuesto_id ;
    

    var disponible = document.getElementById('vicae_monto_disponible') ;
    disponible.value = 0;
    
    var jsonResponse = AjaxUrl( "../ViaticoCertificacion/SaldoMes.json?mes="+mes
        +"&planf="+planf );    
    if (jsonResponse.toString().trim() != "[]")
    {
        var objetoJson = JSON.parse(jsonResponse);              
        disponible.value =   objetoJson[0].disponible ;        
    }   
    

    // cargar dolar 
    var dolar = document.getElementById('vicae_dolar_cotizacion') ;   
    dolar.value = 0;
    
    var jsonResponse = AjaxUrl( "../ViaticoCertificacionNumeracion/Linea.json?idregistro="+nroid);    
    if (jsonResponse.toString().trim() != "[]")
    {
        var objetoJson = JSON.parse(jsonResponse);              
        dolar.value =   objetoJson[0].dolar ;        
    }   
    
    
    
    
    var vicae_cedula = document.getElementById( 'vicae_cedula');    
    vicae_cedula.value = 0;
    vicae_cedula.onblur  = function() {        
        
        if(!isNaN(vicae_cedula)){
            vicae_cedula.value = 0;
        }        
                
        var jsonCedula = AjaxUrl( "../Persona/Cedula.json?cedula="+vicae_cedula.value );   
        
        if (jsonCedula.toString().trim() != "[]")
        {
            var objetoJson = JSON.parse(jsonCedula);              
            vicae_persona.value =   objetoJson[0].persona ;        
        }
        else
        {
            vicae_cedula.value = 0;
            vicae_persona.value = 0;
        }
        zero( 'vicae_cedula' );     
        zero( 'vicae_persona' );    
        vicae_persona.onblur();
        //calculo_viatico();
    };          
    
    
    var vicae_persona = document.getElementById( 'vicae_persona');
    if (vicae_persona.value == ""){
        vicae_persona.value = 0;
    }        
    vicae_persona.onblur  = function() {        
        valor_json_persona ( "vicae_persona_descripcion", vicae_persona )     
        zero( 'vicae_persona' );     
        //calculo_viatico();
    };      
    var vicae_qry_persona = document.getElementById( 'vicae_qry_persona');
    vicae_qry_persona.addEventListener('click',
        function()
        {
                mostrarVentana('capa_oscura_segunda');
                mostrarVentana('capa_clara_segunda');
                dimensionarVentana('capa_clara_segunda', 700, 500);
                Busqueda_relacionada("Persona", "vicae_" , "vicae_persona_descripcion", "Descripcion");            
        },
        false
    );    
    
    
    
    
    // agregar si no existe
    var vicae_qry_persona_agregar = document.getElementById( 'vicae_qry_persona_agregar');
    vicae_qry_persona_agregar.addEventListener('click',
        function()
        {            
                mostrarVentana('capa_oscura_segunda');
                mostrarVentana('capa_clara_segunda');
                dimensionarVentana('capa_clara_segunda', 700, 500);
                    
                AjaxPeticion( '../Persona/jspf/agregar_modal.jspx' , 'capa_clara_segunda' );            
                dimensionarVentana('capa_clara_segunda', 800, 250)   ;
                
                Persona_agregar_modal();                
        },
        false
    );    
        
        
        
        
        
    var vicae_categoria_funcionario = document.getElementById( 'vicae_categoria_funcionario');
    if (vicae_categoria_funcionario.value == ""){
        vicae_categoria_funcionario.value = 0;
    }        
    vicae_categoria_funcionario.onblur  = function() {        
        valor_json_funcionario_categoria ( "vicae_categoria_funcionario_descripcion", vicae_categoria_funcionario )     
        zero( 'vicae_categoria_funcionario' );   
        calculo_viatico();
    };          
     


    var vicae_qry_categoria_funcionario = document.getElementById( 'vicae_qry_categoria_funcionario');
    vicae_qry_categoria_funcionario.addEventListener('click',
        function()
        {
            mostrarVentana('capa_oscura_segunda');
            mostrarVentana('capa_clara_segunda');
            dimensionarVentana('capa_clara_segunda', 700, 500);
            FuncionarioCategoria_ListaSimple("vicae_categoria_funcionario");        
        },
        false
    );        
        
    
    
    
    //vicae_destino
    var vicae_destino = document.getElementById( 'vicae_destino');
    if (vicae_destino.value == ""){
        vicae_destino.value = 0;
    }   
    vicae_destino.onblur  = function() {                
        valor_json_pais_ciudad( vicae_destino )     ;        
        zero( 'vicae_destino' );  
        calculo_viatico();
    };       
    
    
    
    var vicae_qry_destino = document.getElementById( 'vicae_qry_destino');
    vicae_qry_destino.addEventListener('click',
        function()
        {
                mostrarVentana('capa_oscura_segunda');
                mostrarVentana('capa_clara_segunda');
                dimensionarVentana('capa_clara_segunda', 700, 500);
                Busqueda_relacionada_Pais_ciudad("PaisCiudad", "vicae_" , "vicae_destino_descripcion", "ciudad");            
        },
        false
    );    
    
    
    
    var vicae_direccion = document.getElementById( 'vicae_direccion');
    if (vicae_direccion.value == ""){
        vicae_direccion.value = 0;
    }        
    vicae_direccion.onblur  = function() {        
        valor_json_direccion ( "vicae_direccion_descripcion", vicae_direccion )     
        zero( 'vicae_direccion' );     
    };         
    var vicae_qry_direccion = document.getElementById( 'vicae_qry_direccion');
    vicae_qry_direccion.addEventListener('click',
        function()
        {
                mostrarVentana('capa_oscura_segunda');
                mostrarVentana('capa_clara_segunda');
                dimensionarVentana('capa_clara_segunda', 700, 500);
                Busqueda_relacionada("Direccion", "vicae_" , "vicae_direccion_descripcion", "Descripcion");            
        },
        false
    );        
    


    // agregar direciones si no existe
    var vicae_qry_direccion_agregar = document.getElementById( 'vicae_qry_direccion_agregar');
    vicae_qry_direccion_agregar.addEventListener('click',
        function()
        {            
                mostrarVentana('capa_oscura_segunda');
                mostrarVentana('capa_clara_segunda');
                dimensionarVentana('capa_clara_segunda', 700, 500);
                    
                AjaxPeticion( '../Direccion/jspf/agregar_modal.jspx' , 'capa_clara_segunda' );            
                dimensionarVentana('capa_clara_segunda', 800, 250)   ;
                
                Direccion_agregar_modal();
                
        },
        false
    );    

   
   // checks
    var chk_pasaje = document.getElementById( 'chk_pasaje');
    chk_pasaje.addEventListener('change',
        function()
        {         
            calculo_viatico ();            
        },
        false
    );    

    var chk_alojamiento = document.getElementById( 'chk_alojamiento');
    chk_alojamiento.addEventListener('change',
        function()
        {         
            calculo_viatico ();
        },
        false
    );    

    var chk_alimentacion = document.getElementById( 'chk_alimentacion');
    chk_alimentacion.addEventListener('change',
        function()
        {         
            calculo_viatico ();
        },
        false
    );    
    
    
    
    
    var vicae_dias = document.getElementById( 'vicae_dias');    
    vicae_dias.onblur  = function() {        
        calculo_viatico ();
    };      
    
    
    
    var vicae_monto_disponible = document.getElementById( 'vicae_monto_disponible');    
    vicae_monto_disponible.value = formatoNumero_p(vicae_monto_disponible.value); 
    
    
    var vicae_dolar_cotizacion = document.getElementById( 'vicae_dolar_cotizacion');    
    vicae_dolar_cotizacion.value = formatoNumero_p(vicae_dolar_cotizacion.value);     
    
    
    
    
    
    
    var vicae_aceptar = document.getElementById('vicae_aceptar');
    vicae_aceptar.addEventListener('click',
        function( ) {
              
              
                if (ViaticoCertificacion_validacion()){
                    
                    // checks                        
                    var chk_pasaje = document.getElementById("chk_pasaje");  
                    if (chk_pasaje.checked){
                        document.getElementById("vicae_terminal_pasaje").value = 1;
                    }
                    var chk_alojamiento = document.getElementById("chk_alojamiento");  
                    if (chk_alojamiento.checked){
                        document.getElementById("vicae_terminal_alojamiento").value = 1;
                    }                        
                    var chk_alimentacion = document.getElementById("chk_alimentacion");  
                    if (chk_alimentacion.checked){
                        document.getElementById("vicae_terminal_alimentacion").value = 1;
                    }                        
                        
                        
                        
                

                    var form = document.getElementById("vicae_form");            
                    var accion =  form.getAttribute('action') ; 
                    var control = AjaxPeticionURL( accion, getDataForm(form) );                          
                    
                    if (control == null){                           
                                               
                        var path = "../ViaticoCertificacion/Coleccion/Exterior?codigointerno="+codint;                              
                        AjaxPeticion(path,'tab_body');       
                        ViaticoCertificacionColeccionExterior_tabla_registro( );
                        vicae_cerrar.click();
                        
                    }
                    else{                    
                        alerta_error(control);
                    }                    
                }
  
        },
        false
    );

    
    
    

    var vicae_cerrar = document.getElementById('vicae_cerrar');
    vicae_cerrar.addEventListener('click',
        function() {    
            javascript:ocultarVentana('capa_oscura');
            javascript:ocultarVentana('capa_clara');
        },
        false
    );   



}



function ViaticoCertificacion_validacion (  ){
    
    
    // si el valor de disponible es menor a lo certificado
    
    
    
    var vicae_persona_descripcion = document.getElementById('vicae_persona_descripcion').innerHTML;            
    if (vicae_persona_descripcion.toString().trim().length == 0) {
        alerta_error("Falta cargar persona");
        document.getElementById('vicae_cedula').focus();
        return false;
    }
        
    var vicae_categoria_funcionario_descripcion = document.getElementById('vicae_categoria_funcionario_descripcion').innerHTML;        
    if (vicae_categoria_funcionario_descripcion.toString().length == 0) {
        alerta_error("Falta cargar categoria");
        document.getElementById('vicae_categoria_funcionario').focus();
        return false;
    }        
        
    var vicae_destino_descripcion = document.getElementById('vicae_destino_descripcion').innerHTML;        
    if (vicae_destino_descripcion.toString().trim().length == 0 ) {
        alerta_error("Falta cargar destino");
        document.getElementById('vicae_destino_descripcion').focus();
        return false;
    }                

    var vicae_direccion_descripcion = document.getElementById('vicae_direccion_descripcion').innerHTML;
    if (vicae_direccion_descripcion.toString().trim().length == 0 ) {
        alerta_error("Falta cargar direccion");
        document.getElementById('vicae_direccion').focus();
        return false;
    }       
    

    var vicae_dias = document.getElementById('vicae_dias');        
    if (vicae_dias.value == 0) {
        alerta_error("Falta cargar dias");
        document.getElementById('vicae_dias').focus();
        return false;
    }       
    
    
    var vicae_fecha_inicio = document.getElementById('vicae_fecha_inicio');    
    if (vicae_fecha_inicio.value == '') {
        alerta_error("El valor de la fecha esta vacio");
        vicae_fecha_inicio.focus();
        return false;
    }
    
    
    var vicae_fecha_fin = document.getElementById('vicae_fecha_fin');    
    if (vicae_fecha_fin.value == '') {
        alerta_error("El valor de la fecha esta vacio");
        vicae_fecha_fin.focus();
        return false;
    }
    
    
    var monto = document.getElementById("vicae_monto_certificacion").value;        
    monto = monto.toString().trim().replace(/\./g,'');

    var disponible = document.getElementById("vicae_monto_disponible").value;        
    disponible = disponible.toString().trim().replace(/\./g,'');
   
    
    if ( (disponible.valueOf() - monto.valueOf()) < 0  ) {
        alerta_error("No hay suficiente saldo disponible");        
        return false;
    }
    
    
    
    return true;
    
    
    
}










function Busqueda_relacionada_Pais_ciudad ( strObjeto, strPrefijo, strRetorno, servlet  )
{


    var seleccionar_registro = function( strObjeto, strPrefijo, strRetorno, servlet )
    {
        
        
        //var tabla_qry = document.getElementById('tabla_qry_'+strObjeto.toLowerCase()).getElementsByTagName('tbody')[0];
        var tabla_qry = document.getElementById('tabla_qry_'+strObjeto.toLowerCase());
               
        var rows = tabla_qry.getElementsByTagName('tr');

        for (var i=0 ; i < rows.length; i++)
        {
            rows[i].addEventListener ( 'click',
                function() {

                    //registroid = this.getElementsByTagName(strObjeto.toLowerCase())[0].dataset.reg;
                    registroid = this.dataset.registro_id;    
                    
                    asignarValor( "vicae_destino", registroid );

                    document.getElementById("vicae_destino").onblur();  

                    ocultarVentana('capa_oscura_segunda');
                    ocultarVentana('capa_clara_segunda');
                                
                },
                false
            );

        }

    };


    var busqueda_registro = function( strObjeto, strPrefijo, strRetorno, servlet )
    {

        var buscar = document.getElementById('buscar');
        buscar.addEventListener('keyup',
            function(event) {

                if(event.keyCode == 13)
                {

                    AjaxPeticion( '../'+strObjeto+'/SubConsulta.do?jsp='+strPrefijo+'&buscar='
                            +document.getElementById('buscar').value ,
                            'idconsulta' );

                    seleccionar_registro( strObjeto, strPrefijo, strRetorno, servlet );
                    botones_sub_paginacion(  strObjeto, strPrefijo, strRetorno );

                }
            },
            false
        );


        var cerrar_busqueda = document.getElementById('cerrar_busqueda');
        cerrar_busqueda.addEventListener('click',
            function()
            {
                ocultarVentana('capa_oscura_segunda');
                ocultarVentana('capa_clara_segunda');
            },
            false
        );
    };



    var botones_sub_paginacion = function( strObjeto, strPrefijo, strRetorno, servlet )
    {

        var jspOrigen = strPrefijo;

        var vinculo = '../'+strObjeto+'/SubConsulta.do?jsp='+strPrefijo
                    +'&buscar='+document.getElementById('buscar').value ;

        var htmlElemento = "idconsulta";

        var paginacion =  document.getElementById( strPrefijo+'pagination');
        var page = paginacion.dataset.page;

        var lis = paginacion.getElementsByTagName("li");
        for (var i=0; i<lis.length; i++)
        {

            if ( (( lis[i].dataset.orden ) == 'sig')  ||  (( lis[i].dataset.orden ) == 'ant') )
            {

                if ( (( lis[i].dataset.orden ) == 'sig') )
                {
                    if ( document.getElementById( jspOrigen+'pag_sig') )
                    {
                        document.getElementById( jspOrigen+'pag_sig').addEventListener('click',
                            function()
                            {

                                AjaxPeticion(vinculo+'&page='+((parseInt(page)+1)), htmlElemento);

                                seleccionar_registro( strObjeto, strPrefijo, strRetorno, servlet );
                                botones_sub_paginacion ( strObjeto, strPrefijo, strRetorno, servlet );
                            },
                            false
                        );
                    }
                }

                if ( (( lis[i].dataset.orden ) == 'ant') )
                {
                    if ( document.getElementById( jspOrigen+'pag_ant') )
                    {
                        document.getElementById( jspOrigen+'pag_ant').addEventListener('click',
                            function()
                            {
                                AjaxPeticion(vinculo+'&page='+((parseInt(page)-1)), htmlElemento);

                                seleccionar_registro( strObjeto, strPrefijo, strRetorno, servlet );
                                botones_sub_paginacion ( strObjeto, strPrefijo, strRetorno, servlet );

                            },
                            false
                        );
                    }

                }

            }
            else
            {

                lis[i].addEventListener ( 'click',
                    function() {

                        AjaxPeticion(vinculo+'&page='
                            +(this.getElementsByTagName('a')[0].innerHTML.trim()),
                            htmlElemento);

                        seleccionar_registro( strObjeto, strPrefijo, strRetorno, servlet );
                        botones_sub_paginacion ( strObjeto, strPrefijo, strRetorno, servlet );

                    },
                    false
                );
            }
        }

    };


    AjaxPeticion('../'+strObjeto+'/Sub/Busqueda.jspx','capa_clara_segunda');
    busqueda_registro( strObjeto, strPrefijo, strRetorno, servlet );


    AjaxPeticion('../'+strObjeto+'/SubConsulta.do?jsp='+strPrefijo+'&buscar=', 'idconsulta');
    seleccionar_registro( strObjeto, strPrefijo, strRetorno, servlet );

    botones_sub_paginacion ( strObjeto, strPrefijo, strRetorno, servlet );

}







function valor_json_pais_ciudad ( valorcodigo )
{

        //  usar json
        var destino = document.getElementById("vicae_destino_descripcion");        
        
        var jsonResponse = AjaxUrl( "../PaisCiudad/Linea.json?idregistro="+valorcodigo.value );  
        
        if (jsonResponse.toString().trim() != "[]")
        {
            var objetoJson = JSON.parse(jsonResponse);                
            destino.innerHTML = objetoJson[0].pais + "&nbsp;  - &nbsp; "  + objetoJson[0].ciudad ;
        }
        else
        {
            destino.innerHTML = "" ;
        }
        
        
}    




function calculo_viatico ()
{


        var destino = document.getElementById("vicae_destino");   
        var categoria = document.getElementById("vicae_categoria_funcionario");   
    
        var costo = 0;        
        var jsonResponse = AjaxUrl( "../PaisCiudad/CostoDiario.json?destino="
                +destino.value
                +"&categoria="+categoria.value  );  
        
        if (jsonResponse.toString().trim() != "[]")
        {
            var objetoJson = JSON.parse(jsonResponse);                
            costo = objetoJson[0].costo ;            
            document.getElementById("vicae_tabla_valor").value = costo;            
        }
        else
        {
          document.getElementById("vicae_tabla_valor").value = 0;                          
        }
     

     
        
        var porcentaje = 0;
        var chk_pasaje = document.getElementById("chk_pasaje"); 
        var chk_alojamiento = document.getElementById("chk_alojamiento");  
        var chk_alimentacion = document.getElementById("chk_alimentacion");  
        
        
        
        if ( !(chk_pasaje.checked) 
                &&
            !(chk_alojamiento.checked)  
                &&
            !(chk_alimentacion.checked)  
            )
        {
            porcentaje = 100;     
            document.getElementById("porcentaje").innerHTML = porcentaje+"%"; 
        }
        

        if ( (chk_pasaje.checked) 
                &&
            (chk_alojamiento.checked)  
                &&
            !(chk_alimentacion.checked)  
            )
        {
            porcentaje = 30;
            document.getElementById("porcentaje").innerHTML = porcentaje+"%"; 
        }    

        if ( (chk_pasaje.checked) 
                &&
            !(chk_alojamiento.checked)  
                &&
            !(chk_alimentacion.checked)  
            )
        {
            porcentaje = 30;
            document.getElementById("porcentaje").innerHTML = porcentaje+"%"; 
        }    


    
        if ( (chk_pasaje.checked) 
                &&
            !(chk_alojamiento.checked)  
                &&
            (chk_alimentacion.checked)  
            )
        {
            porcentaje = 70;
            document.getElementById("porcentaje").innerHTML = porcentaje+"%"; 
        }        
        
        
        
        if ( (chk_pasaje.checked) 
                &&
            (chk_alojamiento.checked)  
                &&
            (chk_alimentacion.checked)  
            )
        {
            porcentaje = 20;            
            document.getElementById("porcentaje").innerHTML = porcentaje+"%"; 
        }        
                



        var dias = document.getElementById("vicae_dias");        
        var dolar = document.getElementById("vicae_dolar_cotizacion").value;    
        dolar = dolar.toString().trim().replace(/\./g,'');
        
        
        var monto = document.getElementById("vicae_monto_certificacion");        
        monto.value = ((((costo * porcentaje) / 100 ) * dias.value) * dolar )  ;
      
        monto.value = Math.round( monto.value);
    
        monto.value = formatoNumero_p(monto.value);     
        
        
}    