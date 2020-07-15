import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './register.dart';
import './home.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Location Login UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Login(title: '@location Login'),
    );
  }
}

class Login extends StatefulWidget {
  Login({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  TextStyle style = TextStyle(fontSize: 20);

  //Firebase auth
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _success;
  String errorMessage;
  static String userEmail;

  void _signInWithEmailAndPassword() async {
    FirebaseUser user;
    try {
      user = (await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      ))
          .user;
    } catch (e) {
      errorMessage = 'Invalid email/password combination';
    }

    if (user != null) {
      setState(() {
        _success = true;
        userEmail = user.email;
      });
    } else {
      setState(() {
        _success = false;
      });
    }

    if (_success) {
      var status = await Permission.locationWhenInUse.status;
      if (status.isUndetermined || status.isDenied) {
        await Permission.locationWhenInUse.request();
      }
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Home(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var _failLogin = Text(
      _success == null ? '' : (!_success ? errorMessage : ''),
      style: TextStyle(
        color: Colors.red,
        fontSize: 15,
      ),
      textAlign: TextAlign.center,
    );

    final emailField = TextFormField(
      controller: _emailController,
      obscureText: false,
      style: style,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please enter your email';
        }
        return null;
      },
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32))),
    );

    final passwordField = TextFormField(
      controller: _passwordController,
      obscureText: true,
      style: style,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please enter your password';
        }
        return null;
      },
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32))),
    );

    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.orange,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        onPressed: () async {
          if (_formKey.currentState.validate()) {
            _signInWithEmailAndPassword();
          }
        },
        child: Text(
          "Login",
          textAlign: TextAlign.center,
          style:
              style.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    final registerButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.orange,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Register(),
            ),
          );
        },
        child: Text(
          "Register",
          textAlign: TextAlign.center,
          style:
              style.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Center(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36),
              child: ListView(
                padding: EdgeInsets.fromLTRB(0, 90, 0, 0),
                children: <Widget>[
                  SizedBox(
                    height: 155,
                    child: Text(
                      '@location',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  SizedBox(height: 35),
                  _failLogin,
                  SizedBox(height: 10),
                  emailField,
                  SizedBox(height: 25),
                  passwordField,
                  SizedBox(height: 35),
                  loginButton,
                  SizedBox(height: 15),
                  registerButton,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
