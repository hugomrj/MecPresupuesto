

window.onload = function() {
   
    
    var idreg = getParametroValor("idreg");
    
    var jsonResponse = AjaxUrl( "../Plan/Linea.json?idreg="+idreg );    
    
    if (jsonResponse.toString().trim() != "[]")
    {
        
        var objetoJson = JSON.parse(jsonResponse);    
              
        var lbl_tp = document.getElementById('lbl_tp');        
        lbl_tp.innerHTML ="tp : "+ objetoJson[0].tp ;
        
        var lbl_pg = document.getElementById('lbl_pg');        
        lbl_pg.innerHTML ="pg : "+ objetoJson[0].pg ;        
        
        var lbl_sp = document.getElementById('lbl_sp');        
        lbl_sp.innerHTML ="sp : "+ objetoJson[0].sp ;        
        
        var lbl_py = document.getElementById('lbl_py');        
        lbl_py.innerHTML ="py : "+ objetoJson[0].py ;        
        
        var lbl_obj = document.getElementById('lbl_obj');        
        lbl_obj.innerHTML ="obj : "+ objetoJson[0].obj ;        
        
        var lbl_ff = document.getElementById('lbl_ff');        
        lbl_ff.innerHTML ="ff : "+ objetoJson[0].ff ;        
        
        var lbl_of = document.getElementById('lbl_of');        
        lbl_of.innerHTML ="of : "+ objetoJson[0].of ;        
        
        var lbl_dpt = document.getElementById('lbl_dpt');        
        lbl_dpt.innerHTML ="dpt : "+ objetoJson[0].dpt ;        
        
        var lbl_prd = document.getElementById('lbl_prd');        
        lbl_prd.innerHTML ="prod : "+ objetoJson[0].producto ;        
        
        
        datos_tabla_ccld_tabla();
        
        
    }
    
};





function datos_tabla_ccld_tabla (){

    // traer datos de tabla    
    var idreg = getParametroValor("idreg");
    
    AjaxPeticion('../PlanDetalle/Coleccion/Lista?idreg='+idreg,'tab_body');              
    fomato_tabla_ccld_tabla();        


    var cd_agregar = document.getElementById('cd_agregar');
    cd_agregar.addEventListener('click',
        function() {            
            //window.location = "../Venta/Transaccion/Cancelar.do";        
            
                mostrarVentana('capa_oscura');
                mostrarVentana('capa_clara');
                
                AjaxPeticion( '../PlanDetalle/Vista/Agregar' , 'capa_clara' );
                dimensionarVentana('capa_clara', 800, 250);                    
     
                PlanDetalle_sub_Agregar( idreg );
                
            
        },
        false
    );  

    PlanDetalle_sub_Registro();

};









function fomato_tabla_ccld_tabla (){

    var table = document.getElementById( "ccld_tabla" ).getElementsByTagName('tbody')[0] ;
    var rows = table.rows.length;
    var cell ;
 
    for(i=0; i<rows; i++)
    {      
        cell = table.rows[i].cells[4] ;                                  
        cell.innerHTML = formatoNumero_p(cell.innerHTML); 
        
        
        cell = table.rows[i].cells[5] ;                                  
        cell.innerHTML = formatoNumero_p(cell.innerHTML); 
            
        
        
    }    


}


