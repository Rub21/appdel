
function fun_detalle(id) {
    //alert(id);

    //da Formato al la ventana
    $('.click').trigger('click');
    $('#popover').css({
        'width': '700px',
        'margin-top': '-1%',
        'margin-left': function() {
            return -($(this).width() / 2);
        }
    });


//Busca el crimen selecionado
    var crimen;
    _.each(crimenes, function(value, key) {
        console.log(crimenes[key])
        if (crimenes[key].idcrimen === id) {
            crimen = crimenes[key];
        }
    });

    var d = new Date(crimen.fecha * 1000)

    $('.tipo').text(crimen.tipo);
    
    /*    tm_mday: myDate.getDate(),
    tm_mon:  myDate.getMonth(),
    tm_year: myDate.getFullYear().toString().substring(2),
    tm_wday: myDate.getDay()
    */
    
    
    $('.fecha').text(d.getDay()+'/'+ d.getMonth() +'/'+d.getFullYear());
    $('.hora').text(crimen.hora);
    $('.usuario').text(crimen.usuario);


    $('.descripcion').text(crimen.descripcion);
    $('.direccion_ref').text(crimen.direccion_ref);

    $('.imagen').attr("src", "crimen_imagenes/" + crimen.imagen);




}
;