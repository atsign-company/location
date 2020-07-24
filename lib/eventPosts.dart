import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './styles.dart' as styles;

class EventPosts extends StatefulWidget {
  EventPosts({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  EventPostsState createState() => EventPostsState();
}

class EventPostsState extends State<EventPosts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Discussion'),
        backgroundColor: styles.atOrange,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.account_box,
                        size: 50.0,
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Text(
                              '@sean',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              'JUL 9',
                              style: TextStyle(
                                fontSize: 10.0,
                                color: styles.atDGrey,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                        margin: EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                      ),
                    ],
                  ),
                  margin: EdgeInsets.fromLTRB(5.0, 5.0, 10.0, 5.0),
                ),
                Container(
                  child: Text('Looking forward to seeing everyone online!'),
                  margin: EdgeInsets.fromLTRB(15.0, 0.0, 10.0, 5.0),
                ),
                Container(
                  child: Text(
                    '1 Comment',
                    style: TextStyle(
                      color: styles.atDGrey,
                      fontSize: 12.0,
                    ),
                  ),
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                ),
                Divider(
                  color: Colors.black,
                  indent: 10.0,
                  endIndent: 10.0,
                  thickness: 0.3,
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.account_box,
                        size: 40.0,
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Text(
                              '@bob',
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'See you soon!',
                              style: TextStyle(
                                fontSize: 15.0,
                              ),
                            )
                          ],
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                        margin: EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                      ),
                    ],
                  ),
                  margin: EdgeInsets.fromLTRB(5.0, 5.0, 10.0, 5.0),
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.account_box,
                        size: 40.0,
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Text(
                              '@sean',
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Add a comment',
                              style: TextStyle(
                                fontSize: 15.0,
                                color: styles.atDGrey,
                              ),
                            ),
                          ],
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                        margin: EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                      ),
                    ],
                  ),
                  margin: EdgeInsets.fromLTRB(5.0, 5.0, 10.0, 5.0),
                ),
                Divider(
                  color: Colors.black,
                  indent: 10.0,
                  endIndent: 10.0,
                  thickness: 0.3,
                ),
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
          )
        ],
      ),
    );
  }
}
