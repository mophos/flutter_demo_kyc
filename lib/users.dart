import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_moph/services/api.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
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
      appBar: AppBar(
        title: Text('รายชื่อสมาชิก'),
      ),
      body: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[50],
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {},
                )),
          ),
          Expanded(
              flex: 5,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  Map e = users[index];

                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage(e['picture']['thumbnail']),
                      ),
                      title: Text(
                          '${e['name']['title']}.${e['name']['first']} ${e['name']['last']}'),
                      subtitle: Text(e['email']),
                      trailing: Icon(Icons.keyboard_arrow_right),
                    ),
                  );
                },
                itemCount: users.length,
              )),
        ],
      ),
    );
  }
}
