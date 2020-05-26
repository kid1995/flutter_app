import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

Future<MapBoxDirectionRes> fetchRoutes(http.Client client, List <Coordinate> wps, Coordinate start, Coordinate end ) async {

  String url  = 'https://api.mapbox.com/directions/v5/mapbox/driving/';
  url = url + start.toCoordinate() + ';';
  for(var c in wps){
    url  = url + c.toCoordinate() + ';';
  }
  url = url + end.toCoordinate();
  url = url + "?geometries=geojson&access_token=pk.eyJ1IjoiYWRob2MtbmV0d29ya3MtZ21iaCIsImEiOiJjazZycGhwOTEwNWV6M29xcDI0MnB4eWVhIn0.TLaeO84BAhhNpQwlfiSwog";
  print("URL: ");
  print(url);
  final response =
  await client.get(url);

  final jsonResponse = json.decode(response.body);
  print("JSON");
  print(jsonResponse);
  return  MapBoxDirectionRes.fromJson(jsonResponse);
}


class MapBoxDirectionRes{
  Map<String, dynamic> wayPoints;
  List<dynamic> routes;
  String code;

  MapBoxDirectionRes({this.wayPoints, this.routes, this.code});

  factory MapBoxDirectionRes.fromJson(Map<dynamic, dynamic> json){
    return MapBoxDirectionRes(
      wayPoints: json['wayPoints']  as Map<dynamic,dynamic>,
      routes: json['routes'] as List<dynamic>,
      code: json['wayPoints'] as String,
    );
  }
}

class Coordinate {
  double lat;
  double lng;

  Coordinate(this.lng, this.lat);

  toCoordinate() {
    return this.lat.toString() + "," + this.lng.toString();
  }
}