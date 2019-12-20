import 'package:flutter/material.dart';
import 'package:video_list_test_code_ninja/models/video-code-ninja.dart';
import 'package:video_list_test_code_ninja/repository/video-repository.dart';

class VideoProvider with ChangeNotifier {
  VideoRepository _videoRepository = new VideoRepository();

  List<VideoCN> _videoList = [];
  bool _isLoaded = false;
  bool _isUploadingVideo = false;
  VideoCN _selectedVideoToPlay;

  get selectedVideoToPlay => _selectedVideoToPlay;

  get videoList => _videoList;

  get isLoadedList => _isLoaded;

  get isUploadingVideo => _isUploadingVideo;

  initProvider() async {
    _isLoaded = false;
    _videoList = await _videoRepository.getVideoList();
    _isLoaded = true;
    notifyListeners();
  }

  Future<VideoCN> uploadVideo(String videoPath) async {
    _isUploadingVideo = true;
    notifyListeners();

    VideoCN videoCN = await _videoRepository.uploadVideo(videoPath);
    _videoList.add(videoCN);
    _isLoaded = true;
    _isUploadingVideo = false;
    notifyListeners();

    return videoCN;
  }

  selectVideoToPlay(int index) {
    _selectedVideoToPlay = _videoList[index];
  }
}
