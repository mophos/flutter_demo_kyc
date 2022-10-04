import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_moph/dashboard.dart';
import 'package:my_moph/e-kyc.dart';
import 'package:my_moph/forgot_password.dart';
import 'package:my_moph/services/kyc-service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  KycService kycService = KycService();

  bool showPassword = true;

  final _storage = const FlutterSecureStorage();
  final _formKey = GlobalKey<FormState>();

  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  Future checkLogin() async {
    try {
      String username = txtUsername.text;
      String password = txtPassword.text;

      Response res = await kycService.login(username, password);
      print(res.data);

      if (res.statusCode == 200) {
        // pass
        String accessToken = res.data['access_token'];
        String refreshToken = res.data['refresh_token'];

        await _storage.write(key: "accessToken", value: accessToken);
        await _storage.write(key: "refreshToken", value: refreshToken);

        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => DashboardPage()));
      } else {
        print('login failed!');
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      // ),
      body: ListView(
        // shrinkWrap: true,
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
              children: [
                DefaultTabController(
                    length: 2,
                    initialIndex: 0,
                    child: Column(
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
                          height: 350,
                          // padding: EdgeInsets.all(10),
                          child: TabBarView(
                            children: [
                              Form(
                                key: _formKey,
                                child: Container(
                                    child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: TextFormField(
                                        controller: txtUsername,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'กรุณาระบุชื่อผู้ใช้งาน';
                                          }
                                          return null;
                                        },
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                            filled: true,
                                            label:
                                                Text('เลขบัตรประจำตัวประชาชน'),
                                            hintText: 'ระบุเลข 13 หลัก'),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: TextFormField(
                                        controller: txtPassword,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'กรุณาระบุรหัสผ่าน';
                                          }
                                          return null;
                                        },
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
                                                  padding: EdgeInsets.all(25),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30))),
                                              onPressed: () {
                                                if (_formKey.currentState!
                                                    .validate()) {
                                                  checkLogin();
                                                } else {
                                                  // not valid
                                                }
                                              },
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
                                                  padding: EdgeInsets.all(25),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20))),
                                              onPressed: () {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ForgotPasswordPage()));
                                              },
                                              child: Text("ลืมรหัสผ่าน")),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                              ),
                              Container(
                                  child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: TextFormField(
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                          filled: true,
                                          label: Text('อีเมล์'),
                                          hintText: 'ระบุอีเมล์'),
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
                                          label: Text('ยืนยันรหัสผ่าน'),
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
                                                padding: EdgeInsets.all(25),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30))),
                                            onPressed: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          EKycPage()));
                                            },
                                            child: Text("ต่อไป")),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
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
