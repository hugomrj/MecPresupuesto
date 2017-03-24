

window.onload = function() {
   

    AjaxPeticion('../Plan/Coleccion/Lista?objeto=100','tab_body');      
    fomato_tabla();        


   var tipo1 = document.getElementById('desde_tipo');
   var tipo2 = document.getElementById('hasta_tipo');

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

    tipo2.addEventListener('blur', function() {            
            datos_tabla();
            fomato_tabla();              
        }, false
    );      
    tipo2.addEventListener('keypress', function(e) {
            if (e.keyCode === 13) {
                tipo2.blur();                
            } }, false
    ); 



   var pg1 = document.getElementById('desde_pg');
   var pg2 = document.getElementById('hasta_pg');

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

    pg2.addEventListener('blur', function() {            
            datos_tabla();
            fomato_tabla();              
        }, false
    );      
    pg2.addEventListener('keypress', function(e) {
            if (e.keyCode === 13) {
                pg2.blur();                
            } }, false
    ); 




   var sp1 = document.getElementById('desde_sp');
   var sp2 = document.getElementById('hasta_sp');

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

    sp2.addEventListener('blur', function() {            
            datos_tabla();
            fomato_tabla();              
        }, false
    );      
    sp2.addEventListener('keypress', function(e) {
            if (e.keyCode === 13) {
                sp2.blur();                
            } }, false
    ); 





   var py1 = document.getElementById('desde_py');
   var py2 = document.getElementById('hasta_py');

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

    py2.addEventListener('blur', function() {            
            datos_tabla();
            fomato_tabla();              
        }, false
    );      
    py2.addEventListener('keypress', function(e) {
            if (e.keyCode === 13) {
                py2.blur();                
            } }, false
    ); 




   var obj1 = document.getElementById('desde_obj');
   var obj2 = document.getElementById('hasta_obj');

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

    obj2.addEventListener('blur', function() {            
            datos_tabla();
            fomato_tabla();              
        }, false
    );      
    obj2.addEventListener('keypress', function(e) {
            if (e.keyCode === 13) {
                obj2.blur();                
            } }, false
    ); 





   var ff1 = document.getElementById('desde_ff');
   var ff2 = document.getElementById('hasta_ff');

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

    ff2.addEventListener('blur', function() {            
            datos_tabla();
            fomato_tabla();              
        }, false
    );      
    ff2.addEventListener('keypress', function(e) {
            if (e.keyCode === 13) {
                ff2.blur();                
            } }, false
    ); 
    
    
    
    
    


   var of1 = document.getElementById('desde_of');
   var of2 = document.getElementById('hasta_of');

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

    of2.addEventListener('blur', function() {            
            datos_tabla();
            fomato_tabla();              
        }, false
    );      
    of2.addEventListener('keypress', function(e) {
            if (e.keyCode === 13) {
                of2.blur();                
            } }, false
    ); 
    
    
    
    


   var dpt1 = document.getElementById('desde_dpt');
   var dpt2 = document.getElementById('hasta_dpt');

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

    dpt2.addEventListener('blur', function() {            
            datos_tabla();
            fomato_tabla();              
        }, false
    );      
    dpt2.addEventListener('keypress', function(e) {
            if (e.keyCode === 13) {
                dpt2.blur();                
            } }, false
    ); 
        
    
        


   var prd1 = document.getElementById('desde_prd');
   var prd2 = document.getElementById('hasta_prd');

    prd1.addEventListener('blur', function() {            
            datos_tabla();
            fomato_tabla();              
        }, false
    );      
    prd1.addEventListener('keypress', function(e) {
            if (e.keyCode === 13) {
                prd1.blur();                
            } }, false
    ); 

    prd2.addEventListener('blur', function() {            
            datos_tabla();
            fomato_tabla();              
        }, false
    );      
    prd2.addEventListener('keypress', function(e) {
            if (e.keyCode === 13) {
                prd2.blur();                
            } }, false
    ); 
        

    
};

 
function datos_tabla (){
    
   var tipo1 = document.getElementById('desde_tipo');
   var tipo2 = document.getElementById('hasta_tipo');       

   var pg1 = document.getElementById('desde_pg');
   var pg2 = document.getElementById('hasta_pg');           
    
   var sp1 = document.getElementById('desde_sp');
   var sp2 = document.getElementById('hasta_sp');           
   
   var py1 = document.getElementById('desde_py');
   var py2 = document.getElementById('hasta_py');           

    var obj1 = document.getElementById('desde_obj');
    var obj2 = document.getElementById('hasta_obj');           
   
    var ff1 = document.getElementById('desde_ff');
    var ff2 = document.getElementById('hasta_ff');           
   
    var of1 = document.getElementById('desde_of');
    var of2 = document.getElementById('hasta_of');           
   
    var dpt1 = document.getElementById('desde_dpt');
    var dpt2 = document.getElementById('hasta_dpt');           

    var prd1 = document.getElementById('desde_prd');
    var prd2 = document.getElementById('hasta_prd');      
    
    
    AjaxPeticion('../Plan/Coleccion/Lista'
        +'?nn=0'        
        +'&tipo1='+tipo1.value+'&tipo2='+tipo2.value
        +'&pg1='+pg1.value+'&pg2='+pg2.value
        +'&sp1='+sp1.value+'&sp2='+sp2.value
        +'&py1='+py1.value+'&py2='+py2.value
        +'&obj1='+obj1.value+'&obj2='+obj2.value
        +'&ff1='+ff1.value+'&ff2='+ff2.value
        +'&of1='+of1.value+'&of2='+of2.value
        +'&dpt1='+dpt1.value+'&dpt2='+dpt2.value        
        +'&prd1='+prd1.value+'&prd2='+prd2.value        
                ,'tab_body');   
    
    
    
        var jsonResponse = AjaxUrl( '../Plan/Suma.json'
            +'?nn=0'        
            +'&tipo1='+tipo1.value+'&tipo2='+tipo2.value
            +'&pg1='+pg1.value+'&pg2='+pg2.value
            +'&sp1='+sp1.value+'&sp2='+sp2.value
            +'&py1='+py1.value+'&py2='+py2.value
            +'&obj1='+obj1.value+'&obj2='+obj2.value
            +'&ff1='+ff1.value+'&ff2='+ff2.value
            +'&of1='+of1.value+'&of2='+of2.value
            +'&dpt1='+dpt1.value+'&dpt2='+dpt2.value        
            +'&prd1='+prd1.value+'&prd2='+prd2.value   
            );    
        
    
        if (jsonResponse.toString().trim() != "[]")
        {

            var objetoJson = JSON.parse(jsonResponse);    

            var suma_vigente = document.getElementById('suma_vigente');        
            suma_vigente.innerHTML = objetoJson[0].suma_vigente ;

            var suma_certificado = document.getElementById('suma_certificado');        
            suma_certificado.innerHTML = objetoJson[0].suma_certificado ;

            var suma_diferencia = document.getElementById('suma_diferencia');        
            suma_diferencia.innerHTML = objetoJson[0].suma_diferencia ;


        }

    
}




function fomato_tabla (){

    var table = document.getElementById( "ccl_tabla" ).getElementsByTagName('tbody')[0] ;
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


        var suma_vigente = document.getElementById('suma_vigente');        
        suma_vigente.innerHTML = formatoNumero_p(suma_vigente.innerHTML); 
        
        var suma_certificado = document.getElementById('suma_certificado');        
        suma_certificado.innerHTML = formatoNumero_p(suma_certificado.innerHTML); 
        
        var suma_diferencia = document.getElementById('suma_diferencia');
        suma_diferencia.innerHTML = formatoNumero_p(suma_diferencia.innerHTML); 
        

}


