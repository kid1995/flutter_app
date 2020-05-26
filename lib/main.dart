import 'package:flutter/material.dart';
import 'package:flutterapp/mapbox_direction.dart';
import 'package:http/http.dart' as http;


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var points = <Coordinate>[
    new Coordinate(32.77, -96.79),
    new Coordinate(29.76, -95.36),
    new Coordinate(29.42, -98.49),
  ];

  @override
  Widget build(BuildContext context) {
/*
    return new Scaffold(
        appBar: new AppBar(title: new Text('Leaflet Maps')),
        body: new FlutterMap(
            options: new MapOptions(
                center: new LatLng(53.5536567, 10.0264706), minZoom: 5.0),
            layers: [
              new TileLayerOptions(
                  urlTemplate:
                  "https://api.mapbox.com/styles/v1/rajayogan/cjl1bndoi2na42sp2pfh2483p/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiYWRob2MtbmV0d29ya3MtZ21iaCIsImEiOiJjazZycGhwOTEwNWV6M29xcDI0MnB4eWVhIn0.TLaeO84BAhhNpQwlfiSwog",
                  additionalOptions: {
                    'accessToken':
                    'pk.eyJ1IjoiYWRob2MtbmV0d29ya3MtZ21iaCIsImEiOiJjazZycGhwOTEwNWV6M29xcDI0MnB4eWVhIn0.TLaeO84BAhhNpQwlfiSwog',
                    'id': 'mapbox.mapbox-streets-v7'
                  }),
              new MarkerLayerOptions(markers: [
                new Marker(
                    width: 45.0,
                    height: 45.0,
                    point: new LatLng(53.5536567, 10.0264706),
                    builder: (context) => new Container(
                      child: IconButton(
                        icon: Icon(Icons.location_on),
                        color: Colors.blue,
                        iconSize: 45.0,
                        onPressed: () {
                          print('Marker tapped');
                        },
                      ),
                    ))
              ])
            ]));
*/
    return Scaffold(
      appBar: AppBar(
        title: Text("title"),
      ),
      body:
      RaisedButton(
        child: Text("TESTTTTT"),
        onPressed: () {
          fetchRoutes( http.Client(), points,Coordinate(35.22, -101.83), Coordinate(35.22, -101.83));
        },
      )
    );
  }
}


