import 'dart:io';

class LogController {
  final File file = File('sample/counter.txt');

  void writeFile() {
    file.writeAsString('abcde_fghij_klmno_pqrst_uvwxy_z',
        mode: FileMode.append);
  }
}
