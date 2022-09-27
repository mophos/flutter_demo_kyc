import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('ลืมรหัสผ่าน'),
        ),
        body: ListView(
          children: [
            Container(
                margin: EdgeInsets.all(20),
                child:
                    Text('กรุณาระบุอีเมล์เพื่อรับลิงค์สำหรับเปลี่ยนรหัสผ่าน')),
            Container(
              margin: EdgeInsets.symmetric(vertical: 0, horizontal: 40),
              child: Column(
                children: [
                  TextFormField(
                      decoration: InputDecoration(
                          filled: true,
                          label: Text('อีเมล์'),
                          hintText: 'ระบุอีเมล์เพื่อรับลิงค์เปลี่ยนรหัสผ่าน')),
                  Container(
                    margin: EdgeInsets.only(left: 40, right: 40, top: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.all(20),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30))),
                              onPressed: () {},
                              child: Text("ส่งลิงค์เพื่อเปลี่ยนรหัสผ่าน")),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
