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
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DefaultTabController(
                    length: 2,
                    initialIndex: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          child: TabBar(
                            tabs: [
                              Tab(
                                text: 'Login',
                              ),
                              Tab(
                                text: 'Register',
                              )
                            ],
                            indicatorWeight: 5,
                            indicatorColor: Colors.indigo[800],
                          ),
                        ), // Tabbar
                        Container(
                          height: 400,
                          child: TabBarView(
                            children: [
                              Container(
                                  child: Column(
                                children: [
                                  Text('Login'),
                                ],
                              )),
                              Container(
                                  child: Column(
                                children: [
                                  Text('Register'),
                                ],
                              ))
                            ],
                          ),
                        ), // TabbarViewer
                      ],
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
