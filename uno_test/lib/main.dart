import 'package:flutter/material.dart';
import './helper/serial_board_repo.dart';
import 'dart:typed_data';
import './helper/log_data.dart';
import './helper/dir_helper.dart';
import './helper/bill_repo.dart';
import './helper/coin_repo.dart';
import 'package:serial_port_win32/serial_port_win32.dart';

void main() async {
  await DirHelper.init();
  await LogController.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UNO TEST',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Stream<Uint8List>? _boardStream;
  String _lastRes = '';
  String _test = 'UNO PCB TEST\n';
  List<int> _res = [];

  @override
  void initState() {
    super.initState();
    openPort();
  }

  Future<void> openPort() async {
    final port = SerialPort("COM7");
    if (port.isOpened) port.close();
    port.openWithSettings(BaudRate: 38400);
    await Future.delayed(const Duration(seconds: 1));
    port.close();

    _boardStream = SerialBoardRepo.standbyBoard();
    _boardStream?.listen(handleBoardStream);
    SerialBoardRepo.startBoardCommunication();

    final billRes = BillRepo.init();
    setState(() {
      _test += '지폐 방출기 구동 ${billRes ? '성공' : '실패'}\n';
    });
    await Future.delayed(const Duration(seconds: 1));
    final coinRes = CoinRepo.init();
    setState(() {
      _test += '동전 방출기 구동 ${coinRes ? '성공' : '실패'}\n';
    });
  }

  void handleBoardStream(Uint8List data) {
    _res.addAll(data);
    if (_res.length < 17) return;
    final String converted = String.fromCharCodes(_res).trim();
    print(converted);
    final int cmd = _res[2];
    final int bagStatus = _res[3];

    if (converted.substring(2, 4) != _lastRes) {
      setState(() {
        _test += '${DateTime.now()}  ::  ${_res.toString()}\n';
        _test += '${DateTime.now()}  ::  $converted\n';
        _test += '${DateTime.now()}  ::  ${{
          'height': converted.substring(4, 7),
          'inletDoor': converted.substring(7, 8),
          'bagDoor': converted.substring(9, 10),
          'bagDetect': converted.substring(10, 11),
          'handDetect': converted.substring(11, 12),
          'fw': converted.substring(14, 15),
        }.toString()}\n';
      });
      LogController.writeLog(
        level: LogLevel.tcp,
        tag: LogTag.rcv,
        msg: data.toString(),
      );
      if (cmd == 0x31 || cmd > 0x40) {
        SerialBoardRepo.updatePhase(Phase.standby);
      } else if (bagStatus == 0x31) {
        SerialBoardRepo.updatePhase(Phase.camera);
      } else if (bagStatus == 0x32) {
        SerialBoardRepo.updatePhase(Phase.standby);
      } else if (bagStatus == 0x33) {
        SerialBoardRepo.updatePhase(Phase.standby);
      }
    }
    if (converted.substring(12, 14) != '00') {
      LogController.writeLog(
        level: LogLevel.tcp,
        tag: LogTag.err,
        msg: data.toString(),
      );
    }
    _lastRes = converted.substring(2, 4);
    _res = [];
  }

  @override
  void dispose() {
    SerialBoardRepo.terminate();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    SerialBoardRepo.updatePhase(Phase.standby);
                    setState(() {
                      _test +=
                          '${DateTime.now()}  ::  ${Phase.doorOpen.cmd.toString()}\n';
                    });
                  },
                  child: Text('스탠바이'),
                ),
                ElevatedButton(
                  onPressed: () {
                    SerialBoardRepo.updatePhase(Phase.doorOpen);
                    setState(() {
                      _test +=
                          '${DateTime.now()}  ::  ${Phase.doorOpen.cmd.toString()}\n';
                    });
                  },
                  child: Text('도어오픈'),
                ),
                ElevatedButton(
                  onPressed: () {
                    SerialBoardRepo.updatePhase(Phase.camera);
                    setState(() {
                      _test +=
                          '${DateTime.now()}  ::  ${Phase.camera.cmd.toString()}\n';
                    });
                  },
                  child: Text('카메라진행중'),
                ),
                ElevatedButton(
                  onPressed: () {
                    SerialBoardRepo.updatePhase(Phase.goodBag);
                    setState(() {
                      _test +=
                          '${DateTime.now()}  ::  ${Phase.goodBag.cmd.toString()}\n';
                    });
                  },
                  child: Text('장바구니정상'),
                ),
                ElevatedButton(
                  onPressed: () {
                    SerialBoardRepo.updatePhase(Phase.badBag);
                    setState(() {
                      _test +=
                          '${DateTime.now()}  ::  ${Phase.badBag.cmd.toString()}\n';
                    });
                  },
                  child: Text('장바구니비정상'),
                ),
                ElevatedButton(
                  onPressed: () {
                    SerialBoardRepo.updatePhase(Phase.standby);
                    setState(() {
                      _test +=
                          '${DateTime.now()}  ::  ${Phase.standby.cmd.toString()}\n';
                    });
                  },
                  child: Text('대기'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    SerialBoardRepo.updatePhase(Phase.inletOpen);
                    setState(() {
                      _test +=
                          '${DateTime.now()}  ::  ${Phase.inletOpen.cmd.toString()}\n';
                    });
                  },
                  child: Text('인렛 열기'),
                ),
                ElevatedButton(
                  onPressed: () {
                    SerialBoardRepo.updatePhase(Phase.inletClose);
                    setState(() {
                      _test +=
                          '${DateTime.now()}  ::  ${Phase.inletClose.cmd.toString()}\n';
                    });
                  },
                  child: Text('인렛 닫기'),
                ),
                ElevatedButton(
                  onPressed: () {
                    SerialBoardRepo.updatePhase(Phase.bagDown);
                    setState(() {
                      _test +=
                          '${DateTime.now()}  ::  ${Phase.bagDown.cmd.toString()}\n';
                    });
                  },
                  child: Text('장바구니 모터 다운'),
                ),
                ElevatedButton(
                  onPressed: () {
                    SerialBoardRepo.updatePhase(Phase.bagUp);
                    setState(() {
                      _test +=
                          '${DateTime.now()}  ::  ${Phase.bagUp.cmd.toString()}\n';
                    });
                  },
                  child: Text('장바구니 모터 업'),
                ),
                ElevatedButton(
                  onPressed: () {
                    SerialBoardRepo.updatePhase(Phase.ledOn);
                    setState(() {
                      _test +=
                          '${DateTime.now()}  ::  ${Phase.ledOn.cmd.toString()}\n';
                    });
                  },
                  child: Text('LED ON'),
                ),
                ElevatedButton(
                  onPressed: () {
                    SerialBoardRepo.updatePhase(Phase.ledOff);
                    setState(() {
                      _test +=
                          '${DateTime.now()}  ::  ${Phase.ledOff.cmd.toString()}\n';
                    });
                  },
                  child: Text('LED OFF'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      _test += '${DateTime.now()}  ::  동전 방출 1개 요청\n';
                    });
                    final res = await CoinRepo.dispenseNRes();
                    setState(() {
                      _test +=
                          '${DateTime.now()}  ::  동전 방출 1개 ${res == 1 ? '성공' : '실패'}\n';
                    });
                  },
                  child: Text('동전 방출 1개'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      _test += '${DateTime.now()}  ::  지폐 방출 1개 요청\n';
                    });
                    final res = await BillRepo.dispenseNRes(1);
                    setState(() {
                      _test +=
                          '${DateTime.now()}  ::  지폐 방출 1개 ${res == 1 ? '성공' : '실패'}\n';
                    });
                  },
                  child: Text('지폐 방출 1개'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      _test += '${DateTime.now()}  ::  지폐 방출 10개 요청\n';
                    });
                    final res = await BillRepo.dispenseNRes(10);
                    setState(() {
                      _test +=
                          '${DateTime.now()}  ::  지폐 방출 10개 ${res == 10 ? '성공' : '실패'}\n';
                    });
                  },
                  child: Text('지폐 방출 10개'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      _test += '${DateTime.now()}  ::  지폐 방출 30개 요청\n';
                    });
                    final res = await BillRepo.dispenseNRes(30);
                    setState(() {
                      _test +=
                          '${DateTime.now()}  ::  지폐 방출 30개 ${res == 30 ? '성공' : '실패'}\n';
                    });
                  },
                  child: Text('지폐 방출 30개'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              height: 400,
              width: double.infinity,
              color: Colors.black87,
              child: Padding(
                padding: const EdgeInsets.only(left: 50),
                child: ListView(children: [
                  Text(
                    _test,
                    style: TextStyle(color: Colors.white),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
