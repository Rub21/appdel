
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



    $('.tipo').empty();
    $('.fecha').empty();
    $('.hora').empty();
    $('.usuario').empty();
    $('.descripcion').empty();
    $('.direccion_ref').empty();
    $('.imagen').css('display', 'none');
    $('.imagen').empty();

    $('.tipo').text(crimen.tipo);
    $('.fecha').text(get_date(crimen.fecha));
    $('.hora').text(crimen.hora);
    $('.usuario').text(crimen.usuario);
    $('.descripcion').text(crimen.descripcion);
    $('.direccion_ref').text(crimen.direccion_ref);

    if (check_null(crimen.imagen)) {
        $('.imagen').css('display', 'block');
        $('.imagen').attr("src", "crimen_imagenes/" + crimen.imagen);
    } else {

        $('.imagen').css('display', 'none');
    }





}
;


function  get_date(timestamp) {
    var d = new Date(timestamp);
    /*  console.log(d.getTime())
     var months = [
     'Jan', 'Feb', 'Mar', 'Apr',
     'May', 'Jun', 'Jul', 'Aug',
     'Sept', 'Oct', 'Nov', 'Dec'
     ];*/
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