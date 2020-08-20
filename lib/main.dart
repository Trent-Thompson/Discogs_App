import 'package:discogs_app/logincard.dart';
import 'package:flutter/material.dart';

import './screens/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: LoginScreen(),
    );
  }
}
