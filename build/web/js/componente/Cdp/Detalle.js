

window.onload = function() {
   
    
    var registro = getParametroValor("idreg");   
    AjaxPeticion('../Estructura/Cabecera/Linea?registro='+registro,'presupuesto_cabecera');     
    
        
    
    AjaxPeticion('../Cdp/Coleccion/Lista?registro='+registro,'tab_body');     
    //fomato_tabla();        

    var cl_obj = document.getElementById('cl_obj').innerHTML;
    cl_obj = cl_obj.toString().trim() ;
 
    var vinculo ="";
    vinculo = "../Cdp/Registro.jspx?obj="+cl_obj+"&idreg="+registro+"&id=";              
    
    Cdp_Coleccion_Lista_registro(vinculo);
 
 
    var cdpd_agregar = document.getElementById('cdpd_agregar');
    cdpd_agregar.addEventListener('click',
        function()
        {            
            window.location = "../Cdp/Agregar.jspx?idreg="+registro+"&obj="+cl_obj;
        },
        false
    );        

 
    var cdpd_lista = document.getElementById('cdpd_lista');
    cdpd_lista.addEventListener('click',
        function()
        {            
            window.location = "../Cdp/Indice.jspx";
        },
        false
    );    
    
    
 
    
};





function Cdp_Coleccion_Lista_registro(link)
{
    var tabla_qry = document.getElementById('cdpcl_tabla').getElementsByTagName('tbody')[0];
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

    AnteproyectoObjeto_TablaRegistro_Formato();

};






function AnteproyectoObjeto_TablaRegistro_Formato (){

    var table = document.getElementById( "cdpcl_tabla" ).getElementsByTagName('tbody')[0] ;
    var rows = table.rows.length;
    var cell ;
 
    for(i=0; i<rows; i++)
    {      

        cell = table.rows[i].cells[0] ;                                  
        cell.innerHTML = formatoNumero_p(cell.innerHTML); 
        cell.className = "numero";

        cell = table.rows[i].cells[1] ;                                  
        cell.innerHTML = formatoNumero_p(cell.innerHTML); 
        cell.className = "numero";



        cell = table.rows[i].cells[4] ;                                  
        cell.innerHTML = formatoNumero_p(cell.innerHTML); 
        cell.className = "numero";

        cell = table.rows[i].cells[6] ;                                  
        cell.innerHTML = formatoNumero_p(cell.innerHTML); 
        cell.className = "numero";
        

    }    
}









/*
function fomato_tabla_ucol_tabla (){

    var table = document.getElementById( "ucol_tabla" ).getElementsByTagName('tbody')[0] ;
    var rows = table.rows.length;
    var cell ;
 
    for(i=0; i<rows; i++)
    {      
        cell = table.rows[i].cells[4] ;                                  
        cell.innerHTML = formatoNumero_p(cell.innerHTML); 

        
        cell = table.rows[i].cells[5] ;                                  
        cell.innerHTML = formatoNumero_p(cell.innerHTML); 

        
        
    }    


}
*/

