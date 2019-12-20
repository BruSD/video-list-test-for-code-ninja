import 'package:flutter/material.dart';
import 'package:video_list_test_code_ninja/models/video-code-ninja.dart';
import 'package:video_list_test_code_ninja/repository/video-repository.dart';

class VideoProvider with ChangeNotifier {
  VideoRepository _videoRepository = new VideoRepository();

  List<VideoCN> _videoList = [];
  bool _isLoaded = false;
  bool _isUploadingVideo = false;

  get videoList => _videoList;

  get isLoadedList => _isLoaded;

  get isUploadingVideo => _isUploadingVideo;

  initProvider() {}

  Future<VideoCN> uploadVideo(String videoPath) async {
    _isUploadingVideo = true;
    notifyListeners();

    VideoCN videoCN = await _videoRepository.uploadVideo(videoPath);

    _isUploadingVideo = false;
    notifyListeners();

    return videoCN;
  }
}
