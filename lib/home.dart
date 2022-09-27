import 'package:flutter/material.dart';
import 'package:my_moph/forgot_password.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        children: [
          Image.asset(
            "assets/logo/moph-logo.png",
            width: 160,
            height: 160,
          )
        ],
      ),
    );
  }
}
