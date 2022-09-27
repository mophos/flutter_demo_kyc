import 'package:flutter/material.dart';
import 'package:my_moph/color.dart';
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
          primarySwatch: MyMophColor.mymophpalette,
          tabBarTheme: TabBarTheme(
              labelColor: MyMophColor.mymophpalette.shade800,
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              unselectedLabelColor: Colors.grey,
              unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold)),
          floatingActionButtonTheme:
              FloatingActionButtonThemeData(backgroundColor: Colors.pink),
          appBarTheme: AppBarTheme(backgroundColor: Colors.pink)),
      home: HomePage(),
    );
  }
}
