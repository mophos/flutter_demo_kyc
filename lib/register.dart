import 'package:flutter/material.dart';
import 'package:my_moph/home.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ลงทะเบียน'),
      ),
      body: ListView(
        children: [
          Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                          filled: true, label: Text('เลขบัตรประชาชน')),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                          filled: true,
                          label: Text('ชื่อ'),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                          filled: true,
                          label: Text('นามสกุล'),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: TextFormField(
                      readOnly: true,
                      decoration:
                          InputDecoration(filled: true, label: Text('วันเกิด')),
                    ),
                  ),
                  Container(
                      child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: TextFormField(
                          readOnly: true,
                          decoration: InputDecoration(
                              filled: true, label: Text('เลเซอร์หลังบัตร')),
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
                                            BorderRadius.circular(30))),
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) => HomePage()));
                                },
                                child: Text("ลงทะเบียน")),
                          ),
                        ],
                      ),
                    ],
                  )),
                ],
              )),
        ],
      ),
    );
  }
}
