
window.onload = function() {
    
    var id = getParametroValor("id");   
    var tp = getParametroValor("tp");   
    var pg = getParametroValor("pg");   
    var sp = getParametroValor("sp");   
    var py = getParametroValor("py");   
    //var pr = getParametroValor("pr");   
    
    
    AjaxPeticion('../../Estructura/Cabecera?tp='+tp+"&pg="+pg+"&sp="+sp+"&py="+py
        ,'cabecera_body');              
    
    
    AjaxPeticion('../../Producto/Presupuesto/Lista?tp='+tp+"&pg="+pg+"&sp="+sp+"&py="+py
        ,'tab_body');  
    
    ProyectoPresupuesto_TablaRegistro();


/*

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
    */
   
};



function  ProyectoPresupuesto_TablaRegistro ( ){

        var tabla_coleccion = document.getElementById( 'prod_tabla' ).getElementsByTagName('tbody')[0];
        var rows = tabla_coleccion.getElementsByTagName('tr');

        for (var i=0 ; i < rows.length; i++)
        {
            rows[i].addEventListener ( 'click',
                function() {                                        
              
                    /*registroid = this.dataset.linea_id;*/
                    dtp = this.dataset.linea_tp;             
                    dpg = this.dataset.linea_pg;                         
                    dsp = this.dataset.linea_sp;                         
                    dpy = this.dataset.linea_py;                         
                    dpr = this.dataset.linea_pr;                         
                    
                    window.location = "../Programacion/Lineas.jspx?pr="+dpr
                        +"&tp="+dtp+"&pg="+dpg+"&sp="+dsp+"&py="+dpy;                              
                    
                },
                false
            );
        }                
        ProyectoPresupuesto_TablaRegistro_Formato ();
        
    }


function ProyectoPresupuesto_TablaRegistro_Formato (){

    var table = document.getElementById( "prod_tabla" ).getElementsByTagName('tbody')[0] ;
    var rows = table.rows.length;
    var cell ;
 
 
    for(i=0; i<rows; i++)
    {      
        cell = table.rows[i].cells[2] ;                                  
        cell.innerHTML = formatoNumero_p(cell.innerHTML).trim(); 
        cell.className = "numero";

        cell = table.rows[i].cells[3] ;                                  
        cell.innerHTML = formatoNumero_p(cell.innerHTML).trim(); 
        cell.className = "numero";        
        
        cell = table.rows[i].cells[4] ;                                  
        cell.innerHTML = formatoNumero_p(cell.innerHTML).trim(); 
        cell.className = "numero";                
        
    }    
}

