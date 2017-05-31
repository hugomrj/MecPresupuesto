

var scom = 0;   


window.onload = function() {
              
    scom = getParametroValor("scom");   
        
    /*
    AjaxPeticion('../../Estructura/Cabecera?tp='+tp+"&pg="+pg
        ,'cabecera_body');  
    */    
    
    Proposito_formulario();
    
};



function  Proposito_formulario ( ){

    
    AjaxPeticion('../../Proposito/Coleccion/Lista?scom='+scom,'tab_body');  
   // Proposito_tabla_Registro( "proposito_tabla");


    var meta_agregar = document.getElementById('meta_agregar');
    meta_agregar.addEventListener('click',
        function() {   
                    
                mostrarVentana('capa_oscura');
                mostrarVentana('capa_clara');                           
                dimensionarVentana('capa_clara', 900, 250);                    
                                
                AjaxPeticion( '../../Proposito/jspf/agregar.jspx' , 'capa_clara' );     
            
                Proposito_agregar( scom );
                
        },
        false
    );      
    
    
}




function  Proposito_tabla_Registro (tabla ){

        var tabla_coleccion = document.getElementById( tabla ).getElementsByTagName('tbody')[0];
        var rows = tabla_coleccion.getElementsByTagName('tr');


        for (var i=0 ; i < rows.length; i++)
        {
            rows[i].addEventListener ( 'click',
                function() {                                        
              
                    registroid = this.dataset.linea_id;       
                    window.location = "../Estructura/Proposito.jspx?scom="+registroid;                            
                    
                },
                false
            );
        }
        
    }
