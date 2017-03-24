

function CajachicaDistribucion_listaMes_tabla (mes, uco_id  ){


/*

        var tabla_coleccion = document.getElementById( "cclm_tabla" );
        var rows = tabla_coleccion.getElementsByTagName('tr');

        for (var i=0 ; i < rows.length; i++)
        {
            rows[i].addEventListener ( 'click',
                function() {
                    
                    var registro_id = this.dataset.registro_id;     
                    
                    var codint = this.cells[1].innerHTML.toString().trim();     
                    
                    var varpath = "?mes="+mes+"&planf="+planf+"&codint="+codint
                        +"&nroid="+registro_id;


                        var path = "../ViaticoCertificacion/Interior.jspx";
                        path = path +varpath;



                    window.location = path;
                    
                },
                false
            );
        }

*/


        CajachicaDistribucion_listaMes_formato (  );


}







function CajachicaDistribucion_listaMes_formato (  ){
    
    var table = document.getElementById( "cclm_tabla" ).getElementsByTagName('tbody')[0] ;
    var rows = table.rows.length;
    var cell ;
 
    for(i=0; i<rows; i++)
    {      
        cell = table.rows[i].cells[1] ;                                  
        cell.innerHTML = formatoNumero_p(cell.innerHTML); 
        
        
        cell = table.rows[i].cells[2] ;                                  
        cell.innerHTML = formatoNumero_p(cell.innerHTML); 
        
        cell = table.rows[i].cells[3] ;                                  
        cell.innerHTML = formatoNumero_p(cell.innerHTML); 
        
        
        
        
    }    

}

