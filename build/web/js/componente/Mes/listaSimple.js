


function Mes_ListaSimple ( elementoRetorno )
{

    var seleccionar_registro = function(  )
    {
        var tabla_qry = document.getElementById('tabla_qry_Meses').getElementsByTagName('tbody')[0];
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

        var cerrar_busqueda = document.getElementById('cerrar_mes_listasimple');
        cerrar_busqueda.addEventListener('click',
            function()
            {
                ocultarVentana('capa_oscura_segunda');
                ocultarVentana('capa_clara_segunda');
            },
            false
        );
    };


    AjaxPeticion('../Mes/Coleccion/ListaSimple','capa_clara_segunda');    
    seleccionar_registro(  );
    busqueda_cerrar();

}



function valor_json_mes ( elementoRetorno, valorcodigo )
{
        
        var mes_descripcion = document.getElementById(elementoRetorno);        
        var jsonResponse = AjaxUrl( "../Mes/Linea.json?idregistro="+valorcodigo.value );  
        
        if (jsonResponse.toString().trim() != "[]")
        {
            var objetoJson = JSON.parse(jsonResponse);                
            mes_descripcion.innerHTML = objetoJson[0].descripcion ;
        }
        else
        {

            mes_descripcion.innerHTML = "" ;
        }

        
}    