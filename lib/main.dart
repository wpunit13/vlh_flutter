import 'package:flutter/material.dart';
import 'data/constants.dart';
import 'screens/input_page.dart';

void main() => runApp(CardiacDisease());

class CardiacDisease extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputPage(),
      theme: ThemeData.light().copyWith(
          primaryColor: Color(0xFFF87D07),
//          primaryColor: Color(0xFF4078C0),
          //      scaffoldBackgroundColor: Color(0xFF424242),
          accentColor: Colors.indigo.shade300,
          inputDecorationTheme: InputDecorationTheme(
              labelStyle: kMultiSelectText,
              border: const OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.teal, width: 0.0),
              ))),
    );
  }
}
