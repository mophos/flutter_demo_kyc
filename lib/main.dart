import 'package:flutter/material.dart';
import 'package:my_moph/home.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My MOPH",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'NotoSans',
          primaryColor: Colors.indigo,
          tabBarTheme: TabBarTheme(
              labelColor: Colors.indigo,
              labelStyle:
                  TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold),
              unselectedLabelStyle:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
          floatingActionButtonTheme:
              FloatingActionButtonThemeData(backgroundColor: Colors.pink),
          appBarTheme: AppBarTheme(backgroundColor: Colors.pink)),
      home: HomePage(),
    );
  }
}
