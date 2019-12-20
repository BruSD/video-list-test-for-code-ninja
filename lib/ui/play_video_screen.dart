import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_list_test_code_ninja/provider/video-provider.dart';
import 'package:video_list_test_code_ninja/utils/VideoControls.dart';
import 'package:video_player/video_player.dart';

class PlayVideoScreen extends StatefulWidget {
  @override
  _PlayVideoScreenState createState() => _PlayVideoScreenState();
}

class _PlayVideoScreenState extends State<PlayVideoScreen> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    final videoProvider = Provider.of<VideoProvider>(context, listen: false);

    _controller = VideoPlayerController.network(
        videoProvider.selectedVideoToPlay.videoURL)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Video View'),

        ),
        body: Center(
          child: _controller.value.initialized
              ? _renderPlayer(context)
              : CircularProgressIndicator(),
        ),
      ),
    );
  }

  Widget _renderPlayer(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: VideoControls(
            videoController: _controller,
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
