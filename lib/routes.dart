import 'package:flutter/material.dart';
import 'home.dart';
import 'login_screen.dart';
import 'account.dart';

final routes = {
  '/post': (BuildContext context) => new HomeScreen(),
  // '/login': (BuildContext context) => new LoginScreen(),
  '/': (BuildContext context) => new HomeScreen(),
  '/login': (BuildContext context) => new LoginScreen(),
  '/account': (BuildContext context) => new AccountPage(),
};
