google.load("visualization", "1", {
    packages: ["corechart"]
});


function  dibujar_meses(f) {
    //console.log(f);

    var rowArray = [];
    for (var i = 0; i < f.length; i++) {
        console.log(f[i].mes);
        console.log(f[i].cantidad);
        rowArray.push([f[i].mes, f[i].cantidad]);

    }
    ;
    //console.log(rowArray);

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
    //console.log(rowArray);

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


$(document).on('ready', function() {

    /*console.log(cif_mes);
     console.log(cif_crimen);*/

    dibujar_meses(cif_mes.cifras_mes);
    dibujar_crimen(cif_crimen.cifras_crimen);



});
