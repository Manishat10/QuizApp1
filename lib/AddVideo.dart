import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'ConfirmScreen.dart';

class AddVideo extends StatelessWidget {
  const AddVideo({super.key});
  pickVideo(ImageSource src, BuildContext context) async {
    final video = await ImagePicker().pickVideo(source: src);
    if (video != null) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ConfirmScreen(
            videoFile:File(video.path) ,
            videoPath:video.path ,
          ),
        ),
      );
    }
  }

  ShowOptions(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        children: [
          SimpleDialogOption(
            onPressed: () => pickVideo(ImageSource.gallery, context),
            child: const Row(
              children: [
                Icon(Icons.image),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    "Gallery",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SimpleDialogOption(
            onPressed: () => pickVideo(ImageSource.camera, context),
            child: const Row(
              children: [
                Icon(Icons.camera_alt),
                Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    "Camera",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SimpleDialogOption(
            onPressed:()=> Navigator.pop(context),
            child: const Row(
              children: [
                Icon(Icons.cancel),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            ShowOptions(context);
          },
          child: Container(
            width: 220,
            height: 60,
            decoration: BoxDecoration(color: Colors.black),
            child: const Center(
                child: Text(
                  "Add Video",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 33,
                  ),
                )),
          ),
        ),
      ),
    );
  }
}

// import 'dart:html' if (dart.library.html) 'dart:html';
// import 'dart:ui';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// class AuthenticationController extends GetxController{
//   static AuthenticationController instanceAuth =Get.find();
//
//   late Rx<File?> _pickedFile;
//   File? get profileImage=>_pickedFile.value;
//   void chooseImage()async{
//     final pickedIFile=await ImagePicker().pickImage(source: ImageSource.gallery);
//     if(pickedIFile!=null){
//       Get.snackbar("Profile Image","You have successfully picked your profile Image");
//     }
//    _pickedFile =Rx<File?>(File(pickedIFile!.path as List<Object>,_pickedFile as String));
//
//   }
//   void chooseImageFromCamera()async{
//     final pickedIFile=await ImagePicker().pickImage(source: ImageSource.camera);
//     if(pickedIFile!=null){
//       Get.snackbar("Profile Image","You have successfully picked your profile Image");
//     }
//     _pickedFile =Rx<File?>(File(pickedIFile!.path as List<Object>,_pickedFile as String));
//
//   }
//
// }
