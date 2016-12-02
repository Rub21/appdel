
function fun_detalle(id) {
//habilitar botones
    $('#button_submit').prop("disabled", false);
    $('#mensaje_alert').empty();
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
    console.log(crimenes)
    _.each(crimenes.features, function(value, key) {

        //console.log(crimenes.features[key].properties)
        if (crimenes.features[key].properties.idcrimen === id) {
            crimen = crimenes.features[key];
            console.log(crimen)
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

    $('#id_incidente').val(crimen.properties.idcrimen);

    $('.tipo').text(crimen.properties.tipo);
    $('.fecha').text(get_date(crimen.properties.fecha));
    $('.hora').text(crimen.properties.hora);
    $('.usuario').text(crimen.properties.usuario);
    $('.descripcion').text(crimen.properties.descripcion);
    $('.direccion_ref').text(crimen.properties.direccion_ref);

    if (crimen.properties.imagen !== 'no-img') {
        $('.imagen').css('display', 'block');
        $('.imagen').attr("src", "../crimen_imagenes/" + crimen.properties.imagen);
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

$(function() {
    $('#button_submit').click(function(e) {
        e.preventDefault();

        var ajaxdata = $("#id_incidente").val();
        console.log(ajaxdata);
        var value = 'id_incidente=' + ajaxdata;
        console.log(value);
        $.ajax({
            url: "/appdel/SActualizar_incidente",
            //type: "post",
            data: value,
            cache: false,
            success: function(data) {
                $("#id_incidente").val('');
                $('#button_submit').prop("disabled", true);
                $('#mensaje_alert').html('<div class="alert alert-success"> <strong>La Aprobación ha sido sitisfactoria!</strong> ...</div>');
                filtrar_eliminados(ajaxdata);
            }
        });

    });
});



function filtrar_eliminados(id_incidente) {

    console.log(filtro);
    console.log(map.markerLayer._geojson.features);

    var position = 0;
    var position_incidente = 0;

    var arr = _.find(map.markerLayer._geojson.features, function(item) {
        if (item.properties.idcrimen === id_incidente) {
            position_incidente = position;
            console.log(position_incidente);
        }
        position++;
    });

    map.markerLayer._geojson.features.splice(position_incidente, 1);
    console.log(map.markerLayer._geojson.features);

    map.markerLayer.setFilter(function(f) {

        if (filtro.length === 1) {
            return f.properties.tipo === filtro[0];
        } else if (filtro.length === 2) {
            if (f.properties.fecha >= filtro[0] && f.properties.fecha <= filtro[1])
            {

                return true;
            }
        } else {
            return true;
        }

    });

}