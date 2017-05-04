

window.onload = function() {
    
    var registro = getParametroValor("registro");   
    Cajachica_CabeceraLinea(registro);
    
    
    
    
    var planf = document.getElementById('planf');
    pestagnas(planf);    
    Plan_financiero_meses_valores (  ) ;
    
    
    
    var planf = document.getElementById('planf');
    planf.addEventListener('click',
        function() {    
            pestagnas(planf);                                 
            Plan_financiero_meses_valores () ;
        },
        false
    );       
    
    
    
    var certi = document.getElementById('certi');
    certi.addEventListener('click',
        function() {    
            pestagnas(certi);       
            Certificacion_meses_valores () ;            
        },
        false
    );   

    
    var ejec = document.getElementById('ejec');
    ejec.addEventListener('click',
        function() {    
            pestagnas(ejec);                                 
            Ejecucion_meses_valores () ;            
        },
        false
    );   
                
    
};




function Plan_financiero_meses_valores (  ){
    
    AjaxPeticion('../Cajachica/jspf/distribucionMeses.jspx','tab_body');  

    var registro = getParametroValor("registro");
    var jsonResponse = AjaxUrl( "../CajaChica/Distribucion.json?registro="+registro );    
      
    var uoc_id = 0;
    
    if (jsonResponse.toString().trim() != "[]")
    {
        var objetoJson = JSON.parse(jsonResponse);    
   
        uoc_id = objetoJson[0].id ;
   
        var m1 = document.getElementById('m1');        
        m1.innerHTML =   objetoJson[0].pf1 ;
        m1.innerHTML = formatoNumero_p(m1.innerHTML); 
        
        var m2 = document.getElementById('m2');        
        m2.innerHTML =   objetoJson[0].pf2 ;
        m2.innerHTML = formatoNumero_p(m2.innerHTML); 
              
        var m3 = document.getElementById('m3');        
        m3.innerHTML =   objetoJson[0].pf3 ;
        m3.innerHTML = formatoNumero_p(m3.innerHTML); 
      
        var m4 = document.getElementById('m4');        
        m4.innerHTML =   objetoJson[0].pf4 ;
        m4.innerHTML = formatoNumero_p(m4.innerHTML); 

        var m5 = document.getElementById('m5');        
        m5.innerHTML =   objetoJson[0].pf5 ;
        m5.innerHTML = formatoNumero_p(m5.innerHTML); 
      
        var m6 = document.getElementById('m6');        
        m6.innerHTML =   objetoJson[0].pf6 ;
        m6.innerHTML = formatoNumero_p(m6.innerHTML); 
      
        var m7 = document.getElementById('m7');        
        m7.innerHTML =   objetoJson[0].pf7 ;
        m7.innerHTML = formatoNumero_p(m7.innerHTML); 

        var m8 = document.getElementById('m8');        
        m8.innerHTML =   objetoJson[0].pf8 ;
        m8.innerHTML = formatoNumero_p(m8.innerHTML); 
        
        var m9 = document.getElementById('m9');        
        m9.innerHTML =   objetoJson[0].pf9 ;
        m9.innerHTML = formatoNumero_p(m9.innerHTML); 
      
        var m10 = document.getElementById('m10');        
        m10.innerHTML =   objetoJson[0].pf10 ;
        m10.innerHTML = formatoNumero_p(m10.innerHTML); 
      
        var m11 = document.getElementById('m11');        
        m11.innerHTML =   objetoJson[0].pf11 ;
        m11.innerHTML = formatoNumero_p(m11.innerHTML); 
      
        var m12 = document.getElementById('m12');        
        m12.innerHTML =   objetoJson[0].pf12 ;
        m12.innerHTML = formatoNumero_p(m12.innerHTML); 
        
        var pfdm_suma = document.getElementById('pfdm_suma');        
        pfdm_suma.innerHTML =   objetoJson[0].suma ;  
        pfdm_suma.innerHTML = formatoNumero_p(pfdm_suma.innerHTML); 
        //datos_tabla_ccld_tabla();
        
    }
    
    
    
    var pfdm_editar = document.getElementById('pfdm_editar');
    pfdm_editar.addEventListener('click',
        function() {   
                    
                mostrarVentana('capa_oscura');
                mostrarVentana('capa_clara');                           
                dimensionarVentana('capa_clara', 900, 250);                    
                
                AjaxPeticion( '../Cajachica/jspf/agregar_editar.jspx' , 'capa_clara' );                           
            
                var registro = getParametroValor("registro");
                Cajachica_agregar_editar(registro);            
        },
        false
    );               
    
    // formato
    //    var modalidad = getParametroValor("modo");         
    cajachica_ditribucionMeses_destino(registro);
    
}



