import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:latlong/latlong.dart';
import 'package:polyline/polyline.dart';



class MapBoxDirectionRes{
  List<dynamic> wayPoints;
  Map<String, dynamic> routes;
  List<dynamic> legs;
  String code;

  MapBoxDirectionRes({this.wayPoints, this.legs,this.routes, this.code});

  factory MapBoxDirectionRes.fromJson(Map<dynamic, dynamic> json){
    return MapBoxDirectionRes(
      wayPoints: json['waypoints']  as List<dynamic>,
      legs: (((json['routes'] as List<dynamic>)[0] as Map<String, dynamic>)['legs']as List<dynamic>),
      code: json['code'] as String,
    );
  }


  getPolyline(){
    Polyline polyline;
    List<String> geo = <String>[];
    var routePoints = <LatLng>[];
    for(dynamic e in  legs){
      List<dynamic> steps = (e as Map<String, dynamic>)['steps'];
      for(dynamic eSteps in steps){
        geo.add((eSteps as Map<String, dynamic>)['geometry']);
      }
    }
    for(String g in geo){
      polyline = Polyline.Decode(encodedString: g, precision: 6);
      for(List<double> c in polyline.decodedCoords){
        routePoints.add(LatLng(c[0], c[1]));
      }
    }
    return routePoints;
  }
}

class Routes {

}

class Coordinate {
  double lat;
  double lng;

  Coordinate(this.lng, this.lat );

  toCoordinate() {
    return this.lng.toString() + "," + this.lat.toString();
  }
}

Future<MapBoxDirectionRes> fetchRoutes(http.Client client, List <Coordinate> wps, Coordinate start, Coordinate end ) async {

  String url  = 'https://api.mapbox.com/directions/v5/mapbox/driving/';
  url = url + start.toCoordinate() + ';';
  for(var c in wps){
    url  = url + c.toCoordinate() + ';';
  }
  url = url + end.toCoordinate();
  url = url + "?steps=true&geometries=polyline6&access_token=pk.eyJ1IjoiYWRob2MtbmV0d29ya3MtZ21iaCIsImEiOiJjazZycGhwOTEwNWV6M29xcDI0MnB4eWVhIn0.TLaeO84BAhhNpQwlfiSwog";
  print(url);
  final response =
  await client.get(url);

  final jsonResponse = json.decode(response.body);

  return  MapBoxDirectionRes.fromJson(jsonResponse);
}
