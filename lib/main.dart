import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutterapp/map_module.dart';
import 'package:flutterapp/mapbox_direction.dart';
import 'package:flutterapp/smart_bin_service.dart';
import 'package:latlong/latlong.dart';
import 'package:flutterapp/smart_bin.dart';

import 'package:http/http.dart' as http;

import 'module.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new MyHomePage(),
        routes: {
          Map.routeName: (context) => Module(
              'Map ', Map.children, Map.botNavButton),
        }
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var points = <Coordinate>[
    new Coordinate(9.991650, 53.553841),
  ];

  var routePoints = <LatLng>[];
  var sensorList = <SmartBin>[];

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    SmartBinService().fetchSmartBin().then((value) => setState((){
      sensorList = value;
      print("Sensor-List");
      print(sensorList);
    }));
    fetchRoutes( http.Client(), points,Coordinate(10.029130,53.553780 ), Coordinate(10.024580, 53.728890)).then((res) => setState(() {
      routePoints = res.getPolyline();
    }) );

  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
        appBar: new AppBar(title: new Text('Ad-Hoc Map')),
        body:
      /*  RaisedButton(
          child: Text("Map"),
          onPressed: () {
            Navigator.pushNamed(
              context,
              Map.routeName,
            );
          },
        )*/
        new FlutterMap(
            options: new MapOptions(
                center:  LatLng(53.553780 , 10.029130), minZoom: 5.0),
            layers: [
              new TileLayerOptions(
                  urlTemplate:
                  "https://api.mapbox.com/styles/v1/rajayogan/cjl1bndoi2na42sp2pfh2483p/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiYWRob2MtbmV0d29ya3MtZ21iaCIsImEiOiJjazZycGhwOTEwNWV6M29xcDI0MnB4eWVhIn0.TLaeO84BAhhNpQwlfiSwog",
                  additionalOptions: {
                    'accessToken':
                    'pk.eyJ1IjoiYWRob2MtbmV0d29ya3MtZ21iaCIsImEiOiJjazZycGhwOTEwNWV6M29xcDI0MnB4eWVhIn0.TLaeO84BAhhNpQwlfiSwog',
                    'id': 'mapbox.streets-v10'
                  }),
              new PolylineLayerOptions(
                  polylines: [
                    new Polyline(
                        points: routePoints,
                        strokeWidth: 5.0,
                        color: Colors.red
                    )
                  ]
              ),
              new MarkerLayerOptions(markers: [
                new Marker(
                    width: 45.0,
                    height: 45.0,
                    point: LatLng(53.553780 , 10.029130),
                    builder: (context) => new Container(
                      child: IconButton(
                        icon: Icon(Icons.location_on),
                        color: Colors.blue,
                        iconSize: 45.0,
                        onPressed: () {
                          print('Marker tapped');
                        },
                      ),
                    )),
                new Marker(
                    width: 45.0,
                    height: 45.0,
                    point: LatLng(53.728890 , 10.024580),
                    builder: (context) => new Container(
                      child: IconButton(
                        icon: Icon(Icons.location_on),
                        color: Colors.red,
                        iconSize: 45.0,
                        onPressed: () {
                          print('Marker tapped');
                        },
                      ),
                    )),
                new Marker(
                    width: 45.0,
                    height: 45.0,
                    point: LatLng(53.553841, 9.991650),
                    builder: (context) => new Container(
                      child: IconButton(
                        icon: Icon(Icons.location_on),
                        color: Colors.green,
                        iconSize: 45.0,
                        onPressed: () {
                          print('Marker tapped');
                        },
                      ),
                    ))
              ])
            ])
    );

  }

}