function Certificacion_meses_valores (  ){
    
    AjaxPeticion('../Cajachica/jspf/certificacionMeses.jspx','tab_body');  

    var registro = getParametroValor("registro");    
    var jsonResponse = AjaxUrl( "../CajaChica/Certificacion.json?registro="+registro );        


    /*
     * 

           
    
    var uoc_id = 0;
    
    if (jsonResponse.toString().trim() != "[]")
    {
        
        var objetoJson = JSON.parse(jsonResponse);    
   
        uoc_id = objetoJson[0].id ;
   
        var m1 = document.getElementById('m1');        
        m1.innerHTML =   objetoJson[0].pf1 ;
        m1.innerHTML = formatoNumero_p(m1.innerHTML); 
        
        
        
        var m2 = document.getElementById('m2');        
        m2.innerHTML =   objetoJson[0].pf2 ;
        m2.innerHTML = formatoNumero_p(m2.innerHTML); 
        
              
              
        var m3 = document.getElementById('m3');        
        m3.innerHTML =   objetoJson[0].pf3 ;
        m3.innerHTML = formatoNumero_p(m3.innerHTML); 
                                                                
      
      
        var m4 = document.getElementById('m4');        
        m4.innerHTML =   objetoJson[0].pf4 ;
        m4.innerHTML = formatoNumero_p(m4.innerHTML); 

        
      
        var m5 = document.getElementById('m5');        
        m5.innerHTML =   objetoJson[0].pf5 ;
        m5.innerHTML = formatoNumero_p(m5.innerHTML); 

        
      
        var m6 = document.getElementById('m6');        
        m6.innerHTML =   objetoJson[0].pf6 ;
        m6.innerHTML = formatoNumero_p(m6.innerHTML); 
        
        
      
        var m7 = document.getElementById('m7');        
        m7.innerHTML =   objetoJson[0].pf7 ;
        m7.innerHTML = formatoNumero_p(m7.innerHTML); 

      
        var m8 = document.getElementById('m8');        
        m8.innerHTML =   objetoJson[0].pf8 ;
        m8.innerHTML = formatoNumero_p(m8.innerHTML); 
        
        
        var m9 = document.getElementById('m9');        
        m9.innerHTML =   objetoJson[0].pf9 ;
        m9.innerHTML = formatoNumero_p(m9.innerHTML); 

        
      
        var m10 = document.getElementById('m10');        
        m10.innerHTML =   objetoJson[0].pf10 ;
        m10.innerHTML = formatoNumero_p(m10.innerHTML); 
        
        
      
        var m11 = document.getElementById('m11');        
        m11.innerHTML =   objetoJson[0].pf11 ;
        m11.innerHTML = formatoNumero_p(m11.innerHTML); 
                  
      
        var m12 = document.getElementById('m12');        
        m12.innerHTML =   objetoJson[0].pf12 ;
        m12.innerHTML = formatoNumero_p(m12.innerHTML); 
        

        
        var pfdm_suma = document.getElementById('pfdm_suma');        
        pfdm_suma.innerHTML =   objetoJson[0].suma ;  
        pfdm_suma.innerHTML = formatoNumero_p(pfdm_suma.innerHTML); 
        
               
        //datos_tabla_ccld_tabla();
        
    }
    
    
    
    
    
    var pfdm_editar = document.getElementById('pfdm_editar');
    pfdm_editar.addEventListener('click',
        function() {   
                    
                mostrarVentana('capa_oscura');
                mostrarVentana('capa_clara');                           
                
                AjaxPeticion( '../Cajachica/jspf/agregar_editar.jspx' , 'capa_clara' );                            
            
                dimensionarVentana('capa_clara', 900, 250);                    
                
                var registro = getParametroValor("registro");
                Cajachica_agregar_editar(registro);            
                
                
        },
        false
    );               
    
    cajachica_ditribucionMeses_destino(registro);
    
    */
    
}





