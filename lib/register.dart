import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './styles.dart' as styles;

final FirebaseAuth _auth = FirebaseAuth.instance;

class Register extends StatefulWidget {
  final String title = 'Registration';

  @override
  State<StatefulWidget> createState() => RegisterState();
}

class RegisterState extends State<Register> {
  TextStyle style = TextStyle(fontSize: 20);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  bool _success;
  String errorMessage;
  String name;

  void _register() async {
    FirebaseUser user;
    try {
      user = (await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      ))
          .user;
    } catch (e) {
      switch (e.code) {
        case "ERROR_INVALID_EMAIL":
          errorMessage = 'Please enter a valid email.';
          break;
        case "ERROR_EMAIL_ALREADY_IN_USE":
          errorMessage = 'This email is already registered.';
          break;
        case "ERROR_WEAK_PASSWORD":
          errorMessage = 'WEAK PASSWORD!';
          break;
        default:
          errorMessage = 'Invalid email/password combination';
      }
    }
    if (user != null) {
      _success = true;
      name = _nameController.text;
      Firestore.instance.collection('users').document(user.email).setData({
        'email': user.email,
        'name': name,
      });
    } else {
      setState(() {
        _success = false;
      });
    }

    if (_success) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    var _failRegister = Text(
      _success == null ? '' : (!_success ? errorMessage : ''),
      style: TextStyle(
        color: Colors.red,
        fontSize: 15,
      ),
      textAlign: TextAlign.center,
    );

    final nameField = TextFormField(
      controller: _nameController,
      obscureText: false,
      style: style,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please enter your name';
        }
        return null;
      },
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Full name",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32))),
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

    final registerButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: styles.atOrange,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        onPressed: () async {
          if (_formKey.currentState.validate()) {
            _register();
          }
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
      appBar: AppBar(
        title: Text('Register'),
        backgroundColor: styles.atOrange,
      ),
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Center(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36),
              child: ListView(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                  _failRegister,
                  SizedBox(height: 10),
                  nameField,
                  SizedBox(height: 25),
                  emailField,
                  SizedBox(height: 25),
                  passwordField,
                  SizedBox(height: 35),
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
    // Clean up the controller when the Widget is disposed
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
