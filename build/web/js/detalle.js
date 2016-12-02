function fun_detalle(id) {
    //dar Formato al la ventana
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
    console.log(crimenes)
    _.each(crimenes.features, function(value, key) {
        if (crimenes.features[key].properties.idcrimen === id) {
            crimen = crimenes.features[key];
        }
    });
    $('.tipo').empty();
    $('.fecha').empty();
    $('.hora').empty();
    $('.usuario').empty();
    $('.descripcion').empty();
    $('.direccion_ref').empty();
    $('.imagen').css('display', 'none');
    $('.imagen').empty();
    $('.tipo').text(crimen.properties.tipo);
    $('.fecha').text(get_date(crimen.properties.fecha));
    $('.hora').text(crimen.properties.hora);
    $('.usuario').text(crimen.properties.usuario);
    $('.descripcion').text(crimen.properties.descripcion);
    $('.direccion_ref').text(crimen.properties.direccion_ref);

    if (crimen.properties.imagen !== 'no-img') {
        $('.imagen').css('display', 'block');
        $('.imagen').attr("src", "crimen_imagenes/" + crimen.properties.imagen);
    } else {

        $('.imagen').css('display', 'none');
    }
}
;

function  get_date(timestamp) {
    var d = new Date(timestamp);
    var d = new Date(d + '');
    return d.getDate() + '/' + (d.getMonth() + 1) + '/' + d.getFullYear();
}

function check_null(k) {
    if (k.replace(/\s/g, "") + String.fromCharCode(160) !== String.fromCharCode(160)) {
        return true;
    } else {
        return false;
    }
}
;