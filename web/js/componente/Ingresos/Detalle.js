

window.onload = function() {
    
    
    var idreg = getParametroValor("idreg");
    
    // click en pestañas
        
    var ingre_pf = document.getElementById('ingre_pf');
    pestagnas(ingre_pf);         
    
        
    var ingre_certi = document.getElementById('ingre_certi');
    ingre_certi.addEventListener('click',
        function() {                
            pestagnas(ingre_certi);            
            IngresoCertificacion_estructura ( idreg );
        },
        false
    );               
        
    
    
    var ingre_eje = document.getElementById('ingre_eje');
    ingre_eje.addEventListener('click',
        function() {                            
            pestagnas(ingre_eje);       
            IngresoEjecucion_estructura ( idreg );            
        },
        false
    );               
            
    
    
    datos_tabla_dite_tabla();
    
    
};












function editar_tabla_dite_tabla (){
    
    
    var table = document.getElementById( "dite_tabla" ).getElementsByTagName('tbody')[0] ;
    
    //var rows = table.rows.length;
    var regs = table.getElementsByTagName('tr');        
            
    for(i=0; i < regs.length; i++)
    {      
        titulo = regs[i].dataset.titulo;        
        if (titulo == "si"){
    
            regs[i].addEventListener ( 'click',
                function() {
                
                    registroid = this.dataset.linea_id;

                    mostrarVentana('capa_oscura');
                    mostrarVentana('capa_clara');
                   
                    AjaxPeticion( '../DistribucionIngreso/Vista/Editar' , 'capa_clara' );

                    dimensionarVentana('capa_clara', 900, 250);                    

                    DistribucionIngreso_editar(registroid);

                                                    
                },
                false
            );
            
        }
        
    }
    
    
    

    
    
}



    function pestagnas ( elementoID  )
    {
        
    
        var strDisplay = "display: inline-table; padding: 1rem; cursor: pointer;";
        var strBorder = " border-bottom: solid 1px;";
                
        document.getElementById('ingre_pf').style=  strDisplay;           
        document.getElementById('ingre_certi').style=  strDisplay;           
        document.getElementById('ingre_eje').style=  strDisplay;           
        
        
        elementoID.style = strDisplay + strBorder;
        
        
        
    }
    