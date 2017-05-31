
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
        

   
};



function  AnteproyectoObjeto_TablaRegistro ( ){

        var tabla_coleccion = document.getElementById( 'anteobj_tabla' ).getElementsByTagName('tbody')[0];
        var rows = tabla_coleccion.getElementsByTagName('tr');


        for (var i=0 ; i < rows.length; i++)
        {
            rows[i].addEventListener ( 'click',
                function() {                                        
              
                    registroid = this.dataset.linea_id;                                       
                   
                mostrarVentana('capa_oscura');
                mostrarVentana('capa_clara');                         
                AjaxPeticion( '../../Anteproyecto/jspf/editar.jspx' , 'capa_clara' );                                          
                dimensionarVentana('capa_clara', 600, 450);                   
                
       
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


    
