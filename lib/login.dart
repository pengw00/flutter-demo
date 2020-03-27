import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final username = Text('Username');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            children: <Widget>[
              // SizedBox(height: 80.0),
              // Column(children: <Widget>[
              // IconButton(icon: Icon(Icons.list), onPressed: () {}),
              // SizedBox(height: 120.0),
              // Text("Login")
              // ]),
              SizedBox(height: 120.0),
              TextField(
                onChanged: (val) => print(val),
                decoration:
                    InputDecoration(labelText: 'Username', filled: true),
                obscureText: true,
              ),
              TextField(
                decoration:
                    InputDecoration(labelText: 'Password', filled: true),
                obscureText: true,
              ),
              ButtonBar(
                children: <Widget>[
                  FlatButton(
                    child: Text('CANCEL'),
                    onPressed: () {},
                  ),
                  RaisedButton(child: Text('NEXT'), onPressed: () {})
                ],
              ),
            ]),
      ),
    );
  }
}
