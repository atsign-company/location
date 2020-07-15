import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './events.dart';

//final FirebaseAuth _auth = FirebaseAuth.instance;

class EventPage extends StatefulWidget {
  EventPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  EventPageState createState() => EventPageState();
}

class EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Details'),
        backgroundColor: Colors.orange,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Container(
            child: Text(
              'FRI, JUL 10 AT 9 PM',
              style: TextStyle(
                color: Colors.red,
                //fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
          ),
          Container(
            child: Text(
              'Friday Zoom Movie Night!',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
          ),
          Container(
            child: Text(
              'Online Event: www.zoomlink.com/j139wefj0w8',
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.grey,
              ),
            ),
            margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
          ),
          Divider(
            color: Colors.black,
            indent: 10.0,
            endIndent: 10.0,
            thickness: 0.3,
          ),
          Container(
            child: Text(
              'Details',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
          ),
          Container(
            child: Text(
              'Vote on the movie you want to watch here: www.randomlink.com',
              style: TextStyle(
                fontSize: 17.0,
              ),
            ),
            margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
          ),
          Container(
            child: Text(
              'Invited: 15 · Going: 12 · Maybe: 1',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
          ),
          Divider(
            color: Colors.black,
            indent: 10.0,
            endIndent: 10.0,
            thickness: 0.3,
          ),
          Container(
            child: Text(
              'Map or Posts?',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
          ),
        ],
      ),
    );
  }
}
