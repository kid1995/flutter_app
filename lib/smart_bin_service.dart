import 'dart:convert';

import 'package:flutterapp/smart_bin.dart';
import 'package:http/http.dart' as http;

class SmartBinService {
  static final SmartBinService _instance = SmartBinService._internal();

  factory SmartBinService() => _instance;

  SmartBinService._internal() {}

  Future<List<SmartBin>> fetchSmartBin() async {
    List<SmartBin> sensorList = <SmartBin>[];
    final response = await http.get('http://192.168.0.180:8081/');
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print("response received");
      List<dynamic> resList = json.decode(response.body) as List<dynamic>;
      for (dynamic s in resList) {
        sensorList.add(SmartBin.fromJson(s as Map<String, dynamic>));
      }
      return sensorList;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
