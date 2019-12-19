import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_list_test_code_ninja/provider/video-provider.dart';
import 'package:video_list_test_code_ninja/ui/take_video_screen.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: _build(context),
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
    if (videoProvider.isLoaded) {
      return Container();
    } else {
      return Center(child: CircularProgressIndicator());
    }
  }
}
