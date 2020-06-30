import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './home.dart';
import './login.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class FriendList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Friends List'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Sean Kim'),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Home(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Friends'),
              onTap: () {
                Navigator.pop(context);
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
          ],
        ),
      ),
    );
  }
}