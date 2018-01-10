

window.onload = function() {
   
   
   
    AjaxPeticion('../Permiso/Coleccion/Lista','listaProcesos');      
    

    // casos especiales
    
    // documentos
    documentoid = "li_id_1";
    
    if(typeof document.getElementById(documentoid)!=="undefined"){ 
    
        var elem_li_id_1 = document.getElementById( documentoid);
        elem_li_id_1.getElementsByTagName('a')[0].href = "#" ;
    
        elem_li_id_1.addEventListener('click',
            function()
            {  
                
                    var fecha = new Date();
                    var agno = fecha.getFullYear();
                    
                    

                    location.href ="../Documento/Lista.jspx"+"?aa="+agno;

            },
            false
        );   

    
    
    
    } 




};



