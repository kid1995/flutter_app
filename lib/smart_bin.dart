class SmartBin{
  final String name;
  final String address;
  final double lat;
  final double lng;

  SmartBin({this.name, this.address, this.lng, this.lat});

  factory SmartBin.fromJson(Map<String, dynamic> json){
    return SmartBin(
      name: json['name'],
      address: json['address'],
      lng: json['lng'],
      lat: json['lat'],
    );
  }
  @override
  String toString() {
    return "Sensor name: " + name + " Adress: " + address + " Lng: " + lng.toString() + " Lat: " + lat.toString();
  }
}