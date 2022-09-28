import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_moph/register.dart';
import 'package:permission_handler/permission_handler.dart';

class EKycPage extends StatefulWidget {
  const EKycPage({Key? key}) : super(key: key);

  @override
  State<EKycPage> createState() => _EKycPageState();
}

class _EKycPageState extends State<EKycPage> {
  bool isGrantCamera = false;

  Future takePicture() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
    );

    print(pickedFile!.path);
  }

  Future getPermissionStatus() async {
    await Permission.camera.request();
    var status = await Permission.camera.status;
    if (status.isGranted) {
      print('Camera Permission: GRANTED');
      setState(() {
        isGrantCamera = true;
      });
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
                        takePicture();
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
                  child: Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12, width: 2),
                        color: Colors.grey[50],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image:
                                AssetImage("assets/images/identity-card.png"))),
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
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => RegisterPage()));
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
