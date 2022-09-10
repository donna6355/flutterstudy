import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:file_picker/file_picker.dart';

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
        primarySwatch: Colors.green,
      ),
      home: const MyPlayer(),
    );
  }
}

class MyPlayer extends StatefulWidget {
  const MyPlayer({Key? key}) : super(key: key);

  @override
  State<MyPlayer> createState() => _MyPlayerState();
}

class _MyPlayerState extends State<MyPlayer> {
  List<String> _playlist = [];
  int _idx = 0;
  bool _isPlaying = false;
  Duration? _currentDur;

  final AudioPlayer player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
    );

    if (result != null) {
      for (var path in result.paths) {
        if (path != null) {
          setState(() {
            _playlist.add(path);
          });
        }
      }
      await _setPlay();

      // player.onDurationChanged.listen((event) {
      //   print('this is duration change stream : $event');
      // });
      player.onPositionChanged.listen((event) {
        if (event == _currentDur) {
          print('playing is done!');
          setState(() {
            if (_playlist.length < _idx - 1) {
              _idx += 1;
            } else {
              _idx = 0;
            }
          });
          _setPlay();
        }
        print('this is position change stream : $event');
      });

      player.onPlayerStateChanged.listen((event) async {
        print('player is ${event.name}'); // paused 2, playing 1,
        if (event == PlayerState.stopped) {
          print('playing is done!');
          setState(() {
            if (_playlist.length < _idx - 1) {
              _idx += 1;
            } else {
              _idx = 0;
            }
          });
          _setPlay();
        }
      });
    }
  }

  Future<void> _setPlay() async {
    try {
      await player.play(DeviceFileSource(_playlist[_idx]));
      var dur = await player.getDuration();
      print('current duration : $dur');
      setState(() async {
        _isPlaying = true;
        _currentDur = dur;
      });
    } catch (e) {
      print('something wrong :$e');
      setState(() {
        _isPlaying = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Audio Player Test'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Image.asset('Isaac.png'),
          IconButton(
            onPressed: () {
              if (_isPlaying) {
                player.pause();
              } else {
                player.resume();
              }
              setState(() {
                _isPlaying = !_isPlaying;
              });
            },
            icon: _isPlaying
                ? const Icon(Icons.pause)
                : const Icon(Icons.play_arrow),
          ),
          Text('here for player'),
        ],
      ),
    );
  }
}