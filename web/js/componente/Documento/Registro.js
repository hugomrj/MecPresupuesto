

window.onload = function() {
    
    DocumentoJson();
    
    
    var codigoid = document.getElementById('doci_id').value;                
    
    
    var agregar = document.getElementById('doci_agregar');
    agregar.addEventListener('click',
        function()
        {
            window.location = "../Documento/Agregar.jspx";
        },
        false
    );          

    
    var  editar = document.getElementById('doci_editar');
    editar.addEventListener('click',
        function()
        {            
            var id = getParametroValor("id");    
            window.location = "../Documento/Editar.jspx?id="+id;
        },
        false
    );         
    
      
      
  
    var borrar = document.getElementById('doci_borrar');
    borrar.addEventListener('click',
        function()
        {    
            var id = getParametroValor("id");    
            window.location = "../Documento/Borrar.jspx?id="+id;
        },
        false
    );      
          
                    
    var listar = document.getElementById('doci_listar');
    listar.addEventListener('click',
        function()
        {
            window.location = "../Documento/Lista.jspx";
        },
        false
    );           
              
        
    
}
