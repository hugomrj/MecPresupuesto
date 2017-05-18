
/*
window.onresize = function() {
    alert('se redimensiono');
};
*/

    var tp = 0
    var pg = 0
    var sp = 0
    var py = 0
    var pr = 0
    



window.onload = function() {
    
    tp = getParametroValor("tp");   
    pg = getParametroValor("pg");   
    sp = getParametroValor("sp");   
    py = getParametroValor("py");   
    pr = getParametroValor("pr");   
    

    AnteproyectoObjeto_funcionalidad();        
        
    //AnteproyectoObjeto_TablaRegistro();

/*
    var linea_agregar = document.getElementById('linea_agregar');    
    linea_agregar.style.display = 'none';
   */
  
  
   /* 
    linea_agregar.addEventListener('click',
        function() {   
            
                mostrarVentana('capa_oscura');
                mostrarVentana('capa_clara');                           
                dimensionarVentana('capa_clara', 900, 250);                    
      
      
      
                AjaxPeticion( '../../Proyecto/jspf/agregar.jspx' , 'capa_clara' );     
                Proyecto_agregar (id, tp, pg, sp );
      
                
        },
        false
    );    
   */
   
   
};



function  AnteproyectoObjeto_TablaRegistro ( ){

        var tabla_coleccion = document.getElementById( 'anteobj_tabla' ).getElementsByTagName('tbody')[0];
        var rows = tabla_coleccion.getElementsByTagName('tr');


        for (var i=0 ; i < rows.length; i++)
        {
            rows[i].addEventListener ( 'click',
                function() {                                        
              
                    registroid = this.dataset.linea_id;                                       
                    /*
                    dtp = this.dataset.linea_tp;             
                    dpg = this.dataset.linea_pg;                         
                    dsp = this.dataset.linea_sp;                         
                    dpy = this.dataset.linea_py;                         
                    
                    window.location = "../Estructura/Producto.jspx?id="+registroid
                        +"&tp="+dtp+"&pg="+dpg+"&sp="+dsp+"&py="+dpy;                              
                    */
                   
                mostrarVentana('capa_oscura');
                mostrarVentana('capa_clara');                         
                AjaxPeticion( '../../Anteproyecto/jspf/editar.jspx' , 'capa_clara' );                                          
                dimensionarVentana('capa_clara', 600, 450);                   
                
//                   CajachicaCertificacion_agregar( evt.target.uoc_id, evt.target.mes );           
                AnteproyectoObjeto_TablaRegistro_registro_editar(registroid);
                   
                },
                false
            );
        }
        AnteproyectoObjeto_TablaRegistro_Formato ();
        
    }



function AnteproyectoObjeto_TablaRegistro_Formato (){

    var table = document.getElementById( "anteobj_tabla" ).getElementsByTagName('tbody')[0] ;
    var rows = table.rows.length;
    var cell ;
 
    for(i=0; i<rows; i++)
    {      
        cell = table.rows[i].cells[5] ;                                  
        cell.innerHTML = formatoNumero_p(cell.innerHTML);
        cell.className = "numero";
        
        cell = table.rows[i].cells[6] ;                                  
        cell.innerHTML = formatoNumero_p(cell.innerHTML); 
        cell.className = "numero";
        
        cell = table.rows[i].cells[7] ;                                  
        cell.innerHTML = formatoNumero_p(cell.innerHTML); 
        cell.className = "numero";        
        
    }    
}



function AnteproyectoObjeto_funcionalidad (){

        


    var linea_agregar = document.getElementById('linea_agregar');    
    linea_agregar.style.display = 'none';


    AjaxPeticion('../../Estructura/Cabecera?tp='+tp+"&pg="+pg+"&sp="+sp
            +"&py="+py+"&pr="+pr
        ,'cabecera_body');              
    
    
    AjaxPeticion('../../Anteproyecto/Objeto/Lista?tp='+tp+"&pg="+pg+"&sp="+sp
            +"&py="+py+"&pr="+pr
        ,'tab_body');  
        
        
    AnteproyectoObjeto_TablaRegistro();        
}


    
