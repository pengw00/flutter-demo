import 'package:flutter/material.dart';
import 'logout_sceen_presenter.dart';
import 'data/database_helper.dart';
import 'auth.dart';
import 'data/user.dart';

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
    _presenter.doLogout(User.map({"username": "dsd", "password": "resdsd"}));
    Navigator.pop(_context);
  }

  @override
  onAuthStateChanged(AuthState state) {
    if (state == AuthState.LOGGED_IN)
      Navigator.of(_context).pushReplacementNamed("/home");
    else
      Navigator.of(_context).pushReplacementNamed("/login");
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Scaffold(
        key: scaffoldKey,
        body: new Center(
          child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              children: <Widget>[
                Text("Account Info"),
                IconButton(icon: Icon(Icons.list), onPressed: _logout),
              ]),
        ));
  }

  void _showSnackBar(String text) {
    scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(text)));
  }

  @override
  void onLogoutSuccess(User user) async {
    _showSnackBar(user.username);
    var db = new DatabaseHelper();
    await db.deleteUsers();
    var authStateProvider = new AuthStateProvider();
    authStateProvider.notify(AuthState.LOGGED_OUT);
  }

  @override
  void onLoginError(String errorTxt) {
    _showSnackBar(errorTxt);
  }
}
