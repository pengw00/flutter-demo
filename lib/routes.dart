import 'package:flutter/material.dart';
import 'home.dart';
import 'login_screen.dart';

final routes = {
  '/login': (BuildContext context) => new LoginScreen(),
  '/home': (BuildContext context) => new HomeScreen(),
  '/': (BuildContext context) => new LoginScreen(),
};
