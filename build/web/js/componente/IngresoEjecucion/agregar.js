
function IngresoEjecucion_agregar ( plan_id ){
    
       
       
       

    var ineja_direccion = document.getElementById( 'ineja_direccion');
    if (ineja_direccion.value == ""){
        ineja_direccion.value = 0;
    }    
    ineja_direccion.onblur  = function() {        
        valor_json_direccion ( "ineja_direccion_descripcion", ineja_direccion )     
        zero( 'ineja_direccion' );
        
        Ingreso_Distribucion_Meses( "ineja_certificacion", plan_id, this.value,
            ineja_mes.value  )  ;        
        
    };
   
    var ineja_qry_direccion = document.getElementById( 'ineja_qry_direccion');
    ineja_qry_direccion.addEventListener('click',
        function()
        {
            mostrarVentana('capa_oscura_segunda');
            mostrarVentana('capa_clara_segunda');
            dimensionarVentana('capa_clara_segunda', 700, 500);
            
            DireccionIngreso_ListaSimple("ineja_direccion");
            
        },
        false
    );



    var ineja_mes = document.getElementById( 'ineja_mes');
    if (ineja_mes.value == ""){
        ineja_mes.value = 0;
    }    
    ineja_mes.onblur  = function() {                
        valor_json_mes( "ineja_mes_descripcion", ineja_mes )  ;        
        zero( 'ineja_mes' );
                
        
        Ingreso_Ejecucion_Meses( "ineja_certificacion", plan_id, ineja_direccion.value, this.value  )  ;        
        
        
    };
   
    var ineja_qry_mes = document.getElementById( 'ineja_qry_mes');
    ineja_qry_mes.addEventListener('click',
        function()
        {
            mostrarVentana('capa_oscura_segunda');
            mostrarVentana('capa_clara_segunda');
            dimensionarVentana('capa_clara_segunda', 700, 500);
            
            Mes_ListaSimple("ineja_mes");
            
        },
        false
    );


    var ineja_certificacion = document.getElementById( 'ineja_certificacion');
    ineja_certificacion.value = 0;




    var ineja_agregar = document.getElementById('ineja_agregar');
    ineja_agregar.addEventListener('click',
        function() {    
                        
            // llamar a un serlver con un ajax
            
            var url = "../IngresoEjecucion/Controlador/InsertUpdateMes"
                +"?idreg="+plan_id
                +"&dire="+ineja_direccion.value
                +"&mes="+ineja_mes.value
                +"&monto="+ineja_ejecucion.value;
            
            var resInserUpdate =  AjaxUrl (url) ;
            
            if (resInserUpdate !== '0' || resInserUpdate !== '')
            {
                // accion correcta
                pestagnas(ingre_eje);
                document.getElementById('ingre_eje').click();
                ineja_cerrar.click();
                
    
            }
            

        },
        false
    );           
    
    
    
   
   
    var ineja_cerrar = document.getElementById('ineja_cerrar');
    ineja_cerrar.addEventListener('click',
        function() {    
            javascript:ocultarVentana('capa_oscura');
            javascript:ocultarVentana('capa_clara');
        },
        false
    );           
    
    


};