function Ejecucion_meses_valores (  ){
        
    AjaxPeticion('../Cajachica/jspf/ejecucionMeses.jspx','tab_body');  
    var registro = getParametroValor("registro");
    var jsonResponse = AjaxUrl( "../CajaChica/Ejecucion.json?registro="+registro );        
    
    var uoc_id = 0;
    if (jsonResponse.toString().trim() != "[]")
    {
        
        var objetoJson = JSON.parse(jsonResponse);       
        uoc_id = objetoJson[0].id ;
   
        var m1 = document.getElementById('m1');        
        m1.innerHTML =   objetoJson[0].ej1 ;
        m1.innerHTML = formatoNumero_p(m1.innerHTML); 
        
        var m2 = document.getElementById('m2');        
        m2.innerHTML =   objetoJson[0].ej2 ;
        m2.innerHTML = formatoNumero_p(m2.innerHTML); 
        
        var m3 = document.getElementById('m3');        
        m3.innerHTML =   objetoJson[0].ej3 ;
        m3.innerHTML = formatoNumero_p(m3.innerHTML); 
        
        var m4 = document.getElementById('m4');        
        m4.innerHTML =   objetoJson[0].ej4 ;
        m4.innerHTML = formatoNumero_p(m4.innerHTML); 

        var m5 = document.getElementById('m5');        
        m5.innerHTML =   objetoJson[0].ej5 ;
        m5.innerHTML = formatoNumero_p(m5.innerHTML); 
      
        var m6 = document.getElementById('m6');        
        m6.innerHTML =   objetoJson[0].ej6 ;
        m6.innerHTML = formatoNumero_p(m6.innerHTML); 
      
        var m7 = document.getElementById('m7');        
        m7.innerHTML =   objetoJson[0].ej7 ;
        m7.innerHTML = formatoNumero_p(m7.innerHTML); 
      
        var m8 = document.getElementById('m8');        
        m8.innerHTML =   objetoJson[0].ej8 ;
        m8.innerHTML = formatoNumero_p(m8.innerHTML); 
        
        var m9 = document.getElementById('m9');        
        m9.innerHTML =   objetoJson[0].ej9 ;
        m9.innerHTML = formatoNumero_p(m9.innerHTML); 
      
        var m10 = document.getElementById('m10');        
        m10.innerHTML =   objetoJson[0].ej10 ;
        m10.innerHTML = formatoNumero_p(m10.innerHTML); 
      
        var m11 = document.getElementById('m11');        
        m11.innerHTML =   objetoJson[0].ej11 ;
        m11.innerHTML = formatoNumero_p(m11.innerHTML); 
      
        var m12 = document.getElementById('m12');        
        m12.innerHTML =   objetoJson[0].ej12 ;
        m12.innerHTML = formatoNumero_p(m12.innerHTML); 
        
        var pfdm_suma = document.getElementById('pfdm_suma');        
        pfdm_suma.innerHTML =   objetoJson[0].suma ;  
        pfdm_suma.innerHTML = formatoNumero_p(pfdm_suma.innerHTML); 
               
        //datos_tabla_ccld_tabla();
        
    }
    

    
    
    var cachejme_editar = document.getElementById('cachejme_editar');
    cachejme_editar.addEventListener('click',
        function() {   
                                
                mostrarVentana('capa_oscura');
                mostrarVentana('capa_clara');                           
                dimensionarVentana('capa_clara', 900, 250);                    
                
                AjaxPeticion( '../CajachicaEjecucion/jspf/agregar_editar.jspx' , 'capa_clara' );                            
            
                var registro = getParametroValor("registro");
                Cajachica_ejecucion_agregar_editar(registro);            
                
        },
        false
    );               
    
    //cajachica_ditribucionMeses_destino(registro);
    

    
}










function pestagnas ( elementoID  )
{

    var strBorder = " border-bottom: solid 1px;";
    var strNone = " border-bottom: none;";

    document.getElementById('planf').style=  strNone;           
    document.getElementById('certi').style=  strNone;           
    document.getElementById('ejec').style=  strNone;           

    elementoID.style =  strBorder;

}
    