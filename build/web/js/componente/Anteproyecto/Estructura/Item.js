

var niv = 0;


window.onload = function() {
              
    niv = getParametroValor("niv");   

    Item_formulario();

    
};




function  Item_formulario ( ){
    
    AjaxPeticion('../../Item/Coleccion/PresupuestoLista?niv='+niv,'tab_body');  
    Item_tabla_Registro( "item_tabla");


    var ite_agregar = document.getElementById('ite_agregar');
    ite_agregar.addEventListener('click',
        function() {   
        
            
                mostrarVentana('capa_oscura');
                mostrarVentana('capa_clara');                           
                dimensionarVentana('capa_clara', 900, 250);                    
                
                
                AjaxPeticion( '../../Item/jspf/agregar.jspx' , 'capa_clara' );     
            
                Item_agregar( niv );
                
        },
        false
    );      
    
    
}




function  Item_tabla_Registro (tabla ){

        var tabla_coleccion = document.getElementById( tabla ).getElementsByTagName('tbody')[0];
        var rows = tabla_coleccion.getElementsByTagName('tr');


        for (var i=0 ; i < rows.length; i++)
        {
            rows[i].addEventListener ( 'click',
                function() {                                        
              
                    registroid = this.dataset.linea_id;        
                    window.location = "../Estructura/Proposito.jspx?ite="+registroid;                            
                    
                },
                false
            );
        }
        
        Item_tabla_formato(tabla);
        
    }




function  Item_tabla_formato (tabla ){

        var tabla_coleccion = document.getElementById( tabla ).getElementsByTagName('tbody')[0];
        var rows = tabla_coleccion.getElementsByTagName('tr');


        for (var i=0 ; i < rows.length; i++)
        {

            cell = tabla_coleccion.rows[i].cells[2] ;                                  
            cell.innerHTML = formatoNumero_p(cell.innerHTML);
            cell.className = "numero";

        }
        
    }
