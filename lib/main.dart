import 'package:flutter/material.dart';
import 'package:wolt_with_flutter/herobanner.dart';

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
      body: Container(
        padding: EdgeInsets.only(top: 55),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(children: [
                Text('Discover ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 38,
                        fontWeight: FontWeight.bold)),
                Text(
                  'Tallinn',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 38,
                      fontWeight: FontWeight.bold),
                ),
              ]),
            ),
            HeroBanner(),
            Container(
              child: Column(
                children: [
                  ListTile(
                    leading: Text(
                      'Quick links',
                      style: TextStyle(
                          // color: Colors.b,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  ListTile(
                    leading: Text('Redeem Code'),
                  ),
                  ListTile(
                    leading: Text('Redeem Code 2'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),

    Center(child: Text('Delivery')),
    //TODO listview with card for restaurants

    Center(child: Text('Near by')),
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
