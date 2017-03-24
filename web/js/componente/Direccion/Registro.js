

window.onload = function() {
    
    DireccionJson();
                
        
    var Clase = "Direccion"    
    var filtroID = "?id="+document.getElementById('di_id').value;
       
    var agregar = document.getElementById('di_agregar');
    agregar.addEventListener('click',
        function()
        {
            window.location = "../"+Clase+"/Agregar.jspx";
        },
        false
    );    
    

    var  editar = document.getElementById('di_editar');
    editar.addEventListener('click',
        function()
        {            
            var id = getParametroValor("id");    
            window.location = "../"+Clase+"/Editar.jspx?id="+id;
        },
        false
    );      

  
  
    var borrar = document.getElementById('di_borrar');
    borrar.addEventListener('click',
        function()
        {    
            var id = getParametroValor("id");    
            window.location = "../Direccion/Borrar.jspx?id="+id;
        },
        false
    );      
    
   
   
    var listar = document.getElementById('di_listar');
    listar.addEventListener('click',
        function()
        {
            window.location = "../"+Clase+"/Lista.jspx";
        },
        false
    );           
    
    
    
    
    
}
