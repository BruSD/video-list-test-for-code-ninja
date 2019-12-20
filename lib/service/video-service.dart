import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class VideoService {


  Future<String> uploadVideo(String videoPath) async {
    final StorageReference storageRef =
        FirebaseStorage.instance.ref().child(DateTime.now().toString());
    final StorageUploadTask uploadTask = storageRef.putFile(File(videoPath));
    final StorageTaskSnapshot downloadUrl = (await uploadTask.onComplete);
    final String url = (await downloadUrl.ref.getDownloadURL());
    print('URL Is $url');

    return url;
  }
}
