import 'package:flutter/material.dart';
import 'package:wolt_with_flutter/discovery.dart';
import 'package:wolt_with_flutter/nearby.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wolt with Flutter',
      theme: ThemeData(
          // primarySwatch: Colors.blue,
          ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  final tabs = [
    Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   title: Container(
      //     child: Row(children: [
      //       Text(
      //         'Discover ',
      //         style: TextStyle(color: Colors.black),
      //       ),
      //       Text(
      //         'Tallinn',
      //         style: TextStyle(color: Colors.blue),
      //       ),
      //     ]),
      //   ),
      // ),
      body: Discovery(),
    ),
    Center(child: Text('Delivery')),
    Nearby(),
    //TODO listview with card for restaurants

    //TODO google maps api, gps
    Center(child: Text('Search')),
    //TODO Search function,
    Center(child: Text('Me')),
    //TODO profile
  ];

//bottom bar
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        iconSize: 27,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.star),
              title: Text('Discovery'),
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.motorcycle),
              title: Text('Delivery'),
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.directions_walk),
              title: Text('Near by'),
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('Search'),
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              title: Text('Me'),
              backgroundColor: Colors.blue),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
