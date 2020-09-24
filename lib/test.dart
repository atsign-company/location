import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

import './home.dart';
import './login.dart';
import './events.dart';
import './friendlist.dart';
import './styles.dart' as styles;

final FirebaseAuth _auth = FirebaseAuth.instance;

class Test extends StatefulWidget {
  Test({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  TestState createState() => TestState();
}

class TestState extends State<Test> {
  final String userEmail = LoginState.userEmail;
  var _userName = '';

  void getName() {
    Firestore.instance
        .collection('users')
        .document(userEmail)
        .get()
        .then((value) => setState(() {
              _userName = value.data['name'];
            }));
  }
  void _getLocation() async {
    var currentLocation = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    setState(() {
      _markers.clear();
      final marker = Marker(
        markerId: MarkerId("start"),
        position: LatLng(27.42796133580664, -102.085749655962),
        infoWindow: InfoWindow(title: 'Your Location'),
      );
      final destMarker = Marker(
        markerId: MarkerId('dest'),
        position: LatLng(37, -122),
        infoWindow: InfoWindow(title: 'Destination'),
      );
      _markers.add(marker);
      _markers.add(destMarker);
    });
  }

  final Set<Marker> _markers = {};
  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    getName();
    _getLocation();

    return Scaffold(
      appBar: AppBar(
        title: Text('Testing'),
        backgroundColor: styles.atOrange,
      ),
      backgroundColor: Colors.white,
      body: GoogleMap(
        mapType: MapType.normal,
        compassEnabled: true,
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        initialCameraPosition: _kGooglePlex,
        markers: _markers != null ? Set<Marker>.from(_markers) : null,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 90,
              child: DrawerHeader(
                child: Text(
                  _userName,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                decoration: BoxDecoration(
                  color: styles.atOrange,
                ),
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Events'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Events(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Friends'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FriendList(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () async {
                await _auth.signOut();
                print('Logout successful');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Login(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Test'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Test(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
