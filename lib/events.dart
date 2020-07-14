import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './home.dart';
import './login.dart';
import 'friendlist.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class Events extends StatefulWidget {
  Events({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  EventsState createState() => EventsState();
}

class EventsState extends State<Events> {
  var userName = '';

  void getName() {
    Firestore.instance
        .collection('users')
        .document(LoginState.userEmail)
        .get()
        .then((value) => setState(() {
              userName = value.data['name'];
            }));
  }

  @override
  Widget build(BuildContext context) {
    getName();

    return Scaffold(
      appBar: AppBar(
        title: Text('Events'),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Container(
            child: FlatButton(
              onPressed: () {
                //Navigator.pop(context, false);
              },
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Text(
                              'FRI, JUL 10 @ 9 PM',
                              style:
                                  TextStyle(color: Colors.red, fontSize: 15.0),
                            ),
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 5.0),
                          ),
                          Container(
                            child: Text(
                              'Friday Zoom Movie Night!',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                              ),
                            ),
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 5.0),
                          ),
                          Container(
                            child: Text(
                              'Online Event · 12 people',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15.0,
                              ),
                            ),
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 5.0),
                          ),
                        ],
                      ),
                      margin: EdgeInsets.only(left: 20.0),
                    ),
                  ),
                ],
              ),
              color: Colors.white,
              //color: Theme.of(context).scaffoldBackgroundColor,
              splashColor: Colors.transparent,
              highlightColor: Colors.grey[90],
              padding: EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
//        shape:
//            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            ),
            //margin: EdgeInsets.only(left: 5.0, right: 5.0),
          ),
          Container(
            child: FlatButton(
              onPressed: () {
                //Navigator.pop(context, false);
              },
              child: Row(
                children: <Widget>[
//                  Material(
//                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
//                    clipBehavior: Clip.hardEdge,
//                  ),
                  Flexible(
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Text(
                              'SAT, JUL 11 @ 7 AM',
                              style:
                                  TextStyle(color: Colors.red, fontSize: 15.0),
                            ),
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 5.0),
                          ),
                          Container(
                            child: Text(
                              'Weekend Hiking',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                              ),
                            ),
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 5.0),
                          ),
                          Container(
                            child: Text(
                              'Trump Golf Course · 5 people',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15.0,
                              ),
                            ),
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 5.0),
                          ),
                        ],
                      ),
                      margin: EdgeInsets.only(left: 20.0),
                    ),
                  ),
                ],
              ),
              color: Colors.white,
              //color: Theme.of(context).scaffoldBackgroundColor,
              splashColor: Colors.transparent,
              highlightColor: Colors.grey[90],
              padding: EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
//        shape:
//            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            ),
            //margin: EdgeInsets.only(left: 5.0, right: 5.0),
          ),
          Container(
            child: FlatButton(
              onPressed: () {
                //Navigator.pop(context, false);
              },
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Text(
                              'SAT, JUL 18 @ 3 PM',
                              style:
                                  TextStyle(color: Colors.red, fontSize: 15.0),
                            ),
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 5.0),
                          ),
                          Container(
                            child: Text(
                              "Bob's 21st BDAY surprise",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                              ),
                            ),
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 5.0),
                          ),
                          Container(
                            child: Text(
                              'Los Angeles, CA · 15 people',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15.0,
                              ),
                            ),
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 5.0),
                          ),
                        ],
                      ),
                      margin: EdgeInsets.only(left: 20.0),
                    ),
                  ),
                ],
              ),
              color: Colors.white,
              //color: Theme.of(context).scaffoldBackgroundColor,
              splashColor: Colors.transparent,
              highlightColor: Colors.grey[90],
              padding: EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
//        shape:
//            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            ),
            //margin: EdgeInsets.only(left: 5.0, right: 5.0),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(userName
                  //getUserName()
//                  Firestore.instance.document(userEmail).get().then((value) {
//                    print(value.data['name']);
//                  });
                  ),
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
              title: Text('Events'),
              onTap: () {
                Navigator.pop(context);
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
          ],
        ),
      ),
    );
  }
}
