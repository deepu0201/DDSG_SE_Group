// import 'dart:html';

import 'package:flutter/material.dart';

class Credential {
  Credential({@required this.username, @required this.password});
  String username;
  String password;
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String username;
  String password;

  List<Credential> credentials = [
    // list of models
    Credential(username: "daniel", password: "danpass"),
    Credential(username: "shahid", password: "shapass"),
    Credential(username: "deeptarshi", password: "deepass"),
    Credential(username: "gaurav", password: "gaupass"),
  ];

  bool checkCredentials() {
    bool flag = false;
    for (Credential data in credentials) {
      if (username == data.username && password == data.password) {
        flag = true;
      }
    }
    return flag;
  }

  void handleLoginButton() {
    if (_formKey.currentState.validate()) {
      if (checkCredentials()) {
        Navigator.pushNamed(context, '/adminScreen');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Username and password did not match!")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 40.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                onChanged: (value) {
                  username = value;
                },
                decoration: InputDecoration(
                  labelText: 'Enter your username',
                ),
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter username';
                  }
                  return null;
                },
              ),
              TextFormField(
                onChanged: (value) {
                  password = value;
                },
                decoration: InputDecoration(
                  labelText: 'Enter your password',
                ),
                obscureText: true,
                // keyboardType: TextInputType,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter password';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 60,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20.0,
                    horizontal: 80.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  side: BorderSide(color: Colors.lightBlue[800]),
                ),
                onPressed: handleLoginButton,
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
