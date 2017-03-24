



function cajachica_ditribucionMeses_destino ( uoc_id ){
    
    
    var mes1 = document.getElementById('mes1');
    var mes2 = document.getElementById('mes2');
    var mes3 = document.getElementById('mes3');
    var mes4 = document.getElementById('mes4');
    var mes5 = document.getElementById('mes5');
    var mes6 = document.getElementById('mes6');
    var mes7 = document.getElementById('mes7');
    var mes8 = document.getElementById('mes8');
    var mes9 = document.getElementById('mes9');
    var mes10 = document.getElementById('mes10');
    var mes11 = document.getElementById('mes11');
    var mes12 = document.getElementById('mes12');
    
        
    mes1.style.cursor = "pointer";
    mes1.addEventListener('click',
        function() {   
                var link = "../CajachicaCertificacion/Lista.jspx?mes=1&uoc_id="+uoc_id;                                             
                window.location =link;     
        },
        false
    );          
        
    mes2.style.cursor = "pointer";
    mes2.addEventListener('click',
        function() {   
                var link = "../CajachicaCertificacion/Lista.jspx?mes=2&uoc_id="+uoc_id;                                             
                window.location =link;     
        },
        false
    );          
        
    mes3.style.cursor = "pointer";
    mes3.addEventListener('click',
        function() {   
                var link = "../CajachicaCertificacion/Lista.jspx?mes=3&uoc_id="+uoc_id;                                             
                window.location = link;     
        },
        false
    );          
        
    mes4.style.cursor = "pointer";
    mes4.addEventListener('click',
        function() {   
                var link = "../CajachicaCertificacion/Lista.jspx?mes=4&uoc_id="+uoc_id;                                             
                window.location = link;     
        },
        false
    );          
        
    mes5.style.cursor = "pointer";
    mes5.addEventListener('click',
        function() {   
                var link = "../CajachicaCertificacion/Lista.jspx?mes=5&uoc_id="+uoc_id;                                             
                window.location = link;     
        },
        false
    );          
        
    mes6.style.cursor = "pointer";
    mes6.addEventListener('click',
        function() {   
                var link = "../CajachicaCertificacion/Lista.jspx?mes=6&uoc_id="+uoc_id;                                             
                window.location = link;     
        },
        false
    );          
        
    mes7.style.cursor = "pointer";
    mes7.addEventListener('click',
        function() {   
                var link = "../CajachicaCertificacion/Lista.jspx?mes=7&uoc_id="+uoc_id;                                             
                window.location = link;     
        },
        false
    );          
        
    mes8.style.cursor = "pointer";
    mes8.addEventListener('click',
        function() {   
                var link = "../CajachicaCertificacion/Lista.jspx?mes=8&uoc_id="+uoc_id;                                             
                window.location = link;     
        },
        false
    );          
        
    mes9.style.cursor = "pointer";
    mes9.addEventListener('click',
        function() {   
                var link = "../CajachicaCertificacion/Lista.jspx?mes=9&uoc_id="+uoc_id;                                             
                window.location = link;     
        },
        false
    );          
        
    mes10.style.cursor = "pointer";
    mes10.addEventListener('click',
        function() {   
                var link = "../CajachicaCertificacion/Lista.jspx?mes=10&uoc_id="+uoc_id;                                             
                window.location = link;     
        },
        false
    );          
        
    mes11.style.cursor = "pointer";
    mes11.addEventListener('click',
        function() {   
                var link = "../CajachicaCertificacion/Lista.jspx?mes=11&uoc_id="+uoc_id;                                             
                window.location = link;     
        },
        false
    );          
        
    mes12.style.cursor = "pointer";
    mes12.addEventListener('click',
        function() {   
                var link = "../CajachicaCertificacion/Lista.jspx?mes=12&uoc_id="+uoc_id;                                             
                window.location = link;     
        },
        false
    );          
        
        
    
}