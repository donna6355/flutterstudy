import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:auto_size_text/auto_size_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Video(),
    );
  }
}

class Video extends StatefulWidget {
  const Video({Key? key}) : super(key: key);

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..setLooping(true)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      })
      ..play();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
        body: RefreshIndicator(
          onRefresh: () async {
            _controller.pause();
          },
          child: ListView(
            children: [
              Center(
                child: _controller.value.isInitialized
                    ? AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      )
                    : Container(),
              ),
              const SizedBox(
                width: 200,
                height: 140,
                child: Text(
                  'This string will be automatically resized to fit in two lines.',
                  style: TextStyle(fontSize: 30),
                  maxLines: 2,
                ),
              ),
              const SizedBox(
                width: 200,
                height: 140,
                child: FittedBox(
                  child: Text(
                    'This string will be automatically resized to fit in two lines.',
                    style: TextStyle(fontSize: 30),
                    maxLines: 2,
                  ),
                ),
              ),
              const SizedBox(
                width: 200,
                height: 140,
                child: AutoSizeText(
                  'This string will be automatically resized to fit in two lines.',
                  style: TextStyle(fontSize: 30),
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          },
          child: _controller.value.isPlaying
              ? const FaIcon(FontAwesomeIcons.a)
              : const FaIcon(FontAwesomeIcons.accusoft),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
