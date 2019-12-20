import 'package:video_list_test_code_ninja/models/video-code-ninja.dart';
import 'package:video_list_test_code_ninja/service/video-service.dart';

class VideoRepository {
  VideoService _videoService = new VideoService();

  Future<VideoCN> uploadVideo(String videoPath) async {
    String videoURL = await _videoService.uploadVideo(videoPath);

    return new VideoCN(videoURL: videoURL);
  }
}
