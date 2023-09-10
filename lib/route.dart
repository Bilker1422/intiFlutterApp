import 'package:flutter/material.dart';
import '/pages/Home.dart';
import '/pages/signin.dart';

var routes = <String, WidgetBuilder>{
  '/home': (context) => const Home(),
  '/signin': (context) => const Signin(),
};
