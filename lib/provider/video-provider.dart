import 'package:flutter/material.dart';
import 'package:video_list_test_code_ninja/models/video-code-ninja.dart';

class VideoProvider with ChangeNotifier {
  List<VideoCN> _videoList = [];
  bool _isLoaded = false;

  get videoList => _videoList;

  get isLoaded => _isLoaded;

  initProvider() {}

//  Future<VideoCN> uploadVideo(String videoPath) async {
//
//    return await
//  }

}
