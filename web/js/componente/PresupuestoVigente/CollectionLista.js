

function fomato_tabla_presupuesto_vigente_lista (){
    
    
    
    var table = document.getElementById( "pvcl_tabla" ).getElementsByTagName('tbody')[0] ;
    var rows = table.rows.length;
    var cell ;
 
    for(i=0; i<rows; i++)
    {      
        cell = table.rows[i].cells[9] ;                                  
        cell.innerHTML = formatoNumero_p(cell.innerHTML); 
        
        cell = table.rows[i].cells[10] ;                                  
        cell.innerHTML = formatoNumero_p(cell.innerHTML); 

        
        cell = table.rows[i].cells[11] ;                                  
        cell.innerHTML = formatoNumero_p(cell.innerHTML); 

        
        
    }    
};




function funcion_tabla_presupuesto_registro( link )
{
    var tabla_qry = document.getElementById('pvcl_tabla').getElementsByTagName('tbody')[0];
    var regs = tabla_qry.getElementsByTagName('tr');

    for (var i=0 ; i < regs.length; i++)
    {

        regs[i].addEventListener ( 'click',
            function() {

                var registro_id = this.dataset.registro_id;                                                    
                window.location = link + registro_id;     
                        
            },
            false
        );

    }

};


/*
 
function funcion_tabla_presupuesto_viatico(  )
{
    var tabla_qry = document.getElementById('pvcl_tabla').getElementsByTagName('tbody')[0];
    var regs = tabla_qry.getElementsByTagName('tr');


    for (var i=0 ; i < regs.length; i++)
    {

        regs[i].addEventListener ( 'click',
            function() {

                registroid = this.dataset.registro_id;    
                //asignarValor( elementoRetorno, registroid );


            },
            false
        );

    }

};
*/