import 'dart:io';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
// import 'package:file_picker/file_picker.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:path_provider/path_provider.dart';
import './serial_barcode.dart';

void main() {
  SerialBarcode();
  runApp(const MyApp());
}

class Music {
  final String url;
  final String title;

  Music({
    required this.url,
    required this.title,
  });
  factory Music.fromJson(Map<String, dynamic> json) {
    return Music(url: json['url'], title: json['title']);
    //Music.fromJson(Map);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Audio Player Demo',
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
  final _scrollCtrl = ScrollController();
  final _storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    print(SerialBarcode.readBarcodeStream(context, 0));
    var origDir = await getApplicationDocumentsDirectory();
    //TODO get the directory of recently.. android permission check
    String _appDocumentsDirectory =
        origDir.path.substring(0, origDir.path.indexOf('Documents'));
    _appDocumentsDirectory = '${_appDocumentsDirectory}logs';

    List<FileSystemEntity> files = Directory(_appDocumentsDirectory).listSync();
    for (var file in files) {
      _playlist.add(Music(url: file.path, title: file.toString()));
    }
    // await _storage.write(key: 'test', value: 'this is for test');
    // FilePickerResult? result = await FilePicker.platform.pickFiles(
    //   allowMultiple: true,
    // );

    // if (result != null) {
    //   print(_storage.read(key: 'test'));
    //   for (var file in result.files) {
    //     _playlist.add(Music(title: file.name, url: file.path ?? ''));
    //   }
    //   await _setPlay();

    //   player.onDurationChanged.listen((Duration d) {
    //     //get the duration of audio
    //     setState(() {
    //       currentpos = 0;
    //       maxduration = d.inMilliseconds;
    //     });
    //   });

    //   player.onPositionChanged.listen((Duration p) {
    //     setState(() {
    //       currentpos =
    //           p.inMilliseconds; //get the current position of playing audio
    //       //refresh the UI
    //     });
    //   });

    //   player.onPlayerComplete.listen((event) {
    //     _playNext(true);
    //   });
    // }
  }

  void _playNext(bool forward) {
    if (forward) {
      setState(() {
        if (_playlist.length - 1 > _idx) {
          _idx += 1;
        } else {
          _idx = 0;
        }
      });
    } else {
      setState(() {
        if (_idx == 0) {
          _idx = _playlist.length - 1;
        } else {
          _idx -= 1;
        }
      });
    }
    _setPlay();
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

  Future<void> _seekPos(double value) async {
    int seekval = value.round();
    await player.seek(Duration(milliseconds: seekval));
    setState(() {
      currentpos = seekval;
    });
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
          Slider(
            value: double.parse(currentpos.toString()),
            min: 0,
            max: double.parse(maxduration.toString()),
            divisions: maxduration,
            onChanged: _seekPos,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _playlist.isEmpty ? 'Loading...' : _playlist[_idx].title,
                  style: const TextStyle(fontSize: 20),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      _playNext(false);
                    });
                  },
                  icon: const Icon(Icons.skip_previous)),
              ElevatedButton.icon(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.resolveWith(
                    (states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.black87;
                      } else {
                        return Colors.white;
                      }
                    },
                  ),
                  // backgroundColor: MaterialStateProperty.resolveWith(
                  //   (states) {
                  //     if (states.contains(MaterialState.pressed)) {
                  //       // return Colors.white;
                  //     } else {
                  //       // return Colors.black87;
                  //     }
                  //   },
                  // ),
                ),
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
                label: Text(_isPlaying ? 'pause' : 'play'),
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      _playNext(true);
                    });
                  },
                  icon: const Icon(Icons.skip_next)),
            ],
          ),
          const Divider(),
          const ListTile(
            title: Text(
              'Playlist',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
              height: 350,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Flexible(
                  child: Scrollbar(
                    thumbVisibility: true,
                    trackVisibility: true,
                    controller:
                        _scrollCtrl, // set controller for both scrollbar and object itself!
                    child: ScrollConfiguration(
                      behavior: ScrollConfiguration.of(context).copyWith(
                          scrollbars: false), // hide scrollbar of listView
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        controller: _scrollCtrl,
                        itemCount: _playlist.length,
                        itemBuilder: (_, idx) {
                          return ListTile(
                            leading: const Icon(Icons.music_note),
                            title: Text(_playlist[idx].title),
                            onTap: () {
                              setState(() {
                                _idx = idx;
                              });
                              _setPlay();
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
