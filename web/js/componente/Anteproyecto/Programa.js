
window.onload = function() {
          
    
    
    var tp = getParametroValor("tp");   
    
    AjaxPeticion('../../Estructura/Cabecera?tp='+tp
        ,'cabecera_body');    
    
    
    
    AjaxPeticion('../../Programa/Coleccion/Lista?tp='+tp,'tab_body');  
    Programa_sub_Registro();





    var prog_agregar = document.getElementById('prog_agregar');
    prog_agregar.addEventListener('click',
        function() {   
                    
                mostrarVentana('capa_oscura');
                mostrarVentana('capa_clara');                           
                dimensionarVentana('capa_clara', 900, 250);                    
                
                AjaxPeticion( '../../Programa/jspf/agregar.jspx' , 'capa_clara' );     
                
                Programa_agregar(tp);
                
                var proga_pg = document.getElementById('proga_pg');
                proga_pg.focus();
                //proga_pg.select();
                proga_pg.setSelectionRange(0, proga_pg.value.length);
                
            
                /*
                var registro = getParametroValor("registro");
                Cajachica_agregar_editar(registro);            
               */ 
                
        },
        false
    );    
    
};



function  Programa_sub_Registro ( ){

        var tabla_coleccion = document.getElementById( 'prog_tabla' ).getElementsByTagName('tbody')[0];
        var rows = tabla_coleccion.getElementsByTagName('tr');

        for (var i=0 ; i < rows.length; i++)
        {
            rows[i].addEventListener ( 'click',
                function() {                                        
              
                    registroid = this.dataset.linea_id;                                       
                    dtp = this.dataset.linea_tp;             
                    dpg = this.dataset.linea_pg;             
                    
                    window.location = "../Estructura/Subprograma.jspx?id="+registroid
                            +"&tp="+dtp+"&pg="+dpg;                    
                },
                false
            );
        }
        
    }
