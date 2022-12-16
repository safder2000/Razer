import 'dart:developer';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ImageFunctions {
  static ImagePicker _imagePicker = ImagePicker();
  static List addImage(List images, String imgUrl) {
    // if (images.length < 5) {
    //   return images;
    // } else {
    //   images.add(imgUrl);
    //   return images;
    // }
    images.add(imgUrl);
    return images;
  }

  static Future<String?> getImage() async {
    final xfile = await ImageFunctions.selectImage();
    if (xfile != null) {
      log('got image from local storage');
      String? imgUrl = await ImageFunctions.uploadImage(xfile);
      return imgUrl;
    } else {
      return null;
    }
  }

  static Future<XFile?> selectImage() async {
    final xfile = (await _imagePicker.pickImage(source: ImageSource.gallery));
    if (null != xfile) {
      // file = File(xfile.path);
    }
    return xfile;
  }

  static Future<String?> uploadImage(XFile xfile) async {
    final path = 'images/${xfile.name}';
    final file = File(xfile.path);

    final ref = FirebaseStorage.instance.ref().child(path);
    log('firebase storage instance created');
    final uploadTask = ref.putFile(file);
    log('image ${xfile.name} uploaded to fire storage');
    try {
      final snapshot = await uploadTask.whenComplete(() {});
      log('image ${xfile.name} image uploaded');
      final imageUrl = await snapshot.ref.getDownloadURL();
      log('image ${xfile.name}  link   (${imageUrl})');
      return imageUrl;
    } on Exception catch (e) {
      log('exeption occuored $e');
      return null;
    }
  }
}
