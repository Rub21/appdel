url_data = url_data + 'SObtener_crimenes';
var crimenes = {
    "type": "FeatureCollection",
    "features": []
};
$.getJSON(url_data, {
    format: "json"
}).done(function(data) {
    $.each(data, function(i, item) {
        map.markerLayer.on('layeradd', function(e) {
            var marker = e.layer;
            var feature = marker.feature;
            marker.setIcon(myIcon);
            var popupContent = "<h2>" + feature.properties.tipo + "</h2><p>" + feature.properties.descripcion + "</p>" + '<a href="#detail" onclick="fun_detalle(\'' + feature.properties.idcrimen + '\')"> Más Detalle</a>';
            marker.bindPopup(popupContent, {
                closeButton: false,
                minWidth: 200
            });
        });
        var d = {
            "geometry": {
                "type": "Point",
                "coordinates": [item.longitud, item.latitud]
            },
            "type": "Feature",
            "properties": {
                descripcion: item.descripcion,
                direccion_ref: item.direccion_ref,
                estado: item.estado,
                fecha: item.fecha,
                hora: item.hora,
                idcrimen: item.idcrimen,
                idusuario: item.idusuario,
                imagen: item.imagen,
                latitud: item.latitud,
                longitud: item.longitud,
                tipo: item.tipo,
                usuario: item.usuario

            }
        };
        crimenes.features.push(d);
    });
    map.markerLayer.setGeoJSON(crimenes);
});

$(document).on('ready', function() {

//para obtener la fecha en el campo
    var now = new Date();
    now = now.getDate() + '/' + now.getMonth() + '/' + now.getFullYear();
    $('#fecha_inicio').datepicker({
        dateFormat: 'dd/mm/yy',
        dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sabado'],
        dayNamesMin: ['D', 'L', 'M', 'M', 'J', 'V', 'S'],
        dayNamesShort: ['Dom', 'Lun', 'Mar', 'Mie', 'Jue', 'Vie', 'Sab'],
        firstDay: 1,
        maxDate: new Date(),
        minDate: '-2y',
        monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
        monthNamesShort: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
        navigationAsDateFormat: true,
    });
    $('#fecha_fin').datepicker({
        dateFormat: 'dd/mm/yy',
        dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sabado'],
        dayNamesMin: ['D', 'L', 'M', 'M', 'J', 'V', 'S'],
        dayNamesShort: ['Dom', 'Lun', 'Mar', 'Mie', 'Jue', 'Vie', 'Sab'],
        firstDay: 1,
        maxDate: new Date(),
        minDate: '-2y',
        monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
        monthNamesShort: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
        navigationAsDateFormat: true,
    });
//filtrar
    $('#button_filtrar').click(function() {
        var fecha_inicio = $('#fecha_inicio').val().split('/');
        var fecha_fin = $('#fecha_fin').val().split('/');
        if (fecha_inicio === '' || fecha_fin === '') {
            alert('Ingrese la fecha.');
        } else {
            var time_fi = moment(fecha_inicio[1] + '/' + fecha_inicio[0] + '/' + fecha_inicio[2]).unix() * 1000;
            var time_ff = moment(fecha_fin[1] + '/' + fecha_fin[0] + '/' + fecha_fin[2]).unix() * 1000;
            map.markerLayer.setFilter(function(f) {
                if (f.properties.fecha >= time_fi && f.properties.fecha <= time_ff)
                {
                    return true;
                }
            });
        }
    });

    $('#tipo_incidentes li a').click(function() {
        var id = this.id;
        map.markerLayer.setFilter(function(f) {
            return f.properties.tipo === id;
        });
    });

    $('#button_todos').click(function() {
        map.markerLayer.setFilter(function(f) {
            return true;
        });
    });

});

