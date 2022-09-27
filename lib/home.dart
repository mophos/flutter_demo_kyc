import 'package:flutter/material.dart';
import 'package:my_moph/forgot_password.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _score = 0;

  void add() {
    setState(() {
      _score++;
    });
    print(_score);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My MOPH"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ForgotPasswordPage()));
              },
              icon: Icon(Icons.mail_lock))
        ],
      ),
      body: Center(
        child: Text('ค่าของ score: $_score'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          add();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
