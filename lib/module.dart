import 'package:flutter/material.dart';

class Module extends StatefulWidget {
  final String name;
  final List<Widget> children;
  final List<BottomNavigationBarItem> botNavButton;

  Module(this.name, this.children, this.botNavButton);

  @override
  State<StatefulWidget> createState() {
    return _ModuleState(this.name, this.children, this.botNavButton);
  }
}

class _ModuleState extends State<Module> {
  int _currentIndex = 0;
  String _moduleName = '';
  List<Widget> _children = [];
  List<BottomNavigationBarItem> _botNavButton = [];

  _ModuleState(this._moduleName, this._children, this._botNavButton);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex], // new
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new
        items: this._botNavButton,
        selectedItemColor:  Color.fromRGBO(143, 148, 251, 1),
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
