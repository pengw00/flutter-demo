import 'package:flutter/material.dart';
import 'home.dart';
import 'login_screen.dart';

final routes = {
  '/post': (BuildContext context) => new HomeScreen(),
  '/login': (BuildContext context) => new LoginScreen(),
  '/home': (BuildContext context) => new HomeScreen(),
  '/': (BuildContext context) => new LoginScreen(),
};
