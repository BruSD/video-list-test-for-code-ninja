import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
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

  Future<DocumentReference> addVideoDetails(Map<String, dynamic> video) async =>
      await Firestore.instance.collection('video').add(video);

  Future<List<DocumentSnapshot>> getVideoList() async {
    QuerySnapshot listOfIngredientsSynonym =
        await Firestore.instance.collection('video').getDocuments();
    return listOfIngredientsSynonym.documents;
  }

  Future<String> uploadPreview(String thumb) async {
    final StorageReference storageRef = FirebaseStorage.instance
        .ref()
        .child('/preview/' + DateTime.now().toString());
    final StorageUploadTask uploadTask = storageRef.putFile(File(thumb));
    final StorageTaskSnapshot downloadUrl = (await uploadTask.onComplete);
    final String url = (await downloadUrl.ref.getDownloadURL());
    print('URL Is $url');

    return url;
  }
}
