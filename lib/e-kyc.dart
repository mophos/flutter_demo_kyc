import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_moph/services/kyc-service.dart';
import 'package:permission_handler/permission_handler.dart';

class EKycPage extends StatefulWidget {
  const EKycPage({Key? key}) : super(key: key);

  @override
  State<EKycPage> createState() => _EKycPageState();
}

class _EKycPageState extends State<EKycPage> {
  bool isGrantCamera = false;
  String sessionId = "";

  KycService kycService = KycService();

  Future createSessionId() async {
    Response res = await kycService.createSession();
    if (res.statusCode == 200) {
      setState(() {
        sessionId = res.data['sessionId'];
      });
    } else {
      print(res.statusCode);
      print(res);
    }
  }

  Future uploadFace(String filePath) async {
    try {
      Response res = await kycService.uploadFace(filePath, sessionId);
      if (res.statusCode == 200) {
        print(res.data);
      } else {
        print(res.statusCode);
        print(res);
      }
    } catch (error) {
      print(error);
    }
  }

  Future uploadFrontIDCard(String filePath) async {
    try {
      Response res = await kycService.uploadFrontIDCard(filePath, sessionId);
      if (res.statusCode == 200) {
        print(res.data);
      } else {
        print(res.statusCode);
        print(res);
      }
    } catch (error) {
      print(error);
    }
  }

  Future uploadBackIDCard(String filePath) async {
    try {
      Response res = await kycService.uploadBackIDCard(filePath, sessionId);
      if (res.statusCode == 200) {
        print(res.data);
      } else {
        print(res.statusCode);
        print(res);
      }
    } catch (error) {
      print(error);
    }
  }

  Future completeSession(String _sessionId) async {
    try {
      Response res = await kycService.completeSession(_sessionId);
      if (res.statusCode == 200) {
        print(res.data);
      } else {
        print(res.statusCode);
        print(res);
      }
    } catch (error) {
      print(error);
    }
  }

  // 1 = Face
  // 2 = Front
  // 3 = Back
  Future takePicture(int type) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
    );

    print(pickedFile!.path);

    if (pickedFile.path.isNotEmpty) {
      String filePath = pickedFile.path;

      if (type == 1) {
        uploadFace(filePath);
      } else if (type == 2) {
        uploadFrontIDCard(filePath);
      } else {
        uploadBackIDCard(filePath);
      }
    }
  }

  Future getPermissionStatus() async {
    await Permission.camera.request();
    var status = await Permission.camera.status;
    if (status.isGranted) {
      print('Camera Permission: GRANTED');
      setState(() {
        isGrantCamera = true;
      });

      createSessionId();
      // Set and initialize the new camera
    } else {
      setState(() {
        isGrantCamera = false;
      });
      print('Camera Permission: DENIED');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getPermissionStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('KYC'),
      ),
      body: ListView(
        children: [
          isGrantCamera
              ? Container()
              : Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(color: Colors.yellow),
                  child: Text(
                    'ไม่สามารถเข้าถึงกล้องได้',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.red),
                  )),
          Text('$sessionId'),
          Container(
            margin: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Please upload Face'),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      if (isGrantCamera) {
                        takePicture(1);
                      }
                    },
                    child: Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12, width: 2),
                          color: Colors.grey[50],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/customer.png"))),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Please upload Front ID Card'),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      if (isGrantCamera) {
                        takePicture(2);
                      }
                    },
                    child: Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12, width: 2),
                          color: Colors.grey[50],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/id-card.png"))),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Please upload Back ID Card'),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      if (isGrantCamera) {
                        takePicture(3);
                      }
                    },
                    child: Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12, width: 2),
                          color: Colors.grey[50],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                  "assets/images/identity-card.png"))),
                    ),
                  ),
                ),
              ],
            ),
          ),
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
                      onPressed: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => RegisterPage()));
                        completeSession(sessionId);
                      },
                      child: Text("Uploads...")),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
