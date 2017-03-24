

window.onload = function() {
    
    PersonaJson();
    
    
    
    var Clase = "Persona";
    var filtroID = "?id="+document.getElementById('pe_persona').value;
       
    var agregar = document.getElementById('pe_agregar');
    agregar.addEventListener('click',
        function()
        {
            window.location = "../"+Clase+"/Agregar.jspx";
        },
        false
    );    
    

    var  editar = document.getElementById('pe_editar');
    editar.addEventListener('click',
        function()
        {            
            var id = getParametroValor("id");    
            window.location = "../Persona/Editar.jspx?id="+id;
        },
        false
    );      

  
  
    var borrar = document.getElementById('pe_borrar');
    borrar.addEventListener('click',
        function()
        {    
            var id = getParametroValor("id");    
            window.location = "../Persona/Borrar.jspx?id="+id;
        },
        false
    );      
    
   
   
    var listar = document.getElementById('pe_listar');
    listar.addEventListener('click',
        function()
        {
            window.location = "../"+Clase+"/Lista.jspx";
        },
        false
    );           
    
    
    
    
    
}
