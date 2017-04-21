

window.onload = function() {
   
    AjaxPeticion('../Documento/Coleccion/Lista','tab_body');          
    Documento_sub_Registro( );
    Formato_documento_lista_tabla();
    
};





function Documento_sub_Registro (   ){

    var tabla = 'doc_tabla';            
    Documento_sub_tabla( tabla, 800, 250);

};






    function  Documento_sub_tabla (tabla , largo, ancho ){

        //tabla tab rol
        var tabla_coleccion = document.getElementById( tabla ).getElementsByTagName('tbody')[0];
        var rows = tabla_coleccion.getElementsByTagName('tr');

        for (var i=0 ; i < rows.length; i++)
        {
            rows[i].addEventListener ( 'click',
                function() {
                                        
                    //registroid = this.getElementsByTagName('id')[0].dataset.linea_id;                    
                    registroid = this.dataset.linea_id;                                       
                    window.location = "../Documento/Registro.jspx?id="+registroid;                    
                },
                false
            );
        }
    }



function Formato_documento_lista_tabla (){

    var table = document.getElementById( "doc_tabla" ).getElementsByTagName('tbody')[0] ;
    var rows = table.rows.length;
    var cell ;
 
    for(i=0; i<rows; i++)
    {  
        cell = table.rows[i].cells[0] ;                                  
        cell.innerHTML = formatoNumero_p(cell.innerHTML); 

        
        cell = table.rows[i].cells[1] ;                                  
        cell.innerHTML = formatoFecha(cell.innerHTML.toString().trim()); 

    }    

}
