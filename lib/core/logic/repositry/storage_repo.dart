import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class CloudStorageRepositry {
  final FirebaseStorage storage = FirebaseStorage.instance;

  UploadTask? uploadImage(String destination, File imageToUpload) {
    try {
      Reference ref = storage.ref(destination);
      return ref.putFile(imageToUpload);
    } catch (e) {
      print(e.toString());
    }
  }
}
