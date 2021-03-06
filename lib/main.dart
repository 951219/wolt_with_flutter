import 'package:flutter/material.dart';
import 'package:wolt_with_flutter/screens/delivery.dart';
import 'package:wolt_with_flutter/screens/discovery.dart';
import 'package:wolt_with_flutter/screens/nearby.dart';
import 'package:wolt_with_flutter/screens/profile.dart';
import 'package:wolt_with_flutter/screens/search.dart';
import 'package:wolt_with_flutter/services/location_service.dart';
import 'package:wolt_with_flutter/services/category_service.dart';
import 'constants.dart' as constants;

void main() {
  print('Application starting');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    constants.userLocation ??= LocationService().pullLocationData();
    constants.categories ??= CategoryService().fetchCategoryObjects();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wolt with Flutter',
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: MyBehavior(),
          child: child,
        );
      },
      home: Home(),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  final tabs = [
    Discovery(),
    Delivery(),
    Nearby(),
    Search(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
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
          }),
    );
  }
}
