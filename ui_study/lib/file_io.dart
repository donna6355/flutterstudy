import 'dart:io';

class LogController {
  final File file = File('sample/counter.txt');

  Future<void> writeFile() async {
    file.writeAsString('abcde_fghij_klmno_pqrst_uvwxy_z',
        mode: FileMode.append);
  }

  Future<void> readFile() async {
    String readData = await file.readAsString();
  }
}
