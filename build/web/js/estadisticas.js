google.load("visualization", "1", {
    packages: ["corechart"]
});
function  dibujar_meses(f) {
    var rowArray = [];
    for (var i = 0; i < f.length; i++) {
        console.log(f[i].mes);
        console.log(f[i].cantidad);
        rowArray.push([f[i].mes, f[i].cantidad]);
    }
    ;
    drawChart();
    function drawChart() {
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Mes');
        data.addColumn('number', 'Num puntos');
        data.addRows(rowArray);
        var options = {
            //height: 200,
            title: 'Estadisticas por mes',
            titleTextStyle: {
                color: 'black',
                fontSize: 14},
            colors: ['#E55C3C'],
            legend: 'none',
            hAxis: {
                title: 'Mes',
                titleTextStyle: {
                    color: '#404040',
                    fontSize: 9
                },
                textStyle: {fontSize: 9}

            },
            vAxis: {
                title: 'Num de Puntos',
                titleTextStyle: {
                    color: '#404040',
                    fontSize: 9
                },
                textStyle: {fontSize: 9}
            },
            chartArea: {
                left: 85,
                top: 25,
                width: "600px",
                height: "250px"
            }
        };
        var chart = new google.visualization.ColumnChart(document.getElementById('est_mes'));
        chart.draw(data, options);
    }
}
;


function  dibujar_crimen(f) {
    console.log(f);
    var rowArray = [];
    for (var i = 0; i < f.length; i++) {
        rowArray.push([f[i].tipo, f[i].inc_total]);

    }
    ;

    drawChart();

    function drawChart() {
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Incidente');
        data.addColumn('number', 'Num puntos');
        data.addRows(rowArray);
        var options = {
            //height: 200,
            title: 'Estadisticas por Crimen',
            titleTextStyle: {
                color: 'black',
                fontSize: 14},
            colors: ['#3D5B99'],
            legend: 'none',
            hAxis: {
                title: 'Mes',
                titleTextStyle: {
                    color: '#404040',
                    fontSize: 9
                },
                textStyle: {fontSize: 9}

            },
            vAxis: {
                title: 'Num de puntos',
                titleTextStyle: {
                    color: '#404040',
                    fontSize: 9
                },
                textStyle: {fontSize: 9}
            },
            chartArea: {
                left: 85,
                top: 25,
                width: "600px",
                height: "250px"
            }
        };
        var chart = new google.visualization.ColumnChart(document.getElementById('est_crimen'));
        chart.draw(data, options);
    }
}
;
function  dibujar_tipo_incidente(f) {

    fmeses = f.meses;
    console.log(fmeses);
    var rowArray = [];
    for (var i = 0; i < fmeses.length; i++) {
        console.log(fmeses[i].mes);
        console.log(fmeses[i].cantidad);

        rowArray.push([fmeses[i].mes, fmeses[i].cantidad]);

    }
    ;
    drawChart();

    function drawChart() {
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Mes');
        data.addColumn('number', 'Num puntos');
        data.addRows(rowArray);
        var options = {
            //height: 200,
            title: 'Incidente : ' + f.tipo + ", Num incidente total : " + f.inc_total,
            titleTextStyle: {
                color: 'black',
                fontSize: 14},
            colors: ['#3FAA55'],
            legend: 'none',
            hAxis: {
                title: 'Mes',
                titleTextStyle: {
                    color: '#404040',
                    fontSize: 9
                },
                textStyle: {fontSize: 9}

            },
            vAxis: {
                title: 'Num de Puntos',
                titleTextStyle: {
                    color: '#404040',
                    fontSize: 9
                },
                textStyle: {fontSize: 9}
            },
            chartArea: {
                left: 85,
                top: 25,
                width: "600px",
                height: "250px"
            }
        };
        var chart = new google.visualization.ColumnChart(document.getElementById('tipo_incidente'));
        chart.draw(data, options);
    }
}
;
$(document).on('ready', function() {
    dibujar_meses(cif_mes.cifras_mes);
    dibujar_crimen(cif_crimen.cifras_crimen);
    dibujar_tipo_incidente(cifras_robo);
    $('#tipo').click(function() {
        var tipo = $('#tipo').val();
        console.log(tipo)
        if (tipo === 'robo') {
            dibujar_tipo_incidente(cifras_robo);
        } else if (tipo === 'agresion') {
            dibujar_tipo_incidente(cifras_agresion);

        }else if(tipo==="accidente"){
            dibujar_tipo_incidente(cifras_accidente);
        }else if(tipo==="violencia_familiar"){
            dibujar_tipo_incidente(cifras_violencia_familiar);
        }else if(tipo==="otros"){
            dibujar_tipo_incidente(cifras_otros_incidentes);
        }
    });
});



