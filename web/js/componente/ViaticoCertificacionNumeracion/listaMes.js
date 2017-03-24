

function ViaticoCertificacionNumeracion_listaMes_tabla (mes, planf  ){

        var tabla_coleccion = document.getElementById( "vcmes_tabla" );
        var rows = tabla_coleccion.getElementsByTagName('tr');

        for (var i=0 ; i < rows.length; i++)
        {
            rows[i].addEventListener ( 'click',
                function() {
                    
                    var registro_id = this.dataset.registro_id;     
                    
                    var codint = this.cells[1].innerHTML.toString().trim();     
                    
                    
                    
                    
                    
                    var varpath = "?mes="+mes.replace(/\./g,'')
                            +"&planf="+planf.replace(/\./g,'')
                            +"&codint="+codint.replace(/\./g,'')
                            +"&nroid="+registro_id.replace(/\./g,'');

                    // I o E
                    var condicionIE = this.cells[2].innerHTML.toString().trim();
                    if (condicionIE == 'I') {
                        var path = "../ViaticoCertificacion/Interior.jspx";
                        path = path +varpath;
                    }
                    if (condicionIE == 'E') {
                        var path = "../ViaticoCertificacion/Exterior.jspx";
                        path = path +varpath;
                    }
                    
                    window.location = path;
                    
                },
                false
            );
        }



    ViaticoCertificacionNumeracion_tabla_formato();

}



function ViaticoCertificacionNumeracion_tabla_formato (  ){
    
    
    
    
    var table = document.getElementById( "vcmes_tabla" ).getElementsByTagName('tbody')[0] ;
    var rows = table.rows.length;
    var cell ;
 
    for(i=0; i<rows; i++)
    {      
        cell = table.rows[i].cells[1] ;                                  
        cell.innerHTML = formatoNumero_p(cell.innerHTML);         
        
        cell = table.rows[i].cells[3] ;                                  
        cell.innerHTML = formatoNumero_p(cell.innerHTML); 
            
        cell = table.rows[i].cells[4] ;                                  
        cell.innerHTML = formatoNumero_p(cell.innerHTML); 
                        
            
    }    
    

}





