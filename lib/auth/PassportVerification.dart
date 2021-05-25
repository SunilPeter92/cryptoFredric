import 'package:flutter/material.dart';
import 'dart:io';
import 'package:CanuckCrypto/auth/BasicVerification.dart';
import 'package:CanuckCrypto/auth/ImageVerification.dart';
import 'package:CanuckCrypto/constance/Colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class PassportVerification extends StatefulWidget {
  @override
  _PassportVerificationState createState() => _PassportVerificationState();
}

class _PassportVerificationState extends State<PassportVerification> {
File _image;
File _image1;

_imgFromCamera() async {
  File image = await ImagePicker.pickImage(
      source: ImageSource.camera, imageQuality: 50
  );

  setState(() {
    _image = image;
  });
}

_imgFromGallery() async {
  File image = await  ImagePicker.pickImage(
      source: ImageSource.gallery, imageQuality: 50
  );

  setState(() {
    _image = image;
  });
}
_imgFromCamera1() async {
  File image = await ImagePicker.pickImage(
      source: ImageSource.camera, imageQuality: 50
  );

  setState(() {
    _image1 = image;
  });
}

_imgFromGallery1() async {
  File image = await  ImagePicker.pickImage(
      source: ImageSource.gallery, imageQuality: 50
  );

  setState(() {
    _image1 = image;
  });
}
void _showPicker(context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(Icons.photo_library),
                    title: new Text('Photo Library'),
                    onTap: () {
                      _imgFromGallery();
                      Navigator.of(context).pop();
                    }),
                new ListTile(
                  leading: new Icon(Icons.photo_camera),
                  title: new Text('Camera'),
                  onTap: () {
                    _imgFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      }
  );
}
void _showPicker1(context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(Icons.photo_library),
                    title: new Text('Photo Library'),
                    onTap: () {
                      _imgFromGallery1();
                      Navigator.of(context).pop();
                    }),
                new ListTile(
                  leading: new Icon(Icons.photo_camera),
                  title: new Text('Camera'),
                  onTap: () {
                    _imgFromCamera1();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      }
  );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        centerTitle: true,
        leading: InkWell( onTap:(){ Navigator.pop(context);} ,child: Icon(Icons.arrow_back, color: lightblue)),
        title: Text(
          'ID Verification',
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 18, color: black),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 20, top: 5, right: 20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  'Passport Verification',
                  style: TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 18, color: black),
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    _showPicker(context);
                  },
                  child: _image != null
                      ? Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width/1.2,
                      child: Image.file(
                        _image,
                        fit: BoxFit.fill,
                      ),
                    ),
                  )
                      : Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10)),
                      height: 200,
                      width: MediaQuery.of(context).size.width/1.2,
                      child: Center(
                        child: Text("Select your Front Image of Passport",style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    _showPicker1(context);
                  },
                  child: _image1 != null
                      ? Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width/1.2,
                      child: Image.file(
                        _image1,
                        fit: BoxFit.fill,
                      ),
                    ),
                  )
                      : Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10)),
                      height: 200,
                      width: MediaQuery.of(context).size.width/1.2,
                      child: Center(
                        child: Text("Select your Inner Image of Passport",style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 100,),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ImageVerification()),
                  );
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: lightblue,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Text(
                        "Submit & Continue",
                        style: TextStyle(fontSize: 15, color: white),
                      )),
                ),
              ),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}







