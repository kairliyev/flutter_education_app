import 'package:flutter/material.dart';
import 'select_page.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          // Define the default Brightness and Colors
          brightness: Brightness.light,
          primaryColor: Colors.white,
          accentColor: Colors.deepPurple,

          // Define the default Font Family
          fontFamily: 'Montserrat',
        ),
        home: MainBody());
  }
}
