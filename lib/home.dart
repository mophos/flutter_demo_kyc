import 'package:flutter/material.dart';
import 'package:my_moph/forgot_password.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showPassword = true;

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
            // padding: EdgeInsets.all(20),
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
                                text: 'เข้าใช้งานระบบ',
                              ),
                              Tab(
                                text: 'ลงทะเบียนใหม่',
                              )
                            ],
                            indicatorWeight: 3,
                            // indicatorColor: Colors.indigo[800],
                          ),
                        ), // Tabbar
                        Container(
                          height: 400,
                          // padding: EdgeInsets.all(10),
                          child: TabBarView(
                            children: [
                              Container(
                                  child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          filled: true,
                                          label: Text('เลขบัตรประจำตัวประชาชน'),
                                          hintText: 'ระบุเลข 13 หลัก'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: TextFormField(
                                      obscureText: showPassword,
                                      decoration: InputDecoration(
                                          filled: true,
                                          suffixIcon: IconButton(
                                            icon: showPassword
                                                ? Icon(Icons.visibility)
                                                : Icon(Icons.visibility_off),
                                            onPressed: () {
                                              setState(() {
                                                showPassword = !showPassword;
                                              });
                                            },
                                          ),
                                          label: Text('รหัสผ่าน'),
                                          hintText: ''),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                padding: EdgeInsets.all(20),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30))),
                                            onPressed: () {},
                                            child: Text("เข้าสู่ระบบ")),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: TextButton(
                                            style: TextButton.styleFrom(
                                                padding: EdgeInsets.all(20),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20))),
                                            onPressed: () {},
                                            child: Text("ลืมรหัสผ่าน")),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                              Container(
                                  child: Column(
                                children: [
                                  Text('ลงทะเบียน'),
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
