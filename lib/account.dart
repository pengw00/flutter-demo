import 'package:flutter/material.dart';
import 'logout_sceen_presenter.dart';
import 'data/database_helper.dart';
import 'auth.dart';

class AccountPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LogoutScreenState();
}

class LogoutScreenState extends State<AccountPage>
    implements LogoutScreenContract, AuthStateListener {
  BuildContext _context;
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  // String _useremail;

  LogoutScreenPresenter _presenter;

  LogoutScreenState() {
    _presenter = new LogoutScreenPresenter(this);
    var authStateProvider = new AuthStateProvider();
    authStateProvider.subscribe(this);
  }

  void _logout() {
    _presenter.doLogout("pengwu550@yahoo.com");
  }

  @override
  onAuthStateChanged(AuthState state) {
    print(state);
    if (state == AuthState.LOGGED_IN)
      Navigator.of(_context).pushReplacementNamed("/home");
    else
      Navigator.of(_context).pushReplacementNamed("");
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Scaffold(
      body: SafeArea(
        child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            children: <Widget>[
              Text("Account Info"),
              IconButton(icon: Icon(Icons.list), onPressed: _logout),
              // ]),

              // SizedBox(height: 120.0),
              // TextField(
              //   onChanged: (val) => print(val),
              //   decoration:
              //       InputDecoration(labelText: 'Username', filled: true),
              //   obscureText: true,
              // ),
              // TextField(
              //   decoration:
              //       InputDecoration(labelText: 'Password', filled: true),
              //   obscureText: true,
              // ),
              // ButtonBar(
              //   children: <Widget>[
              //     FlatButton(
              //       child: Text('CANCEL'),
              //       onPressed: () {},
              //     ),
              //     RaisedButton(child: Text('NEXT'), onPressed: () {})
              //   ],
              // ),
            ]),
      ),
    );
  }

  // void _showSnackBar(String text) {
  //   scaffoldKey.currentState
  //       .showSnackBar(new SnackBar(content: new Text(text)));
  // }

  @override
  void onLogoutSuccess(String username) async {
    // _showSnackBar(username);
    var db = new DatabaseHelper();
    await db.deleteUsers();
    var authStateProvider = new AuthStateProvider();
    authStateProvider.notify(AuthState.LOGGED_OUT);
  }

  @override
  void onLoginError(String errorTxt) {
    // _showSnackBar(errorTxt);
  }
}
