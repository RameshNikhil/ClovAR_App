import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';

class CameraHomeScreen extends StatefulWidget {
  List<CameraDescription> cameras;

  CameraHomeScreen(this.cameras);

  @override
  State<StatefulWidget> createState() {
    return _CameraHomeScreenState();
  }
}

class _CameraHomeScreenState extends State<CameraHomeScreen> {
  String imagePath;
  int counter = 0;
  bool _toggleCamera = false;
  CameraController controller;

  @override
  void initState() {
    try {
      onCameraSelected(widget.cameras[0]);
    } catch (e) {
      print(e.toString());
    }
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.cameras.isEmpty) {
      return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(16.0),
        child: Text(
          'No Camera Found',
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.white,
          ),
        ),
      );
    }

    if (!controller.value.isInitialized) {
      return Container(
      );
    }

    return AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: Container(
        child: Stack(
          children: <Widget>[
            CameraPreview(controller),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: 120.0,
                padding: EdgeInsets.all(20.0),
                color: Color.fromRGBO(00, 00, 00, 0.0),
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                          onTap: () {
                            _captureImage();
                          },
                          child: Container(
                            padding: EdgeInsets.all(4.0),
                            child: Image.asset(
                              'lib/assets/images/ic_shutter_1.png',
                              width: 72.0,
                              height: 72.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                          onTap: () {
                    Navigator.pop(context, imagePath);
                          },
                          child: Container(
                            padding: EdgeInsets.all(4.0),
                            child: Image.asset(
                              'lib/assets/images/ic_switch_camera_3.png',
                              color: Colors.grey[200],
                              width: 42.0,
                              height: 42.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );


  }

  void onCameraSelected(CameraDescription cameraDescription) async {
    if (controller != null) await controller.dispose();
    controller = CameraController(cameraDescription, ResolutionPreset.medium);

    controller.addListener(() {
      if (mounted) setState(() {});
      if (controller.value.hasError) {
        showMessage('Camera Error: ${controller.value.errorDescription}');
      }
    });

    try {
      await controller.initialize();
    } on CameraException catch (e) {
      showException(e);
    }

    if (mounted) setState(() {});
  }

  String timestamp() => new DateTime.now().millisecondsSinceEpoch.toString();

  void _captureImage() {
    takePicture().then((String filePath) {
      if (mounted) {
        setState(() {
          imagePath = filePath;
        });
        if (filePath != null) {
          showMessage('Picture saved to $filePath');
          setCameraResult();
        }
      }
    });
  }

  void setCameraResult() {
      //Navigator.pop(context, imagePath);
      print(this.counter);
      _showDialog(imagePath, this.counter);
  }

  void _showDialog(imagePath, oldCounter) {

    File imgFile = File(imagePath);
    List<int> imageBytes = imgFile.readAsBytesSync();
    String base64Image = base64Encode(imageBytes);

    // make GET request
    Uri uri = new Uri.http('5f4d2762.ngrok.io', '/', {"counter": oldCounter.toString(), "image":"{base64Image}"});
    print(uri.toString());
    get(uri.toString()).then((response){
      print(response.body);// flutter defined function
      
      var object = json.decode(response.body);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
                  // titlePadding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  // title: new Text(
                  //   "Delete?",
                  //   style: TextStyle(
                  //     fontWeight: FontWeight.w600,
                  //   ),
                  // ),
                  backgroundColor: Colors.white,
                  contentPadding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(object['url']),

                      Padding(
                        padding: EdgeInsets.only(top:6.0, bottom: 18.0),
                        child:  Text(
                        object['name'],
                        style: TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top:6.0, bottom: 19.0),
                        child:  Text(
                        object['height'],
                      ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top:6.0, bottom: 19.0),
                        child:  Text(
                          "Plant Rarity Score: " +
                        object['score'],
                        style: TextStyle(
                          color: Colors.orange,
                        ),
                      ),
                      ),

                    ],
                  ),
                  actions: <Widget>[
                    // usually buttons at the bottom of the dialog

                    new FlatButton(
                      child: new Text(
                        "Cancel",
                        // style: TextStyle(
                        //   fontWeight: FontWeight.bold,
                        // ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
      },
    );
    });

     int newCounter = (oldCounter +1) % 3;
   
    setState(() {
          counter = newCounter;
        });

    print(newCounter);


    
  }

  Future<String> takePicture() async {
    if (!controller.value.isInitialized) {
      showMessage('Error: select a camera first.');
      return null;
    }
    final Directory extDir = await getApplicationDocumentsDirectory();
    final String dirPath = '${extDir.path}/FlutterDevs/Camera/Images';
    await new Directory(dirPath).create(recursive: true);
    final String filePath = '$dirPath/${timestamp()}.jpg';

    if (controller.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return null;
    }

    try {
      await controller.takePicture(filePath);
    } on CameraException catch (e) {
      showException(e);
      return null;
    }
    return filePath;
  }

  void showException(CameraException e) {
    logError(e.code, e.description);
    showMessage('Error: ${e.code}\n${e.description}');
  }

  void showMessage(String message) {
    print(message);
  }

  void logError(String code, String message) =>
      print('Error: $code\nMessage: $message');
}
