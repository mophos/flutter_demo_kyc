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
          primaryColor: Colors.indigo,
          floatingActionButtonTheme:
              FloatingActionButtonThemeData(backgroundColor: Colors.pink),
          appBarTheme: AppBarTheme(backgroundColor: Colors.pink)),
      home: HomePage(),
    );
  }
}
