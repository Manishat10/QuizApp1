import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UploadVideoController extends GetxController {
  // Create an instance of FirebaseFirestore
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Create an instance of FirebaseAuth
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  uploadVideo(String songName, String caption, String videoPath) async {
    try {
      String uid = firebaseAuth.currentUser!.uid;

      // Now you can use 'firestore' and 'firebaseAuth' in your code
      var allDocs = await firestore.collection('videos').get();
      int len = allDocs.docs.length;

      // Continue with the rest of your code
    } catch (e) {
      // Handle the error
    }
  }
}
