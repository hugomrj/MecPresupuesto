
var id = 0


function  DistribucionSubcomponente_registro ( parametro_id ){

    id = parametro_id;

    DistribucionSubcomponente_registro_jsom(id);
    

    // jsom
    
    var ascr_subcomponente = document.getElementById( 'ascr_subcomponente');        
    ascr_subcomponente.onblur  = function() {        
                
         distribucion_sub_componente_jsom_registro ( this.value );         
        document.getElementById( 'ascr_monto' ).focus();    
        
         
    };          
         
    

    var ascr_monto = document.getElementById( 'ascr_monto');        
    ascr_monto.onfocus  = function() {        
        this.setSelectionRange (0, this.value.length);
    };          
    ascr_monto.onblur  = function() {                    
            this.value = formatoNumero_p(this.value);
    };                   
         
         



    var ascr_qry_subcomponente = document.getElementById( 'ascr_qry_subcomponente');
    ascr_qry_subcomponente.addEventListener('click',
        function()
        {
            
                mostrarVentana('capa_oscura3');
                mostrarVentana('capa_clara3');
                dimensionarVentana('capa_clara3', 700, 500);
                Busqueda_relacionada_Subcomponente_registro("Subcomponente", "asca_" , "ascae_subcomponente_descripcion", "Descripcion");            
            
        },
        false
    );    





    var ascr_editar = document.getElementById('ascr_editar');
    ascr_editar.addEventListener('click',
        function( ) {


            if ( DistribucionSubcomponenteRegistro_validacion(id) ){

                    var form = document.getElementById("ascr_form");            
                    //var accion =  form.getAttribute('action') ; 
                    var accion =  "../../DistribucionSubcomponente/Controlador/Editar" ;
                    
                    var control = AjaxPeticionURL( accion, getDataForm(form) );      

                    if (control == null){                              
                        
                        var ascr_presupuesto = document.getElementById( 'ascr_presupuesto');   
                        DistribucionSubcomponente_subtabla( ascr_presupuesto.value );
                        ascr_cerrar.click();
                    }
                    else{                    
                        alerta_error(control);
                    }                    
                }
                    
        },
        false
    );





    var ascr_borrar = document.getElementById('ascr_borrar');
    ascr_borrar.addEventListener('click',
        function( ) {




                    var form = document.getElementById("ascr_form");            
                    //var accion =  form.getAttribute('action') ; 
                    var accion =  "../../DistribucionSubcomponente/Controlador/Borrar" ;
                    
                    var control = AjaxPeticionURL( accion, getDataForm(form) );      

                    if (control == null){                              
                        
                        var ascr_presupuesto = document.getElementById( 'ascr_presupuesto');   
                        DistribucionSubcomponente_subtabla( ascr_presupuesto.value );
                        ascr_cerrar.click();
                    }
                    else{                    
                        alerta_error(control);
                    }                    

                    
        },
        false
    );




   
    var ascr_cerrar = document.getElementById('ascr_cerrar');
    ascr_cerrar.addEventListener('click',
        function() {    
            javascript:ocultarVentana('capa_clara_segunda');
            javascript:ocultarVentana('capa_oscura_segunda');
        },
        false
    );           
    





        
    }







