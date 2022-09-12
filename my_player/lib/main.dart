import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:file_picker/file_picker.dart';

void main() {
  runApp(const MyApp());
}

class Music {
  final String url;
  final String title;

  Music({
    required this.url,
    required this.title,
  });
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
  final List<Music> _playlist = [];
  int _idx = 0;
  bool _isPlaying = false;

  int maxduration = 100;
  int currentpos = 0;

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
      for (var file in result.files) {
        _playlist.add(Music(title: file.name, url: file.path ?? ''));
      }
      await _setPlay();

      player.onDurationChanged.listen((Duration d) {
        //get the duration of audio
        maxduration = d.inMilliseconds;
        setState(() {});
      });

      player.onPositionChanged.listen((Duration p) {
        currentpos =
            p.inMilliseconds; //get the current position of playing audio

        //generating the duration label
        int shours = Duration(milliseconds: currentpos).inHours;
        int sminutes = Duration(milliseconds: currentpos).inMinutes;
        int sseconds = Duration(milliseconds: currentpos).inSeconds;

        int rhours = shours;
        int rminutes = sminutes - (shours * 60);
        int rseconds = sseconds - (sminutes * 60 + shours * 60 * 60);

        setState(() {
          //refresh the UI
        });
      });

      // player.onPlayerStateChanged.listen((event) async {
      //   print('player is ${event.name}'); // paused 2, playing 1,
      //   if (event == PlayerState.stopped) {
      //     print('playing is done!');
      //     setState(() {
      //       if (_playlist.length < _idx - 1) {
      //         _idx += 1;
      //       } else {
      //         _idx = 0;
      //       }
      //     });
      //     _setPlay();
      //   }
      // });

      player.onPlayerComplete.listen((event) {
        print('!!!!!!!!!!!over!!!!!!!!!!!');
        setState(() {
          if (_playlist.length - 1 > _idx) {
            _idx += 1;
          } else {
            _idx = 0;
          }
        });
        _setPlay();
      });
    }
  }

  Future<void> _setPlay() async {
    try {
      await player.play(DeviceFileSource(_playlist[_idx].url));

      setState(() {
        _isPlaying = true;
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
          Slider(
            value: double.parse(currentpos.toString()),
            min: 0,
            max: double.parse(maxduration.toString()),
            divisions: maxduration,
            onChanged: _seekPos,
          ),
          Padding(
            child:
                Text(_playlist.isEmpty ? 'Loading...' : _playlist[_idx].title),
            padding: const EdgeInsets.symmetric(vertical: 10),
          ),
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
        ],
      ),
    );
  }

  Future<void> _seekPos(double value) async {
    int seekval = value.round();
    await player.seek(Duration(milliseconds: seekval));
    setState(() {
      currentpos = seekval;
    });
  }
}
