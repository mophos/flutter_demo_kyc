import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool isFingerScan = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ตั้งค่าการใช้งาน'),
      ),
      body: ListView(
        children: [
          Text('ตั้งค่าทั่วไป'),
          SwitchListTile(
            title: const Text('เปิดการใช้งาน Finger Scan'),
            value: isFingerScan,
            onChanged: (bool value) {
              setState(() {
                isFingerScan = value;
              });
            },
            secondary: const Icon(
              Icons.fingerprint,
              color: Colors.pink,
            ),
          )
        ],
      ),
    );
  }
}
