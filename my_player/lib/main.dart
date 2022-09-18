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

        setState(() {
          //refresh the UI
        });
      });

      player.onPlayerComplete.listen((event) {
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
        title: const Text('Audio Player Test'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //FIX once the song turn to next, maxduration is smaller than currentpos
          Slider(
            value: double.parse(currentpos.toString()),
            min: 0,
            max: double.parse(maxduration.toString()),
            divisions: maxduration,
            onChanged: _seekPos,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child:
                Text(_playlist.isEmpty ? 'Loading...' : _playlist[_idx].title),
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
          const Divider(),
          const Text('Playlist'),
          Expanded(
              child: ListView(
            children: _playlist
                .map(
                  (song) => ListTile(
                    leading: const Icon(Icons.music_note),
                    title: Text(song.title),
                  ),
                )
                .toList(),
          )),
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
