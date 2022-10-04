import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_moph/color.dart';
import 'package:my_moph/e-kyc.dart';
import 'package:my_moph/forgot_password.dart';
import 'package:my_moph/services/api.dart';
import 'package:my_moph/setting.dart';
import 'package:my_moph/users.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int currentIndex = 0;
  List users = [];

  Api api = new Api();

  Future getUsers() async {
    try {
      Response res = await api.getUsers();

      print(res.data);
      setState(() {
        users = res.data['results'];
      });
    } catch (error) {
      print(error);
    }
  }

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFECF3FF),
      appBar: AppBar(
        backgroundColor: Color(0xFFECF3FF),
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 25,
              backgroundImage: AssetImage("assets/images/customer.png"),
            ),
            // Text(
            //   "xxxxxx",
            //   style: TextStyle(
            //       fontWeight: FontWeight.normal,
            //       color: MyMophColor.mymophpalette.shade800),
            // )
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SettingPage()));
                },
                icon: Icon(
                  Icons.settings,
                  color: MyMophColor.mymophpalette.shade800,
                ))
          ],
        ),
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Good Morning',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: MyMophColor.mymophpalette.shade900),
                ),
                Row(
                  children: [
                    Text(
                      'นายทดสอบ ไม่เอาจริง',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Image.asset(
                      "assets/images/customer.png",
                      height: 40,
                      width: 40,
                    ),
                  ],
                ),
                Text(
                  'มีนัดคลิกนิคโรคเรื้อรัง 21 กย. 65 เวลา 10.00 น.',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.red),
            height: 160,
          ),
          // Container(
          //   child: Column(
          //     children: [
          //       Container(
          //         margin: EdgeInsets.only(top: 10, left: 10, right: 10),
          //         padding: EdgeInsets.all(15),
          //         decoration: BoxDecoration(
          //             color: Colors.teal[400],
          //             borderRadius: BorderRadius.circular(10)),
          //         child: Row(
          //           children: [
          //             Icon(
          //               Icons.calendar_month,
          //               size: 70,
          //               color: Colors.white,
          //             ),
          //             Expanded(
          //               child: Container(
          //                 padding: EdgeInsets.all(10),
          //                 child: Column(
          //                   crossAxisAlignment: CrossAxisAlignment.start,
          //                   children: [
          //                     Text(
          //                       'Book Appointment',
          //                       style: TextStyle(
          //                           fontWeight: FontWeight.bold,
          //                           color: Colors.white,
          //                           fontSize: 18),
          //                     ),
          //                     Text(
          //                       'Schedule on appointment with our licensed professional',
          //                       maxLines: 2,
          //                       // overflow: TextOverflow.ellipsis,
          //                       style: TextStyle(color: Colors.white),
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //             )
          //           ],
          //         ),
          //       ),
          //       Container(
          //         margin: EdgeInsets.only(top: 10, left: 10, right: 10),
          //         padding: EdgeInsets.all(15),
          //         decoration: BoxDecoration(
          //             color: Colors.indigo[400],
          //             borderRadius: BorderRadius.circular(10)),
          //         child: Row(
          //           children: [
          //             Icon(
          //               Icons.phone,
          //               size: 70,
          //               color: Colors.white,
          //             ),
          //             Expanded(
          //               child: Container(
          //                 padding: EdgeInsets.all(10),
          //                 child: Column(
          //                   crossAxisAlignment: CrossAxisAlignment.start,
          //                   children: [
          //                     Text(
          //                       'Book Appointment',
          //                       style: TextStyle(
          //                           fontWeight: FontWeight.bold,
          //                           color: Colors.white,
          //                           fontSize: 18),
          //                     ),
          //                     Text(
          //                       'Schedule on appointment with our licensed professional',
          //                       maxLines: 2,
          //                       // overflow: TextOverflow.ellipsis,
          //                       style: TextStyle(color: Colors.white),
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //             )
          //           ],
          //         ),
          //       ),
          //       Container(
          //         margin: EdgeInsets.only(top: 10, left: 10, right: 10),
          //         padding: EdgeInsets.all(15),
          //         decoration: BoxDecoration(
          //             color: Colors.orange[400],
          //             borderRadius: BorderRadius.circular(10)),
          //         child: Row(
          //           children: [
          //             Icon(
          //               Icons.email_outlined,
          //               size: 70,
          //               color: Colors.white,
          //             ),
          //             Expanded(
          //               child: Container(
          //                 padding: EdgeInsets.all(10),
          //                 child: Column(
          //                   crossAxisAlignment: CrossAxisAlignment.start,
          //                   children: [
          //                     Text(
          //                       'Book Appointment',
          //                       style: TextStyle(
          //                           fontWeight: FontWeight.bold,
          //                           color: Colors.white,
          //                           fontSize: 18),
          //                     ),
          //                     Text(
          //                       'Schedule on appointment with our licensed professional',
          //                       maxLines: 2,
          //                       // overflow: TextOverflow.ellipsis,
          //                       style: TextStyle(color: Colors.white),
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //             )
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // )
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10, bottom: 5),
            child: Text(
              'รายชื่อสมาชิก',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Column(
            children: users.map((e) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(e['picture']['thumbnail']),
                  ),
                  title: Text(
                      '${e['name']['title']}.${e['name']['first']} ${e['name']['last']}'),
                  subtitle: Text(e['email']),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
              );
            }).toList(),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.home,
                  color: MyMophColor.mymophpalette.shade800,
                  size: 35,
                )),
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => UsersPage()));
                },
                icon: Icon(
                  Icons.account_circle_outlined,
                  color: MyMophColor.mymophpalette.shade800,
                  size: 35,
                )),
          ],
        ),
      ),
      // BottomAppBar(
      //   color: Colors.transparent,
      //   elevation: 0,
      //   shape: CircularNotchedRectangle(),
      //   child: Container(
      //     alignment: Alignment.center,
      //     height: 60,
      //     margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      //     decoration: BoxDecoration(
      //         color: Colors.white,
      //         borderRadius: BorderRadius.only(
      //             topRight: Radius.circular(20),
      //             bottomRight: Radius.circular(20),
      //             topLeft: Radius.circular(20),
      //             bottomLeft: Radius.circular(20))),
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //         IconButton(
      //             onPressed: () {},
      //             icon: Icon(
      //               Icons.home,
      //               color: MyMophColor.mymophpalette.shade800,
      //               size: 35,
      //             )),
      //         IconButton(
      //             onPressed: () {},
      //             icon: Icon(
      //               Icons.qr_code,
      //               color: MyMophColor.mymophpalette.shade800,
      //               size: 35,
      //             )),
      //         IconButton(
      //             onPressed: () {},
      //             icon: Icon(
      //               Icons.account_circle_outlined,
      //               color: MyMophColor.mymophpalette.shade800,
      //               size: 35,
      //             )),
      //       ],
      //     ),
      //   ),
      // ),

      //     BottomNavigationBar(
      //   currentIndex: currentIndex,
      //   onTap: (index) {
      //     setState(() {
      //       currentIndex = index;
      //     });
      //   },
      //   showSelectedLabels: false,
      //   showUnselectedLabels: false,
      //   items: [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'หน้าหลัก'),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.account_circle_outlined), label: 'หน้าหลัก'),
      //   ],
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.qr_code),
        onPressed: () {},
      ),
    );
  }
}
