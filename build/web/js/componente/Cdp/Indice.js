

window.onload = function() {
   




    AjaxPeticion('../Estructura/Coleccion/Lista','tab_body');     
    fomato_tabla();        




    
    var vinculo ="";
    vinculo = "../Cdp/Detalle.jspx?idreg=";                            
    Estructura_tabla_registro(vinculo)
    

   var tipo1 = document.getElementById('desde_tipo');
   
    tipo1.addEventListener('blur', function() {            
            datos_tabla();
            fomato_tabla();           
        }, false
    );      
    tipo1.addEventListener('keypress', function(e) {
            if (e.keyCode === 13) {
                tipo1.blur();                
            } }, false
    ); 

   

   var pg1 = document.getElementById('desde_pg');

    pg1.addEventListener('blur', function() {            
            datos_tabla();
            fomato_tabla();              
        }, false
    );      
    pg1.addEventListener('keypress', function(e) {
            if (e.keyCode === 13) {
                pg1.blur();                
            } }, false
    ); 



   var sp1 = document.getElementById('desde_sp');

    sp1.addEventListener('blur', function() {            
            datos_tabla();
            fomato_tabla();              
        }, false
    );      
    sp1.addEventListener('keypress', function(e) {
            if (e.keyCode === 13) {
                sp1.blur();                
            } }, false
    ); 





   var py1 = document.getElementById('desde_py');

    py1.addEventListener('blur', function() {            
            datos_tabla();
            fomato_tabla();              
        }, false
    );      
    py1.addEventListener('keypress', function(e) {
            if (e.keyCode === 13) {
                py1.blur();                
            } }, false
    ); 



    var obj1 = document.getElementById('desde_obj');
    obj1.addEventListener('blur', function() {            
            datos_tabla();
            fomato_tabla();              
        }, false
    );      
    obj1.addEventListener('keypress', function(e) {
            if (e.keyCode === 13) {
                obj1.blur();                
            } }, false
    ); 


   var ff1 = document.getElementById('desde_ff');

    ff1.addEventListener('blur', function() {            
            datos_tabla();
            fomato_tabla();              
        }, false
    );      
    ff1.addEventListener('keypress', function(e) {
            if (e.keyCode === 13) {
                ff1.blur();                
            } }, false
    ); 




   var of1 = document.getElementById('desde_of');
    of1.addEventListener('blur', function() {            
            datos_tabla();
            fomato_tabla();              
        }, false
    );      
    of1.addEventListener('keypress', function(e) {
            if (e.keyCode === 13) {
                of1.blur();                
            } }, false
    ); 


   var dpt1 = document.getElementById('desde_dpt');
    dpt1.addEventListener('blur', function() {            
            datos_tabla();
            fomato_tabla();              
        }, false
    );      
    dpt1.addEventListener('keypress', function(e) {
            if (e.keyCode === 13) {
                dpt1.blur();                
            } }, false
    ); 



    
};

 
function datos_tabla (){
    
   var tipo1 = document.getElementById('desde_tipo');
   
   var pg1 = document.getElementById('desde_pg');
   
   var sp1 = document.getElementById('desde_sp');
   
    var py1 = document.getElementById('desde_py');
   
    var obj1 = document.getElementById('desde_obj');
    
    var ff1 = document.getElementById('desde_ff');
    
    var of1 = document.getElementById('desde_of');
    
    var dpt1 = document.getElementById('desde_dpt');
    
       
 
    
      AjaxPeticion('../Estructura/Coleccion/Lista'    
        +'?nn=0'        
        +'&tipo1='+tipo1.value
        +'&pg1='+pg1.value
        +'&sp1='+sp1.value
        +'&py1='+py1.value
        +'&obj1='+obj1.value
        +'&ff1='+ff1.value
        +'&of1='+of1.value
        +'&dpt1='+dpt1.value        
                ,'tab_body');   
    
    
/*
        var vinculo ="";
        vinculo = "../UocCertificacion/Detalle.jspx?idreg=";                        
        funcion_tabla_presupuesto_registro(vinculo);        
   */     

    
}




function fomato_tabla (){
/*
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
*/

}


