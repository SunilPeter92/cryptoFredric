import 'package:CanuckCrypto/constance/constance.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:permission_handler/permission_handler.dart';
import 'package:image_picker/image_picker.dart';


class TestQur extends StatefulWidget {
  @override
  _TestQurState createState() => _TestQurState();
}

class _TestQurState extends State<TestQur> {
  @override
  Uint8List bytes = Uint8List(0);
  TextEditingController _inputController;
  TextEditingController _outputController;

  @override
  initState() {
    super.initState();
    this._inputController = new TextEditingController();
    this._outputController = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        body: Builder(
          builder: (BuildContext context) {
            return ListView(
              children: <Widget>[
                _qrCodeWidget(this.bytes, context),
                Container(
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      // TextField(
                      //   controller: this._inputController,
                      //   keyboardType: TextInputType.url,
                      //   textInputAction: TextInputAction.go,
                      //   onSubmitted: (value) => _generateBarCode(value),
                      //   decoration: InputDecoration(
                      //     prefixIcon: Icon(Icons.text_fields),
                      //     helperText:
                      //     'Please input your code to generage qrcode image.',
                      //     hintText: 'Please Input Your Code',
                      //     hintStyle: TextStyle(fontSize: 15),
                      //     contentPadding:
                      //     EdgeInsets.symmetric(horizontal: 7, vertical: 15),
                      //   ),
                      // ),
                      SizedBox(height: 20),
                      TextField(
                        controller: this._outputController,
                        maxLines: 2,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.wrap_text),
                          helperText:
                          'The barcode or qrcode you scan will be displayed in this area.',
                          hintText:
                          'The barcode or qrcode you scan will be displayed in this area.',
                          hintStyle: TextStyle(fontSize: 15),
                          contentPadding:
                          EdgeInsets.symmetric(horizontal: 7, vertical: 15),
                        ),
                      ),
                      SizedBox(height: 20),
                      this._buttonGroup(),
                      SizedBox(height: 70),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () => _scanBytes(),
        //   tooltip: 'Take a Photo',
        //   child: const Icon(Icons.camera_alt),
        // ),
      ),
    );
  }

  Widget _qrCodeWidget(Uint8List bytes, BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          // Container(
          //   child: Row(
          //     crossAxisAlignment: CrossAxisAlignment.end,
          //     children: <Widget>[
          //       Icon(Icons.verified_user, size: 18, color: Colors.green),
          //       Text('  Generate Qrcode', style: TextStyle(fontSize: 15)),
          //       Spacer(),
          //       Icon(Icons.more_vert, size: 18, color: Colors.black54),
          //     ],
          //   ),
          //   padding: EdgeInsets.symmetric(horizontal: 10, vertical: 9),
          //   decoration: BoxDecoration(
          //     color: Colors.black12,
          //     borderRadius: BorderRadius.only(
          //         topLeft: Radius.circular(4), topRight: Radius.circular(4)),
          //   ),
          // ),
          Padding(
            padding:
            EdgeInsets.only(left: 40, right: 40, top: 30, bottom: 10),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 190,
                  child: bytes.isEmpty
                      ? Image.asset(
                    ConstanceData.barCodeImage,
                    height: 150,
                    width: 150,
                  )
                      : Image.memory(bytes),
                ),
                // Padding(
                //   padding: EdgeInsets.only(top: 7, left: 25, right: 25),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                //     children: <Widget>[
                //       Expanded(
                //         flex: 5,
                //         child: GestureDetector(
                //           child: Text(
                //             'remove',
                //             style:
                //             TextStyle(fontSize: 15, color: Colors.blue),
                //             textAlign: TextAlign.left,
                //           ),
                //           onTap: () =>
                //               this.setState(() => this.bytes = Uint8List(0)),
                //         ),
                //       ),
                //
                //     ],
                //   ),
                // )
              ],
            ),
          ),
          // Divider(height: 2, color: Colors.black26),
          // Container(
          //   child: Row(
          //     children: <Widget>[
          //       Icon(Icons.history, size: 16, color: Colors.black38),
          //       Text('  Generate History',
          //           style: TextStyle(fontSize: 14, color: Colors.black38)),
          //       Spacer(),
          //       Icon(Icons.chevron_right, size: 16, color: Colors.black38),
          //     ],
          //   ),
          //   padding: EdgeInsets.symmetric(horizontal: 10, vertical: 9),
          // )
        ],
      ),
    );
  }

  Widget _buttonGroup() {
    return InkWell(
      onTap: _scan,
      child: Container(
        width: 50,
          height: 50,
          // Expanded(
          //   flex: 2,
          //   child: Image.asset('images/scanner.png'),
          // ),
          // Divider(height: 20),
         child: Text("Scan"),
      ),
    );
  }

  Future _scan() async {
    await Permission.camera.request();
    String barcode = await scanner.scan();
    if (barcode == null) {
      print('nothing return.');
    } else {
      this._outputController.text = barcode;
    }
  }

  Future _scanPhoto() async {
    await Permission.storage.request();
    String barcode = await scanner.scanPhoto();
    this._outputController.text = barcode;
  }

  Future _scanPath(String path) async {
    await Permission.storage.request();
    String barcode = await scanner.scanPath(path);
    this._outputController.text = barcode;
  }

  Future _scanBytes() async {
    File file = await ImagePicker.pickImage(source: ImageSource.camera);
    if (file == null) return;
    Uint8List bytes = file.readAsBytesSync();
    String barcode = await scanner.scanBytes(bytes);
    this._outputController.text = barcode;
  }

  Future _generateBarCode(String inputCode) async {
    Uint8List result = await scanner.generateBarCode(inputCode);
    this.setState(() => this.bytes = result);
  }
}
