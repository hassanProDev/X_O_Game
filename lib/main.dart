import 'package:flutter/material.dart';
import 'package:x_o_flutter/game_screen.dart';
import 'package:x_o_flutter/playerData.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textTheme: TextTheme(
        headline3: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
            headline1: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
      )),
      debugShowCheckedModeBanner: false,
      initialRoute: PlayerData.routeName,
      routes: {
        GameScreen.routeName:(_)=>GameScreen(),
        PlayerData.routeName:(_)=>PlayerData(),
      },
    );
  }
}
