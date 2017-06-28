

window.onload = function() {




    // objeto
    var objeto = getParametroValor("obj");   
   
    var jsonResponse = AjaxUrl( "../Objeto/Linea.json?obj="+objeto);    
   
    if (jsonResponse.toString().trim() != "[]")
    {
        var objetoJson = JSON.parse(jsonResponse);              
        
        var obj = document.getElementById('obj');
        obj.value = objetoJson[0].obj ;        
        
        var objd = document.getElementById('objd');
        objd.value = objetoJson[0].descripcion ;        
        
    }   





    var idreg = getParametroValor("idreg");   
    var id = getParametroValor("id");   
    CdpJson();
    
        

    var  editar = document.getElementById('cdpa_editar');
    editar.addEventListener('click',
        function()
        {            
            window.location = "../Cdp/Editar.jspx?idreg="+idreg+"&id="+id+"&obj="+objeto;
        },
        false
    );      

  
  
    var borrar = document.getElementById('cdpa_borrar');
    borrar.addEventListener('click',
        function()
        {    
            window.location = "../Cdp/Borrar.jspx?idreg="+idreg+"&id="+id+"&obj="+objeto;
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
