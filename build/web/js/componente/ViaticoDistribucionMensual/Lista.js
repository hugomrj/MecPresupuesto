



window.onload = function() {
    
    
    var mes = 0;
    AjaxPeticion('../ViaticoDistribucionMensual/Coleccion/Lista?mes='+mes,'tab_body');      
    ViaticoDistribucionMensual_tabla ( );



    var vdml_mes = document.getElementById('vdml_mes');
    vdml_mes.addEventListener('keyup',
        function(event) {

            if(event.keyCode == 13)
            {
                vdml_mes.onblur();
            }
        },
        false
    );

    vdml_mes.onblur  = function() {  
        
        
        mes = vdml_mes.value;
        AjaxPeticion('../ViaticoDistribucionMensual/Coleccion/Lista?mes='+mes,'tab_body'); 
        ViaticoDistribucionMensual_tabla ( );
        
        
    };          
    
    
    
    
    var vdml_agregar = document.getElementById('vdml_agregar');
    vdml_agregar.addEventListener('click',
        function() {   
                    
                if (mes > 0 &&  mes < 13) {
                    
                    mostrarVentana('capa_oscura');
                    mostrarVentana('capa_clara');                           
                    dimensionarVentana('capa_clara', 900, 250);                    

                    AjaxPeticion( '../ViaticoDistribucionMensual/jspf/agregar.jspx' , 'capa_clara' );     

                    ViaticoDistribucionMensual_agregar(mes);
                    
                }
                else
                {
                    alerta_error("valor de mes incorrecto");
                    
                }
                
        },
        false
    );        
    
    
    
    /*
    var vinculo ="";
    vinculo = "../PlanFinanciero/Distribucion.jspx?modo=viatico&registro=";                        
    funcion_tabla_presupuesto_registro(vinculo);
    */
    

    
    

};






function  ViaticoDistribucionMensual_tabla ( ){

        var tabla_coleccion = document.getElementById( 'clm_tabla' ).getElementsByTagName('tbody')[0];
        var rows = tabla_coleccion.getElementsByTagName('tr');


        for (var i=0 ; i < rows.length; i++)
        {
            rows[i].addEventListener ( 'click',
                function() {                                        
              
                    registroid = this.dataset.linea_id;                                       

                        mostrarVentana('capa_oscura');
                        mostrarVentana('capa_clara');                           
                        dimensionarVentana('capa_clara', 900, 250);                    

                        AjaxPeticion( '../ViaticoDistribucionMensual/jspf/registro.jspx'
                            , 'capa_clara' );    
                            
                        ViaticoDistribucionMensual_registro(registroid);
                            
                    
                },
                false
            );
        }
        
        ViaticoDistribucionMensual_tabla_formato ();
        
        
    }





function  ViaticoDistribucionMensual_tabla_formato ( ){
    

        var table = document.getElementById( 'clm_tabla' ).getElementsByTagName('tbody')[0];
        var rows = table.getElementsByTagName('tr');

        for (var i=0 ; i < rows.length; i++)
        {

            cell = table.rows[i].cells[2] ;                                  
            cell.innerHTML = formatoNumero_p(cell.innerHTML).trim(); 
            cell.className = "numero";

            cell = table.rows[i].cells[3] ;                                  
            cell.innerHTML = formatoNumero_p(cell.innerHTML).trim(); 
            cell.className = "numero";        

            cell = table.rows[i].cells[4] ;                                  
            cell.innerHTML = formatoNumero_p(cell.innerHTML).trim(); 
            cell.className = "numero";   

        }
        
    
}





        
        

