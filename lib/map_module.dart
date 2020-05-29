import 'package:flutter/material.dart';

import 'map_routing.dart';


class Map {
  static const routeName = '/map';
  static final List<Widget> children = [
    MapWidget(),
    Text("test")
  ];

  static final List<BottomNavigationBarItem> botNavButton = [
    new BottomNavigationBarItem(
      icon: Icon(Icons.map),
      title: Text('Map'),
    ),
    new BottomNavigationBarItem(
      icon: Icon(Icons.history),
      title: Text('History'),
    ),
  ];
}

