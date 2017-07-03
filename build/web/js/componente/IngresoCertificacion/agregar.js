
function IngresoCertificacion_agregar ( plan_id ){
    

       

    var incea_direccion = document.getElementById( 'incea_direccion');
    if (incea_direccion.value == ""){
        incea_direccion.value = 0;
    }    
    incea_direccion.onblur  = function() {        
        valor_json_direccion ( "incea_direccion_descripcion", incea_direccion )     
        zero( 'incea_direccion' );
        
        Ingreso_Distribucion_Meses( "incea_planfinanciero", plan_id, this.value, incea_mes.value  )  ;        
        Ejecucion_Mes_Saldo ( "incea_saldomesanterior", plan_id, this.value, incea_mes.value  )  ;        
        
        var incea_planfinanciero = document.getElementById( 'incea_planfinanciero');    
        incea_planfinanciero.value = formatoNumero_p(incea_planfinanciero.value); 
    

        var incea_saldomesanterior = document.getElementById( 'incea_saldomesanterior');    
        incea_saldomesanterior.value = formatoNumero_p(incea_saldomesanterior.value);         
                
            
        
    };
   
    var incea_qry_direccion = document.getElementById( 'incea_qry_direccion');
    incea_qry_direccion.addEventListener('click',
        function()
        {
            mostrarVentana('capa_oscura_segunda');
            mostrarVentana('capa_clara_segunda');
            dimensionarVentana('capa_clara_segunda', 700, 500);
            
            DireccionIngreso_ListaSimple("incea_direccion");
            
        },
        false
    );



    var incea_mes = document.getElementById( 'incea_mes');
    if (incea_mes.value == ""){
        incea_mes.value = 0;
    }    
    incea_mes.onblur  = function() {                
        valor_json_mes( "incea_mes_descripcion", incea_mes )  ;        
        zero( 'incea_mes' );
                        
        Ingreso_Distribucion_Meses( "incea_planfinanciero", plan_id, incea_direccion.value, this.value  )  ;        
        Ejecucion_Mes_Saldo ( "incea_saldomesanterior", plan_id, incea_direccion.value, this.value  )  ;   
        
        
        var incea_planfinanciero = document.getElementById( 'incea_planfinanciero');    
        incea_planfinanciero.value = formatoNumero_p(incea_planfinanciero.value); 
    

        var incea_saldomesanterior = document.getElementById( 'incea_saldomesanterior');    
        incea_saldomesanterior.value = formatoNumero_p(incea_saldomesanterior.value);         
        
                
    };
   
    var incea_qry_mes = document.getElementById( 'incea_qry_mes');
    incea_qry_mes.addEventListener('click',
        function()
        {
            mostrarVentana('capa_oscura_segunda');
            mostrarVentana('capa_clara_segunda');
            dimensionarVentana('capa_clara_segunda', 700, 500);
            
            Mes_ListaSimple("incea_mes");
            
        },
        false
    );




    var incea_certificacion = document.getElementById( 'incea_certificacion');    
    incea_certificacion.onblur  = function() {        
        incea_certificacion.value = formatoNumero_p(incea_certificacion.value);   
    };      
    
    






    var incea_certificacion = document.getElementById( 'incea_certificacion');
    incea_certificacion.value = 0;


    var incea_agregar = document.getElementById('incea_agregar');
    incea_agregar.addEventListener('click',
        function() {    
                        
            // llamar a un serlver con un ajax
            
            var url = "../IngresoCertificacion/Controlador/InsertUpdateMes"
                +"?idreg="+plan_id
                +"&dire="+incea_direccion.value
                +"&mes="+incea_mes.value
                +"&monto="+incea_certificacion.value;
            
            var resInserUpdate =  AjaxUrl (url) ;
            
            if (resInserUpdate !== '0' || resInserUpdate !== '')
            {
                // accion correcta
                pestagnas(ingre_certi);
                document.getElementById('ingre_certi').click();
                incea_cerrar.click();
    
            }
            

        },
        false
    );           
    
    
    
   
   
    var incea_cerrar = document.getElementById('incea_cerrar');
    incea_cerrar.addEventListener('click',
        function() {    
            javascript:ocultarVentana('capa_oscura');
            javascript:ocultarVentana('capa_clara');
        },
        false
    );           
    
    


};









