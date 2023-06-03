import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:image/image.dart' as img;

Future<void> pickFiles() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    allowMultiple: true,
    type: FileType.image,
  );

  if (result != null) {
    List<String?> files = result.paths;
    for (var path in files) {
      if (path != null) _cropImg(path);
    }
  } else {
    // User canceled the picker
  }
}

Future<void> _cropImg(String filePath) async {
  final img.Image? image = img.decodeJpg(await File(filePath).readAsBytes());
  final img.Image cropped =
      img.copyCrop(image!, x: 807, y: 0, width: 833, height: 1070);
  await File(filePath).writeAsBytes(img.encodeJpg(cropped));
}
