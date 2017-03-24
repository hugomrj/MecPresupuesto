


function Direccion_ListaSimple ( elementoRetorno )
{

    var seleccionar_registro = function(  )
    {
        var tabla_qry = document.getElementById('tabla_qry_Direccion').getElementsByTagName('tbody')[0];
        var regs = tabla_qry.getElementsByTagName('tr');

        for (var i=0 ; i < regs.length; i++)
        {
           
            regs[i].addEventListener ( 'click',
                function() {

                    registroid = this.dataset.registro_id;    

                    
                    asignarValor( elementoRetorno, registroid );

                    document.getElementById(elementoRetorno).onblur();  

                    ocultarVentana('capa_oscura_segunda');
                    ocultarVentana('capa_clara_segunda');
                                
                },
                false
            );

        }

    };


    var busqueda_cerrar = function( )
    {

        var cerrar_busqueda = document.getElementById('cerrar_listasimple');
        cerrar_busqueda.addEventListener('click',
            function()
            {
                ocultarVentana('capa_oscura_segunda');
                ocultarVentana('capa_clara_segunda');
            },
            false
        );
    };


    AjaxPeticion('../Direccion/Coleccion/ListaSimple','capa_clara_segunda');    
    seleccionar_registro(  );
    busqueda_cerrar();

}





function valor_json_direccion ( elementoRetorno, valorcodigo )
{

        //  usar json
        var direccion_descripcion = document.getElementById(elementoRetorno);        
        var jsonResponse = AjaxUrl( "../Direccion/Linea.json?id="+valorcodigo.value );  
              
        if (jsonResponse.toString().trim() != "[]")
        {
            var objetoJson = JSON.parse(jsonResponse);                
            direccion_descripcion.innerHTML = objetoJson[0].descripcion ;
        }
        else
        {
            //var dima_direccion_descripcion = document.getElementById('dima_direccion_descripcion');        
            direccion_descripcion.innerHTML = "" ;
        }
        //zero( 'dima_direccion' );
        
} 

