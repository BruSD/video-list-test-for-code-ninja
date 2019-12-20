import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:video_list_test_code_ninja/models/video-code-ninja.dart';
import 'package:video_list_test_code_ninja/service/video-service.dart';

class VideoRepository {
  VideoService _videoService = new VideoService();

  Future<VideoCN> uploadVideo(String videoPath) async {
    String videoURL = await _videoService.uploadVideo(videoPath);

    VideoCN videoCN = VideoCN(
        videoURL: videoURL,
        name: DateTime.now().toString(),
        creationDate: DateTime.now(),
        videoImagePreview: '');

    videoCN.documentID =
        (await _videoService.addVideoDetails(videoCN.videoModelToJson()))
            .documentID;
    return videoCN;
  }

  Future<List<VideoCN>> getVideoList() async {
    List<DocumentSnapshot> docs = await _videoService.getVideoList();
    List<VideoCN> list = [];
    if (docs.length > 0) {
      docs.forEach((doc) {
        VideoCN videoCN = VideoCN().videoFromJson(doc.data);
        videoCN.documentID = doc.documentID;
        list.add(videoCN);
      });
    }
    return list;
  }
}
