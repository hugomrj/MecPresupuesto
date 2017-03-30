
function DistribucionIngreso_agregar ( presupuesto_id ){





    campos_interaccion();

    var dima_direccion = document.getElementById( 'dima_direccion');
    if (dima_direccion.value == ""){
        dima_direccion.value = 0;
    }    
    dima_direccion.onblur  = function() {   
     
        valor_json_direccion ( "dima_direccion_descripcion", dima_direccion )     
        zero( 'dima_direccion' );
     
    };


    var dima_qry_direccion = document.getElementById( 'dima_qry_direccion');
    dima_qry_direccion.addEventListener('click',
        function()
        {
            mostrarVentana('capa_oscura_segunda');
            mostrarVentana('capa_clara_segunda');
            dimensionarVentana('capa_clara_segunda', 700, 500);
                        
            //Busqueda_relacionada_direccion_ingreso( );
            DireccionIngreso_ListaSimple("dima_direccion");
            
        },
        false
    );




    var dima_agregar = document.getElementById('dima_agregar');
    dima_agregar.addEventListener('click',
        function() {



                    var dima_presupuesto_id = document.getElementById('dima_presupuesto_id');
                    dima_presupuesto_id.value = presupuesto_id;

               
                    var form = document.getElementById("dima_form");            
                    var accion =  form.getAttribute('action') ; 

                    AjaxPeticionURL( accion, getDataForm(form) );

                    datos_tabla_dite_tabla();
                    
                    
                    //datos_tabla_ccld_tabla();
                    
                    dima_cerrar.click();                          
                    
        },
        false
    );
    
   
   
   
    var dima_cerrar = document.getElementById('dima_cerrar');
    dima_cerrar.addEventListener('click',
        function() {    
            javascript:ocultarVentana('capa_oscura');
            javascript:ocultarVentana('capa_clara');
        },
        false
    );           
    
    


};



//var tabla = "tabla_qry_DireccionIngreso";





/*
function Busqueda_relacionada_direccion_ingreso ( elementoRetorno )
{

    var seleccionar_registro = function(  )
    {
        var tabla_qry = document.getElementById('tabla_qry_DireccionIngreso').getElementsByTagName('tbody')[0];
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


    AjaxPeticion('../DireccionIngreso/Coleccion/ListaSimple','capa_clara_segunda');    
    seleccionar_registro(  );
    busqueda_cerrar();

}
*/



function campos_interaccion ( )
{
    
    var dima_pf1 = document.getElementById( 'dima_pf1');
    if (dima_pf1.value == ""){
        dima_pf1.value = 0;
    }
    dima_pf1.onblur  = function() {
        zero( 'dima_pf1');
    };
    dima_pf1.onkeyup  = function() {
        dima_pf1.value = formatoNumero_p(dima_pf1.value);                       
    };    
    
    
    var dima_pf2 = document.getElementById( 'dima_pf2');
    if (dima_pf2.value == ""){
        dima_pf2.value = 0;
    }
    dima_pf2.onblur  = function() {
        zero( 'dima_pf2');
    };
    dima_pf2.onkeyup  = function() {
        dima_pf2.value = formatoNumero_p(dima_pf2.value);
    };    
    
    
    var dima_pf3 = document.getElementById( 'dima_pf3');
    if (dima_pf3.value == ""){
        dima_pf3.value = 0;
    }
    dima_pf3.onblur  = function() {
        zero( 'dima_pf3');
    };
    dima_pf3.onkeyup  = function() {
        dima_pf3.value = formatoNumero_p(dima_pf3.value);
    };        
    
    
    var dima_pf4 = document.getElementById( 'dima_pf4');
    if (dima_pf4.value == ""){
        dima_pf4.value = 0;
    }
    dima_pf4.onblur  = function() {
        zero( 'dima_pf4');
    };
    dima_pf4.onkeyup  = function() {
        dima_pf4.value = formatoNumero_p(dima_pf4.value);
    };        
    

    var dima_pf5 = document.getElementById( 'dima_pf5');
    if (dima_pf5.value == ""){
        dima_pf5.value = 0;
    }
    dima_pf5.onblur  = function() {
        zero( 'dima_pf5');
    };
    dima_pf5.onkeyup  = function() {
        dima_pf5.value = formatoNumero_p(dima_pf5.value);
    };            
    
    
    var dima_pf6 = document.getElementById( 'dima_pf6');
    if (dima_pf6.value == ""){
        dima_pf6.value = 0;
    }
    dima_pf6.onblur  = function() {
        zero( 'dima_pf6');
    };
    dima_pf6.onkeyup  = function() {
        dima_pf6.value = formatoNumero_p(dima_pf6.value);
    };            
    
    
    
    var dima_pf7 = document.getElementById( 'dima_pf7');
    if (dima_pf7.value == ""){
        dima_pf7.value = 0;
    }
    dima_pf7.onblur  = function() {
        zero( 'dima_pf7');
    };
    dima_pf7.onkeyup  = function() {
        dima_pf7.value = formatoNumero_p(dima_pf7.value);
    };            
    
    
    var dima_pf8 = document.getElementById( 'dima_pf8');
    if (dima_pf8.value == ""){
        dima_pf8.value = 0;
    }
    dima_pf8.onblur  = function() {
        zero( 'dima_pf8');
    };
    dima_pf8.onkeyup  = function() {
        dima_pf8.value = formatoNumero_p(dima_pf8.value);
    };            
    
    
    var dima_pf9 = document.getElementById( 'dima_pf9');
    if (dima_pf9.value == ""){
        dima_pf9.value = 0;
    }
    dima_pf9.onblur  = function() {
        zero( 'dima_pf9');
    };
    dima_pf9.onkeyup  = function() {
        dima_pf9.value = formatoNumero_p(dima_pf9.value);
    };            
    
    
    
    var dima_pf10 = document.getElementById( 'dima_pf10');
    if (dima_pf10.value == ""){
        dima_pf10.value = 0;
    }
    dima_pf10.onblur  = function() {
        zero( 'dima_pf10');
    };
    dima_pf10.onkeyup  = function() {
        dima_pf10.value = formatoNumero_p(dima_pf10.value);
    };            
    
    

    var dima_pf11 = document.getElementById( 'dima_pf11');
    if (dima_pf11.value == ""){
        dima_pf11.value = 0;
    }
    dima_pf11.onblur  = function() {
        zero( 'dima_pf11');
    };
    dima_pf11.onkeyup  = function() {
        dima_pf11.value = formatoNumero_p(dima_pf11.value);
    };            
    
    
    
    var dima_pf12 = document.getElementById( 'dima_pf12');
    if (dima_pf12.value == ""){
        dima_pf12.value = 0;
    }
    dima_pf12.onblur  = function() {
        zero( 'dima_pf12');
    };
    dima_pf12.onkeyup  = function() {
        dima_pf12.value = formatoNumero_p(dima_pf12.value);
    };            
    
    
    
}





