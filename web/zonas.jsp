<%-- 
    Document   : poligon21
    Created on : Dec 7, 2013, 9:28:00 AM
    Author     : ruben
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Zonas de Incidentes</title>

        <link rel="stylesheet" href="lib/leaflet.css" />
        <jsp:include page="plantillas/styles.jspf"></jsp:include>
        <style>
            #map {
                width: 100%;
                height: 550px;
                margin-top: 95px;
            }
            .info {
                padding: 6px 8px;
                font: 14px/16px Arial, Helvetica, sans-serif;
                background: white;
                background: rgba(255,255,255,0.8);
                box-shadow: 0 0 15px rgba(0,0,0,0.2);
                border-radius: 5px;
            }
            .info h4 {
                margin: 0 0 5px;
                color: #777;
            }

            .legend {
                text-align: left;
                line-height: 18px;
                color: #555;
            }
            .legend i {
                width: 18px;
                height: 18px;
                float: left;
                margin-right: 8px;
                opacity: 0.7;
            }

        </style>


    </head>
    <body>
        
         <jsp:include page="plantillas/header.jspf"></jsp:include>
        <div id="map"></div>


        <script src="lib/leaflet.js"></script>
        <script src="lib/underscore-min.js"></script>   
        <script type="text/javascript" src="https://dl.dropboxusercontent.com/u/43116811/ruben/grid_ayac.js"></script>
        <script type="text/javascript" src="http://localhost:8080/appdel/SObtener_densidad"></script>

        <script type="text/javascript">
            _.each(grid_ayac.features, function(value, key) {
                var gid = grid_ayac.features[key].properties.gid - 1;
                grid_ayac.features[key].properties["cant"] = cantidad[gid].cantidad;
            });

            console.log(grid_ayac.features);


            var map = L.map('map').setView([-13.1548, -74.2044], 15);

            L.tileLayer('http://{s}.tiles.mapbox.com/v3/ruben.mapa_seguridadciudadana/{z}/{x}/{y}.png').addTo(map);
            //  L.geoJson(statesData).addTo(map);




            // control that shows state info on hover
            var info = L.control();

            info.onAdd = function(map) {
                this._div = L.DomUtil.create('div', 'info');
                this.update();
                return this._div;
            };

            info.update = function(props) {
                this._div.innerHTML = '<h4>Incidentes por zonas</h4>' + (props ?
                        props.cant + ' Incidentes'
                        : 'Indique una zona');
            };

            info.addTo(map);




            function getColor(d) {
                return d > 100 ? '#800026' :
                        d > 50 ? '#BD0026' :
                        d > 20 ? '#E31A1C' :
                        d > 10 ? '#FC4E2A' :
                        d > 5 ? '#FD8D3C' :
                        d > 2 ? '#FEB24C' :
                        d >= 1 ? '#FED976' :
                        '#ffffff';
            }


            function style(feature) {
                return {
                    fillColor: getColor(feature.properties.cant),
                    weight: 0.5,
                    opacity: 1,
                    color: 'white',
                    dashArray: '3',
                    fillOpacity: 0.3
                };
            }

            L.geoJson(grid_ayac, {style: style}).addTo(map);


            function highlightFeature(e) {
                var layer = e.target;

                layer.setStyle({
                    weight: 5,
                    color: '#666',
                    dashArray: '',
                    fillOpacity: 0.7
                });

                if (!L.Browser.ie && !L.Browser.opera) {
                    layer.bringToFront();
                }

                info.update(layer.feature.properties);
            }

            var geojson;

            function resetHighlight(e) {
                geojson.resetStyle(e.target);
                info.update();
            }

            function zoomToFeature(e) {
                map.fitBounds(e.target.getBounds());
            }

            function onEachFeature(feature, layer) {
                layer.on({
                    mouseover: highlightFeature,
                    mouseout: resetHighlight,
                    click: zoomToFeature
                });
            }

            geojson = L.geoJson(grid_ayac, {
                style: style,
                onEachFeature: onEachFeature
            }).addTo(map);

            map.attributionControl.addAttribution('Population data &copy; <a href="http://census.gov/">US Census Bureau</a>');


            var legend = L.control({position: 'bottomright'});

            legend.onAdd = function(map) {

                var div = L.DomUtil.create('div', 'info legend'),
                        grades = [0, 1, 2, 5, 10, 20, 50, 100],
                        labels = [],
                        from, to;

                for (var i = 0; i < grades.length; i++) {
                    from = grades[i];
                    to = grades[i + 1];

                    labels.push(
                            '<i style="background:' + getColor(from + 1) + '"></i> ' +
                            from + (to ? '&ndash;' + to : '+'));
                }

                div.innerHTML = labels.join('<br>');
                return div;
            };

            legend.addTo(map);

        </script>

    </body>
</html>
