import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import './color_model.dart';
import './pic_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Picture Checker',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  File? _file;
  int _bagType = 1;
  List<Widget> _similarity = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('랄라 신나는 장바구니 색깔 체크'),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Radio(
                  value: 1,
                  groupValue: _bagType,
                  onChanged: (val) {
                    setState(() {
                      _bagType = val!;
                    });
                  }),
              const Text('코끼리/반달곰'),
              const SizedBox(width: 20),
              Radio(
                  value: 2,
                  groupValue: _bagType,
                  onChanged: (val) {
                    setState(() {
                      _bagType = val!;
                    });
                  }),
              const Text('해달'),
              const SizedBox(width: 20),
              Radio(
                  value: 4,
                  groupValue: _bagType,
                  onChanged: (val) {
                    setState(() {
                      _bagType = val!;
                    });
                  }),
              const Text('랜더스'),
            ],
          ),
          const SizedBox(height: 20),
          _file == null
              ? const Center(child: Text('사진을 선택해 주세요'))
              : Column(
                  children: [
                    Image.file(
                      _file!,
                      width: 400,
                    ),
                    const SizedBox(height: 20),
                    ..._similarity,
                  ],
                ),
        ],
      ),
      floatingActionButton: IconButton(
        icon: const Icon(Icons.catching_pokemon),
        onPressed: () async {
          _similarity = [];
          FilePickerResult? result = await FilePicker.platform.pickFiles(
            type: FileType.custom,
            allowedExtensions: ['jpeg'],
          );
          if (result != null) {
            _file = File(result.files.single.path.toString());
            List<ColorModel> res =
                await PictureHelper.pickAndCompareColor(_file!, _bagType);
            setState(() {
              for (var str in res) {
                _similarity.add(ColorCard(col: str.color, res: str.res));
              }
            });
          }
        },
      ),
    );
  }
}

class ColorCard extends StatelessWidget {
  const ColorCard({required this.col, required this.res, super.key});
  final Color col;
  final String res;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 20,
        height: 20,
        color: col,
      ),
      title: Text(res),
    );
  }
}
