

function Ingreso_Distribucion_Meses ( elementoRetorno, valorid, valordireccion, valormes )
{

        
        var elemento = document.getElementById(elementoRetorno);        
        var jsonResponse = AjaxUrl( "../DistribucionIngreso/Mensual.json?idreg="+valorid 
                    +"&dire="+valordireccion+"&mes="+valormes);  
        
        if (jsonResponse.toString().trim() != "[]")
        {
            var objetoJson = JSON.parse(jsonResponse);                
            elemento.value = objetoJson[0].montomes ;
            
        }
        else
        {        
            elemento.value = "" ;
            
        }
        
        
}        




function Ingreso_Ejecucion_Meses ( elementoRetorno, valorid, valordireccion, valormes )
{
    
        var elemento = document.getElementById(elementoRetorno);        
        var jsonResponse = AjaxUrl( "../IngresoCertificacion/Mensual.json?idreg="+valorid 
                    +"&dire="+valordireccion+"&mes="+valormes);  
        
        if (jsonResponse.toString().trim() != "[]")
        {
            var objetoJson = JSON.parse(jsonResponse);                
            elemento.value = objetoJson[0].montomes ;
            
        }
        else
        {        
            elemento.value = "" ;
            
        }
        
        
}        


function Ejecucion_Mes_Saldo ( elementoRetorno, valorid, valordireccion, valormes  )
{
    
        if (valormes == 1){            
            valormes = 0;
        }
        else{
            valormes = valormes-1;
        }
        

    
        var elemento = document.getElementById(elementoRetorno);        
        var jsonResponse = AjaxUrl( "../IngresoEjecucion/SaldoMes.json?idreg="+valorid 
                    +"&dire="+valordireccion+"&mes="+valormes);  
        
        if (jsonResponse.toString().trim() != "[]")
        {
            var objetoJson = JSON.parse(jsonResponse);                
            elemento.value = objetoJson[0].saldomes ;
            
        }
        else
        {        
            elemento.value = "0" ;
            
        }
        
        
}        



