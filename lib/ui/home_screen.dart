import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_list_test_code_ninja/models/video-code-ninja.dart';
import 'package:video_list_test_code_ninja/provider/video-provider.dart';
import 'package:video_list_test_code_ninja/ui/play_video_screen.dart';
import 'package:video_list_test_code_ninja/ui/take_video_screen.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<VideoProvider>(context, listen: false).initProvider();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(child: _build(context)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TakeVideoScreen(),
            ),
          );
        },
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _build(BuildContext context) {
    final videoProvider = Provider.of<VideoProvider>(context);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _buildVideoUploadingToServer(context),
          videoProvider.isLoadedList == false
              ? _loading(context)
              : _buildList(context),
        ],
      ),
    );
  }

  Widget _loading(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }

  Widget _buildList(BuildContext context) {
    final videoProvider = Provider.of<VideoProvider>(context);
    if (videoProvider.videoList.length > 0) {
      return ListView.builder(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: videoProvider.videoList.length,
        itemBuilder: (context, position) {
          return _buildListItem(context, position);
        },
      );
    } else {
      return Center(
        child: Text('Please add video by press on +'),
      );
    }
  }

  Widget _buildVideoUploadingToServer(BuildContext context) {
    final videoProvider = Provider.of<VideoProvider>(context);
    return SizedBox(
      height: videoProvider.isUploadingVideo ? 50 : 0,
      child: videoProvider.isUploadingVideo
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text('Video Uploading to server'),
                CircularProgressIndicator()
              ],
            )
          : Container(),
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    final videoProvider = Provider.of<VideoProvider>(context);
    Size _deviceSize = MediaQuery.of(context).size;
    VideoCN videoCN = videoProvider.videoList[index];
    return InkWell(
      onTap: () {
        videoProvider.selectVideoToPlay(index);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlayVideoScreen(),
          ),
        );
      },
      child: Card(
          margin: EdgeInsets.all(6.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.network(
                videoCN.videoImagePreview,
                fit: BoxFit.cover,
                width: _deviceSize.width,
                height: _deviceSize.width/2,
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'DocumentID: ' + videoCN.documentID,
                    ),
                    Text(
                      'Creating date: ' + videoCN.creationDate.toString(),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
