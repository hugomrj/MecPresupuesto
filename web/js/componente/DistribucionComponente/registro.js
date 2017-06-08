
var id = 0


function  DistribucionComponente_registro ( parametro_id ){

    id = parametro_id;

    DistribucionComponente_registro_jsom(id);
    

    // jsom
    
    var ascr_item = document.getElementById( 'ascr_item');        
    ascr_item.onblur  = function() {        
                
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
         
         



    var ascr_qry_item = document.getElementById( 'ascr_qry_item');
    ascr_qry_item.addEventListener('click',
        function()
        {
            
                mostrarVentana('capa_oscura3');
                mostrarVentana('capa_clara3');
                dimensionarVentana('capa_clara3', 700, 500);
                
                Busqueda_relacionada_Item("Item", "asca_" , "asca_item_descripcion", "Descripcion");            
            
        },
        false
    );    





    var ascr_editar = document.getElementById('ascr_editar');
    ascr_editar.addEventListener('click',
        function( ) {


            if ( DistribucionSubcomponenteRegistro_validacion(id) ){

                    var form = document.getElementById("ascr_form");            
                    //var accion =  form.getAttribute('action') ; 
                    var accion =  "../../DistribucionComponente/Controlador/Editar" ;
                    
                    var control = AjaxPeticionURL( accion, getDataForm(form) );      

                    if (control == null){                              
                        
                        var ascr_presupuesto = document.getElementById( 'ascr_presupuesto');   
                        
                        
                        DistribucionComponente_subtabla( ascr_presupuesto.value );
                        
                        
                        
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
                    var accion =  "../../DistribucionComponente/Controlador/Borrar" ;
                    
                    var control = AjaxPeticionURL( accion, getDataForm(form) );      

                    if (control == null){                              
                        
                        var ascr_presupuesto = document.getElementById( 'ascr_presupuesto');   
                        DistribucionComponente_subtabla( ascr_presupuesto.value );
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





function Busqueda_relacionada_Item ( strObjeto, strPrefijo, strRetorno, servlet  )
{


    var seleccionar_registro = function( strObjeto, strPrefijo, strRetorno, servlet )
    {
        
        
        var tabla_qry = document.getElementById('tabla_qry_item');
        
               
        var rows = tabla_qry.getElementsByTagName('tr');

        for (var i=0 ; i < rows.length; i++)
        {
            rows[i].addEventListener ( 'click',
                function() {

                    registroid = this.dataset.registro_id;    
                    
                    document.getElementById('ascr_item').value = registroid ;  
                    document.getElementById('ascr_item').onblur();  
                    

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

                    AjaxPeticion( '../../'+strObjeto+'/SubConsulta.do?jsp='+strPrefijo+'&buscar='
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


    AjaxPeticion('../../Item/Sub/Busqueda.jspx','capa_clara3');
    busqueda_registro( strObjeto, strPrefijo, strRetorno, servlet );


    AjaxPeticion('../../Item/SubConsulta.do?jsp='+strPrefijo+'&buscar=', 'idconsulta');
    seleccionar_registro( strObjeto, strPrefijo, strRetorno, servlet );

    botones_sub_paginacion ( strObjeto, strPrefijo, strRetorno, servlet );

}













function distribucion_sub_componente_jsom_registro ( id )
{


    //var jsonResponse = AjaxUrl( "../../Subcomponente/Registro.json?subcom="+id );    
    var jsonResponse = AjaxUrl( "../../Item/Registro.json?ite="+id );    
   
    if (jsonResponse.toString().trim() != "[]")
    {
        var objetoJson = JSON.parse(jsonResponse);              
        
        
        
        var ascr_item_descripcion = document.getElementById( 'ascr_item_descripcion');    
        ascr_item_descripcion.innerHTML =   objetoJson[0].item_descripcion ;        
                
        var eje = document.getElementById( 'eje');    
        eje.value =   objetoJson[0].eje ;        
        
        var eje_descripcion = document.getElementById( 'eje_descripcion');    
        eje_descripcion.innerHTML =   objetoJson[0].eje_descripcion ;        
        
        var componente = document.getElementById( 'componente');    
        componente.value =   objetoJson[0].componente ;        
        
        var componente_descripcion = document.getElementById( 'componente_descripcion');    
        componente_descripcion.value =   objetoJson[0].componente_descripcion ;
        
        
        var nivel = document.getElementById( 'nivel');    
        nivel.value =   objetoJson[0].nivel ;        
        
        var nivel_descripcion = document.getElementById( 'nivel_descripcion');    
        nivel_descripcion.value =   objetoJson[0].nivel_descripcion ;                 
                
        
        
        
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
    
    var jsonResponse = AjaxUrl( "../../DistribucionComponente/PresupuestoSuma.json?id="+id );    
    
    
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








function DistribucionComponente_registro_jsom ( id ){
    
    
    var jsonResponse = AjaxUrl( "../../DistribucionComponente/LineaCompleta.json?id="+id );    
    
    
    
    
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
        
        
        var nivel = document.getElementById( 'nivel');    
        nivel.value =   objetoJson[0].nivel ;                        
                
        var nivel_descripcion = document.getElementById( 'nivel_descripcion');    
        nivel_descripcion.innerHTML =   objetoJson[0].nivel_descripcion ;                
        
        
        var ascr_item = document.getElementById( 'ascr_item');    
        ascr_item.value =   objetoJson[0].item ;             
        
        
        var ascr_item_descripcion = document.getElementById( 'ascr_item_descripcion');    
        ascr_item_descripcion.innerHTML =   objetoJson[0].item_descripcion ;            
        
        var ascr_monto = document.getElementById( 'ascr_monto');    
        ascr_monto.value =   objetoJson[0].monto ;            
        ascr_monto.value = formatoNumero_p(ascr_monto.value);
        

        
                
                
                
    }
    
    
    
    
    
}






