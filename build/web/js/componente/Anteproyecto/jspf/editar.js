
function AnteproyectoObjeto_TablaRegistro_registro_editar ( id  ){
    
     AnteproyectoJson(id);
         
    var antea_id = document.getElementById('antea_id') ;
    antea_id.value = id;         
    
    var proya_vigente = document.getElementById('proya_vigente') ;
    proya_vigente.disabled = true;
    
    
    var proya_ideal = document.getElementById( 'proya_ideal');
    if (proya_ideal.value == ""){
        proya_ideal.value = 0;
    }
    proya_ideal.onblur  = function() {
        zero( 'proya_ideal');        
        proya_ideal.value = formatoNumero_p(proya_ideal.value);                      
    };
    proya_ideal.setSelectionRange(0, proya_ideal.value.length);
    //proya_ideal.focus();
    
    
    
    var antee_aceptar = document.getElementById('antee_aceptar');
    antee_aceptar.addEventListener('click',
        function() {

                if (AnteproyectoObjeto_TablaRegistro_registro_validacion()){

                    //var pafeje_uoc_id = document.getElementById('pafeje_uoc_id');
                    //pafeje_uoc_id.value = registro;

                    var form = document.getElementById("antee_form");            
                    var accion =  form.getAttribute('action') ;                                       
                    var control = AjaxPeticionURL( accion, getDataForm(form) );      
                    
                    if (control == null){    
                        AnteproyectoObjeto_funcionalidad();
                        antee_cerrar.click();
                    }
                    else{                    
                        alerta_error(control);
                    }  
                }  
        },
        false
    );    
    
    
    
    
    
    
    var antee_cerrar = document.getElementById('antee_cerrar');
    antee_cerrar.addEventListener('click',
        function() {    
            AnteproyectoObjeto_funcionalidad();
            javascript:ocultarVentana('capa_oscura');
            javascript:ocultarVentana('capa_clara');
        },
        false
    );       
    
    

        // aca traer subcomponentes relacionados
        DistribucionComponente_subtabla(id);
    

    
    
    
    
}

function DistribucionComponente_subtabla(id)
{

        AjaxPeticion('../../DistribucionComponente/Coleccion/Lista?id='+id,
        'distri_subcom');   
        
        DistribucionComponente_subtabla_Registro();
        
        
        
        var antee_subcom = document.getElementById("antee_subcom");
        antee_subcom.addEventListener('click',
            function() {   

                    AjaxPeticion( '../../DistribucionComponente/jspf/agregar.jspx' , 'capa_clara_segunda' );
                    mostrarVentana('capa_oscura_segunda');
                    mostrarVentana('capa_clara_segunda');                                                       
                    dimensionarVentana('capa_clara_segunda', 900, 250);        
                    
                    DistribucionComponente_agregar(id);
                    
            },
            false
        );               
    
}



function  DistribucionComponente_subtabla_Registro ( ){

        var tabla_coleccion = document.getElementById( 'presusubcom_tabla' ).getElementsByTagName('tbody')[0];
        var rows = tabla_coleccion.getElementsByTagName('tr');


        for (var i=0 ; i < rows.length; i++)
        {
            rows[i].addEventListener ( 'click',
                function() {                                        
              
                    registroid = this.dataset.linea_id;                                       
                   
                    AjaxPeticion( '../../DistribucionComponente/jspf/registro.jspx' , 'capa_clara_segunda' );
                    mostrarVentana('capa_oscura_segunda');
                    mostrarVentana('capa_clara_segunda');                                                       
                    dimensionarVentana('capa_clara_segunda', 900, 250);                   
                
                    DistribucionComponente_registro ( registroid );
                    
                },
                false
            );
        }
        DistribucionSubcomponente_subtabla_Formato();
        
    }







function DistribucionSubcomponente_subtabla_Formato (){

    var table = document.getElementById( "presusubcom_tabla" ).getElementsByTagName('tbody')[0] ;
    var rows = table.rows.length;
    var cell ;
 
    for(i=0; i<rows; i++)
    {      
        cell = table.rows[i].cells[2] ;                                  
        cell.innerHTML = formatoNumero_p(cell.innerHTML);
        cell.className = "numero";
    }    
}







function AnteproyectoJson(id)
{
  
    var jsonResponse = AjaxUrl( "../../Anteproyecto/Linea.json?id="+id );    
    
    if (jsonResponse.toString().trim() != "[]")
    {        
        var objetoJson = JSON.parse(jsonResponse);    
            
        var proya_vigente = document.getElementById('proya_vigente');        
        proya_vigente.value =  formatoNumero_p(objetoJson[0].vigente);                      
  
        var proya_ideal = document.getElementById('proya_ideal');        
        proya_ideal.value =  formatoNumero_p(objetoJson[0].ideal);      
        
        
    }    

    
}


function AnteproyectoObjeto_TablaRegistro_registro_validacion(){
    
    
    return true;
}