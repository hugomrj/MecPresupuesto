
var id = 0


function  DistribucionComponente_agregar ( parametro_id ){

    id = parametro_id;

    var asca_presupuesto = document.getElementById( 'asca_presupuesto');  
    asca_presupuesto.value = id;
    


    // jsom
    
    var asca_item = document.getElementById( 'asca_item');    
    asca_item.value = 0;
    asca_item.onblur  = function() {        
                
         Distribucion_sub_item_jsom ( this.value );         
         document.getElementById( 'asca_monto' ).focus();    
        
         
    };          
         
    

    var asca_monto = document.getElementById( 'asca_monto');        
    asca_monto.onfocus  = function() {        
        this.setSelectionRange (0, this.value.length);
    };          
    asca_monto.onblur  = function() {                    
            this.value = formatoNumero_p(this.value);
    };                   
         
         




    var asca_qry_item = document.getElementById( 'asca_qry_item');
    asca_qry_item.addEventListener('click',
        function()
        {
                mostrarVentana('capa_oscura3');
                mostrarVentana('capa_clara3');
                dimensionarVentana('capa_clara3', 700, 500);
                Busqueda_relacionada_Item_add("Item", "asca_" , "asca_item_descripcion", "Descripcion");            
            
        },
        false
    );    






  
    var asca_aceptar = document.getElementById('asca_aceptar');
    asca_aceptar.addEventListener('click',
        function( ) {


            if ( DistribucionComponente_validacion(id) ){

                    var form = document.getElementById("asca_form");            
                    //var accion =  form.getAttribute('action') ; 
                    var accion =  "../../DistribucionComponente/Controlador/Agregar" ;
                    
                    var control = AjaxPeticionURL( accion, getDataForm(form) );      

                    if (control == null){      
                        
                        DistribucionComponente_subtabla(id);
                        asca_cerrar.click();
                    }
                    else{                    
                        alerta_error(control);
                    }                    
                }
                    
        },
        false
    );
    




   
    var asca_cerrar = document.getElementById('asca_cerrar');
    asca_cerrar.addEventListener('click',
        function() {    
            javascript:ocultarVentana('capa_clara_segunda');
            javascript:ocultarVentana('capa_oscura_segunda');
        },
        false
    );           
    





        
    }







function Busqueda_relacionada_Item_add ( strObjeto, strPrefijo, strRetorno, servlet  )
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
                    
                    document.getElementById('asca_item').value = registroid ;  
                    document.getElementById('asca_item').onblur();  
                    



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





function Distribucion_sub_item_jsom ( id )
{


    var jsonResponse = AjaxUrl( "../../Item/Registro.json?ite="+id );    
   
    if (jsonResponse.toString().trim() != "[]")
    {
        var objetoJson = JSON.parse(jsonResponse);              
        
        
        var asca_item_descripcion = document.getElementById( 'asca_item_descripcion');    
        asca_item_descripcion.innerHTML =   objetoJson[0].item_descripcion ;        
                
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
        document.getElementById( 'asca_subcomponente').value =  0 ;    
        
        document.getElementById( 'asca_subcomponente_descripcion').innerHTML =  "" ;    
        
        document.getElementById( 'eje').value =  0 ; 
        
        document.getElementById( 'eje_descripcion').innerHTML =  "" ;    
        
        document.getElementById( 'componente').value =  0 ; 
        
        document.getElementById( 'componente_descripcion').innerHTML =  "" ;               
                
        
    }
    
}








function DistribucionComponente_validacion ( id ){
    
    
    
    
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
    
    var asca_monto = document.getElementById('asca_monto').value;  
    asca_monto  = parseInt(quitapunto(asca_monto));
    
    suma_subcomponente = suma_subcomponente + parseInt(asca_monto);
    
    
    if (parseInt(proya_ideal) < parseInt(suma_subcomponente))
    {
        alerta_error("Error en valores de presupuesto ideal o subcomponentes");
        return false;
    }
    
    // controlar que exista sub compoente
    
    return true;
}


















