



function Estructura_tabla_registro( link )
{
    var tabla_qry = document.getElementById('pvcl_tabla').getElementsByTagName('tbody')[0];
    var regs = tabla_qry.getElementsByTagName('tr');

    for (var i=0 ; i < regs.length; i++)
    {

        regs[i].addEventListener ( 'click',
            function() {

                var registro_id = this.dataset.registro_id;                                                    
                window.location = link + registro_id;     
                        
            },
            false
        );

    }

};

