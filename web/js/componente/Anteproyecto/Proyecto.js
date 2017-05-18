
window.onload = function() {
          
    
    var id = getParametroValor("id");   
    var tp = getParametroValor("tp");   
    var pg = getParametroValor("pg");   
    var sp = getParametroValor("sp");   
    
    
    AjaxPeticion('../../Estructura/Cabecera?tp='+tp+"&pg="+pg+"&sp="+sp
        ,'cabecera_body');              
    
    
    AjaxPeticion('../../Proyecto/Coleccion/Lista?id='+id,'tab_body');  
    Proyecto_sub_Registro();


    var proy_agregar = document.getElementById('proy_agregar');
    proy_agregar.addEventListener('click',
        function() {   
            
                mostrarVentana('capa_oscura');
                mostrarVentana('capa_clara');                           
                dimensionarVentana('capa_clara', 900, 250);                    
                
                AjaxPeticion( '../../Proyecto/jspf/agregar.jspx' , 'capa_clara' );     
            
                Proyecto_agregar (id, tp, pg, sp );
                
        },
        false
    );    
    
};



function  Proyecto_sub_Registro ( ){

        var tabla_coleccion = document.getElementById( 'proy_tabla' ).getElementsByTagName('tbody')[0];
        var rows = tabla_coleccion.getElementsByTagName('tr');


        for (var i=0 ; i < rows.length; i++)
        {
            rows[i].addEventListener ( 'click',
                function() {                                        
              
                    registroid = this.dataset.linea_id;                                       
                    dtp = this.dataset.linea_tp;             
                    dpg = this.dataset.linea_pg;                         
                    dsp = this.dataset.linea_sp;                         
                    dpy = this.dataset.linea_py;                         
                    
                    window.location = "../Estructura/Producto.jspx?id="+registroid
                        +"&tp="+dtp+"&pg="+dpg+"&sp="+dsp+"&py="+dpy;                              
                    
                },
                false
            );
        }
        
    }
