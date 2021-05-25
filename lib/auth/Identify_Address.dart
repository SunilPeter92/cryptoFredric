import 'dart:io';

import 'package:CanuckCrypto/constance/Colors.dart';
import 'package:CanuckCrypto/constance/routes.dart';
import 'package:CanuckCrypto/modules/home/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Address_Identify extends StatefulWidget {
  @override
  _Address_IdentifyState createState() => _Address_IdentifyState();
}

class _Address_IdentifyState extends State<Address_Identify> {
  File _image;
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        centerTitle: true,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: lightblue)),
        title: Text(
          'Basic info canuckcrypto',
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
                  'Address Verification',
                  style: TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 18, color: black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  "Add your bill image for Address Verification",
                  style: TextStyle(fontSize: 15, color: Colors.grey),
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
                    height: 300,
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
                          height: 300,
                          width: MediaQuery.of(context).size.width/1.2,
                    child: Icon(
                        Icons.camera_alt,
                        color: Colors.grey[800],
                    ),
                  ),
                      ),
                ),
              ),

              SizedBox(height: 100,),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      Routes.Home, (Route<dynamic> route) => false);
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
