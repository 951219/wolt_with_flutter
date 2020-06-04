import 'package:flutter/material.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Container(
          child: Row(children: [
            Text(
              'Discover ',
              style: TextStyle(color: Colors.black),
            ),
            Text(
              'Tallinn',
              style: TextStyle(color: Colors.blue),
            ),
          ]),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        // margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
        child: ListView(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text('test'),
                      Text('test2'),
                      Text('test3'),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  ListTile(
                    leading: Text(
                      'Quick links',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
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
    Container(
      child: Center(child: Text('Delivery')),
      //TODO listview with card for restaurants
    ),
    Center(child: Text('Near by')),
    Center(child: Text('Search')),
    Center(child: Text('Me')),
  ];

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