function Busqueda_relacionada_Subcomponente_registro ( strObjeto, strPrefijo, strRetorno, servlet  )
{


    var seleccionar_registro = function( strObjeto, strPrefijo, strRetorno, servlet )
    {
        
        
        var tabla_qry = document.getElementById('tabla_qry_Subcomponente');
        
               
        var rows = tabla_qry.getElementsByTagName('tr');

        for (var i=0 ; i < rows.length; i++)
        {
            rows[i].addEventListener ( 'click',
                function() {

                    //registroid = this.getElementsByTagName(strObjeto.toLowerCase())[0].dataset.reg;
                    registroid = this.dataset.registro_id;    
                    
                    //asignarValor( strPrefijo+strObjeto.toLowerCase(), registroid );

                    //document.getElementById(strPrefijo+strObjeto.toLowerCase()).onblur();  
                    
                    
                    document.getElementById('ascr_subcomponente').value = registroid ;  
                    document.getElementById('ascr_subcomponente').onblur();  
                    

                    ocultarVentana('capa_oscura3');
                    ocultarVentana('capa_clara3');
                
                                
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
                ocultarVentana('capa_oscura3');
                ocultarVentana('capa_clara3');
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


    AjaxPeticion('../../Subcomponente/Sub/Busqueda.jspx','capa_clara3');
    busqueda_registro( strObjeto, strPrefijo, strRetorno, servlet );


    AjaxPeticion('../../Subcomponente/SubConsulta.do?jsp='+strPrefijo+'&buscar=', 'idconsulta');
    seleccionar_registro( strObjeto, strPrefijo, strRetorno, servlet );

    botones_sub_paginacion ( strObjeto, strPrefijo, strRetorno, servlet );

}





function distribucion_sub_componente_jsom_registro ( id )
{


    var jsonResponse = AjaxUrl( "../../Subcomponente/Registro.json?subcom="+id );    
   
    if (jsonResponse.toString().trim() != "[]")
    {
        var objetoJson = JSON.parse(jsonResponse);              
        
        
        var ascr_subcomponente_descripcion = document.getElementById( 'ascr_subcomponente_descripcion');    
        ascr_subcomponente_descripcion.innerHTML =   objetoJson[0].descripcion ;        
                
        var eje = document.getElementById( 'eje');    
        eje.value =   objetoJson[0].eje ;        
        
        var eje_descripcion = document.getElementById( 'eje_descripcion');    
        eje_descripcion.innerHTML =   objetoJson[0].eje_descripcion ;        
        
        var componente = document.getElementById( 'componente');    
        componente.value =   objetoJson[0].componente ;        
        
        var componente_descripcion = document.getElementById( 'componente_descripcion');    
        componente_descripcion.value =   objetoJson[0].componente_descripcion ;        
                
        
        
        
    }   
    
    else
    {  
        document.getElementById( 'ascr_subcomponente').value =  0 ;    
        
        document.getElementById( 'ascr_subcomponente_descripcion').innerHTML =  "" ;    
        
        document.getElementById( 'eje').value =  0 ; 
        
        document.getElementById( 'eje_descripcion').innerHTML =  "" ;    
        
        document.getElementById( 'componente').value =  0 ; 
        
        document.getElementById( 'componente_descripcion').innerHTML =  "" ;               
                
        
    }
    
}








function DistribucionSubcomponenteRegistro_validacion ( id ){
    
    
    
    
    var proya_ideal = document.getElementById('proya_ideal').value;  
    proya_ideal = quitapunto(proya_ideal);
    proya_ideal = parseInt(proya_ideal);
    
    
    var suma_subcomponente = 0;    
    var jsonResponse = AjaxUrl( "../../DistribucionSubcomponente/PresupuestoSuma.json?id="+id );    
    if (jsonResponse.toString().trim() != "[{}]")
    {
        var objetoJson = JSON.parse(jsonResponse); 
        suma_subcomponente =  objetoJson[0].sumamonto ;  
                
    }
    
    var ascr_monto = document.getElementById('ascr_monto').value;  
    ascr_monto  = parseInt(quitapunto(ascr_monto));
    
    suma_subcomponente = suma_subcomponente + parseInt(ascr_monto);
    
    
    if (parseInt(proya_ideal) < parseInt(suma_subcomponente))
    {
        alerta_error("Error en valores de presupuesto ideal o subcomponentes");
        return false;
    }
    
    // controlar que exista sub compoente
    
    return true;
}








function DistribucionSubcomponente_registro_jsom ( id ){
    
    
    var jsonResponse = AjaxUrl( "../../DistribucionSubcomponente/LineaCompleta.json?id="+id );    
    
    
    
    
    if (jsonResponse.toString().trim() != "[]")
    {
        var objetoJson = JSON.parse(jsonResponse); 
        
        var ascr_id = document.getElementById( 'ascr_id');    
        ascr_id.value =   id ;   
        

        var ascr_presupuesto = document.getElementById( 'ascr_presupuesto');    
        ascr_presupuesto.value =   objetoJson[0].presupuesto ;                
        
        var eje = document.getElementById( 'eje');    
        eje.value =   objetoJson[0].eje ;                
        
        var eje_descripcion = document.getElementById( 'eje_descripcion');    
        eje_descripcion.innerHTML =   objetoJson[0].eje_descripcion ;                

        var componente = document.getElementById( 'componente');    
        componente.value =   objetoJson[0].componente ;                        
                
        var componente_descripcion = document.getElementById( 'componente_descripcion');    
        componente_descripcion.innerHTML =   objetoJson[0].componente_descripcion ;           
        
        
        var ascr_subcomponente = document.getElementById( 'ascr_subcomponente');    
        ascr_subcomponente.value =   objetoJson[0].subcomponente ;             
        
        
        var ascr_subcomponente_descripcion = document.getElementById( 'ascr_subcomponente_descripcion');    
        ascr_subcomponente_descripcion.innerHTML =   objetoJson[0].subcomponente_descripcion ;            
        
        var ascr_monto = document.getElementById( 'ascr_monto');    
        ascr_monto.value =   objetoJson[0].monto ;            
        ascr_monto.value = formatoNumero_p(ascr_monto.value);
        

        
                
                
                
    }
    
    
    
    
    
}






