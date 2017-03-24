

window.onload = function() {

    var idreg = getParametroValor("idreg");   
    var id = getParametroValor("id");   
    CdpJson();
    
        

    var  editar = document.getElementById('cdpa_editar');
    editar.addEventListener('click',
        function()
        {            
            window.location = "../Cdp/Editar.jspx?idreg="+idreg+"&id="+id;
        },
        false
    );      

  
  
    var borrar = document.getElementById('cdpa_borrar');
    borrar.addEventListener('click',
        function()
        {    
            window.location = "../Cdp/Borrar.jspx?idreg="+idreg+"&id="+id;
        },
        false
    );      
    
   
   
    var listar = document.getElementById('cdpa_listar');
    listar.addEventListener('click',
        function()
        {
            window.location = "../Cdp/Indice.jspx";
        },
        false
    );           
    
        
    




}
