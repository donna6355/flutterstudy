import 'dart:async';
import 'dart:typed_data';
import './serial_board.dart';
import './log_data.dart';

enum Phase {
  standby([0x02, 0x57, 0x30, 0x03, 0x66]),
  doorOpen([0x02, 0x57, 0x31, 0x03, 0x67]),
  camera([0x02, 0x57, 0x32, 0x03, 0x64]),
  goodBag([0x02, 0x57, 0x33, 0x03, 0x65]),
  badBag([0x02, 0x57, 0x34, 0x03, 0x62]),
  inletOpen([0x02, 0x57, 0x41, 0x03, 0x17]),
  inletClose([0x02, 0x57, 0x42, 0x03, 0x14]),
  bagDown([0x02, 0x57, 0x43, 0x03, 0x15]),
  bagUp([0x02, 0x57, 0x44, 0x03, 0x12]),
  ledOn([0x02, 0x57, 0x45, 0x03, 0x13]),
  ledOff([0x02, 0x57, 0x46, 0x03, 0x10]);

  final List<int> cmd;
  const Phase(this.cmd);
}

class SerialBoardRepo {
  SerialBoardRepo._();
  static Stream<Uint8List>? _boardStream;
  static Phase _phase = Phase.standby;
  static Phase? _nextPhase;
  static String _lastRes = '';

  static Timer _timer = Timer(const Duration(), () {});

  static Stream<Uint8List>? standbyBoard() {
    dynamic initDone = SerialBoard.init();
    if (initDone != true) {
      LogController.writeLog(
        level: LogLevel.pcb,
        tag: LogTag.err,
        msg: 'failed to init main board ${initDone.toString()}',
        writeFile: true,
      );
      return null;
    }
    _boardStream = SerialBoard.readBoardStream();
    if (_boardStream == null) {
      LogController.writeLog(
        level: LogLevel.pcb,
        tag: LogTag.err,
        msg: 'failed to open main board stream',
        writeFile: true,
      );
      return null;
    }
    // _boardStream!.listen(handleBoardStream);
    LogController.writeLog(
      level: LogLevel.pcb,
      tag: LogTag.rmk,
      msg: 'good to read main board',
      writeFile: true,
    );
    return _boardStream;
  }

  // static void handleBoardStream(Uint8List data) {
  //   final String converted = String.fromCharCodes(data).trim();
  //   final int cmd = data[2];
  //   final int bagStatus = data[3];
  //   print({
  //     'height': converted.substring(4, 7),
  //     'inletDoor': converted.substring(7, 8),
  //     'bagDoor': converted.substring(9, 10),
  //     'bagDetect': converted.substring(10, 11),
  //     'handDetect': converted.substring(11, 12),
  //     'fw': converted.substring(14, 15),
  //   });

  //   if (converted.substring(2, 4) != _lastRes) {
  //     LogController.writeLog(
  //       level: LogLevel.tcp,
  //       tag: LogTag.rcv,
  //       msg: data.toString(),
  //     );
  //     if (cmd == 1 || cmd > 64) updatePhase(Phase.standby);
  //     if (bagStatus == 1) {
  //       updatePhase(Phase.camera);
  //     }
  //     if (bagStatus == 2) {
  //       updatePhase(Phase.standby);
  //     }
  //     if (bagStatus == 3) {
  //       updatePhase(Phase.standby);
  //     }
  //   }
  //   if (converted.substring(12, 14) != '00') {
  //     LogController.writeLog(
  //       level: LogLevel.tcp,
  //       tag: LogTag.err,
  //       msg: data.toString(),
  //     );
  //   }
  //   _lastRes = converted.substring(2, 4);
  // }

  static void startBoardCommunication() {
    _timer = Timer.periodic(
      const Duration(milliseconds: 100),
      (_) {
        if (_nextPhase != null) {
          print('========== write this command : ${_nextPhase!.cmd}==========');
          SerialBoard.wirteBoard(_nextPhase!.cmd);
          _phase = _nextPhase!;
          LogController.writeLog(
            level: LogLevel.tcp,
            tag: LogTag.snd,
            msg: _nextPhase!.cmd.toString(),
            writeFile: true,
          );
          _nextPhase = null;
        } else {
          SerialBoard.wirteBoard(_phase.cmd);
        }
      },
    );
  }

  static void updatePhase(Phase next) {
    _nextPhase = next;
  }

  static void terminate() {
    _timer.cancel();
    SerialBoard.closeBoard();
  }
}

//pc => board
// [0x02, 0x57, 0x30, 0x03, 0x66]
// [STX,   W,   CMD,  ETX,   XOR]

//board => pc
// [0x02, 0x52, 0x30, 0x30, 0x30, 0x33, 0x35, 0x30, 0x30, 0x30, 0x30, 0x30, 0x30, 0x30, 0x31, 0x30, 0x00]
// [ STX,  R,   CMD, 장바구니,  거리  센서   cm,  도어, 모터리밋, 백도어, 백감지, 손감지, 에러  코드, 펌버전, ETX, XOR]