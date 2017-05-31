
var page = 1;



window.onload = function() {
   

   
    page = getParametroValor('page'); 
    
    Documento_tabla_lista ( );
  
  
    // darle funcionalidad a buscar
    var buscar = document.getElementById('buscar');
    buscar.addEventListener('keyup',
        function(event) {

            if(event.keyCode == 13)
            {
                Documento_tabla_lista ( );
            }
        },
        false
    );

    
};

function Documento_tabla_lista ( ){

        // controlar si existe session
        session = AjaxUrl ("../Usuario/Session") ;
        if (session == null){
            session = 0;
        }        
        else
        {
            session = session.toString().trim();
        }        
           
        
            AjaxPeticion('../Documento/Coleccion/Lista?buscar='
                +document.getElementById('buscar').value  
                +"&page="+page
                ,'tab_body');          
                                
                
            // paginacion                                
            var totalregistros = document.getElementById("doc_tabla").dataset.totalregistros;  
            AjaxPeticion('../Paginacion?page='+page+"&totalregistros="+totalregistros
                +"&lineas=10"
                ,'div_paginacion');     
                
            paginacionajax ( "Documento_tabla_lista();"  );
            
            
            
                
            Documento_sub_Registro( );
            Formato_documento_lista_tabla();                
    
    
}



function Documento_sub_Registro (   ){

    var tabla = 'doc_tabla';            
    Documento_sub_tabla( tabla, 800, 250);

};


function  Documento_sub_tabla (tabla , largo, ancho ){

        //tabla tab rol
        var tabla_coleccion = document.getElementById( tabla ).getElementsByTagName('tbody')[0];
        var rows = tabla_coleccion.getElementsByTagName('tr');



        //  obtener codigo de usuario
        session = AjaxUrl ("../Usuario/Session") ;
        if (session == null){
            session = 0;
        }        
        else
        {
            session = session.toString().trim();
        }



        for (var i=0 ; i < rows.length; i++)
        {
            rows[i].addEventListener ( 'click',
                function() {                                        
                    //registroid = this.getElementsByTagName('id')[0].dataset.linea_id;                    
                    registroid = this.dataset.linea_id;                                       
                    window.location = "../Documento/Registro.jspx?id="+registroid;                    
                },
                false
            );
    
    
            // colores para la lineas de usuarios
    
            usuarioid = rows[i].dataset.usuario;            
            estadoid = rows[i].dataset.estado; 
            if (usuarioid.toString().trim() == session.toString().trim())
            {
                // controlar si no es estado 4 no estado 3
                if (estadoid != 4 && estadoid != 3)
                {
                    for (var x = 0; x < 6; x++) {
                        rows[i].cells[x].style.backgroundColor = "#c7e2c7";  
                    }
                }
            }    
        }
    }



function Formato_documento_lista_tabla (){

    var table = document.getElementById( "doc_tabla" ).getElementsByTagName('tbody')[0] ;
    var rows = table.rows.length;
    var cell ;
 
 
    for(i=0; i<rows; i++)
    {  
        cell = table.rows[i].cells[0] ;                                  
        cell.innerHTML = formatoNumero_p(cell.innerHTML); 

    }    
    

}
