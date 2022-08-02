import 'package:flutter/material.dart';
import "package:collection/collection.dart";
import 'package:flutter/services.dart';
import 'package:flutter_libserialport/flutter_libserialport.dart';

void main() async {
  // await DartVLC.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        //do this globally
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
              systemNavigationBarColor:
                  Colors.white, // android bottom system nav bar
              systemNavigationBarIconBrightness: Brightness
                  .dark, // android bottom system nav bar icon color either light or dark
              statusBarColor: Colors.white, // android top status bar
              statusBarIconBrightness:
                  Brightness.dark, // android top status bar icon color
              statusBarBrightness: Brightness.light // ios top status bar

              ),
        ),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

extension IntToString on int {
  String toHex() => '0x${toRadixString(16)}';
  String toPadded([int width = 3]) => toString().padLeft(width, '0');
  String toTransport() {
    switch (this) {
      case SerialPortTransport.usb:
        return 'USB';
      case SerialPortTransport.bluetooth:
        return 'Bluetooth';
      case SerialPortTransport.native:
        return 'Native';
      default:
        return 'Unknown';
    }
  }
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int _counter = 0;
  late Animation<Color?> animation;
  late AnimationController aniCtrl;
  // final player = Player(id: 69420);
  var data = [
    {"title": 'Avengers', "release_date": '10/01/2019'},
    {"title": 'Creed', "release_date": '10/01/2019'},
    {"title": 'Jumanji', "release_date": '30/10/2019'},
  ];

  var availablePorts = [];

  void initPorts() {
    setState(() => availablePorts = SerialPort.availablePorts);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPorts();
    aniCtrl =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    animation =
        ColorTween(begin: Colors.amber, end: Colors.red).animate(aniCtrl);
    // ..addListener(() {
    //   setState(() {
    //     // _counter++;
    //   });
    // });
    // aniCtrl.forward();
    aniCtrl.repeat();

    // player.open(
    //     Playlist(
    //       medias: [
    //         Media.asset('assets/smallest_cat.mp4'),
    //       ],
    //       playlistMode: PlaylistMode.loop,
    //     ),
    //     autoStart: true);

// useful collection package!
// https://pub.dev/documentation/collection/latest/collection/collection-library.html
    var newMap = groupBy(data, (Map obj) => obj['release_date']);
    print(newMap);

    var queue = PriorityQueue<Map>(
      (a, b) => a['title'].compareTo(b['title']),
    );
    queue.addAll(data);
    print(queue);
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    //or one by one upon pages
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //     systemNavigationBarColor: Colors.white, // android bottom system nav bar
    //     systemNavigationBarIconBrightness: Brightness
    //         .dark, // android bottom system nav bar icon color either light or dark
    //     statusBarColor: Colors.white, // android top status bar
    //     statusBarIconBrightness:
    //         Brightness.dark, // android top status bar icon color
    //     statusBarBrightness: Brightness.light // ios top status bar

    //     ));
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Scrollbar(
        child: ListView(
          children: [
            for (final address in availablePorts)
              Builder(builder: (context) {
                final port = SerialPort(address);
                return ExpansionTile(
                  title: Text(address),
                  children: [
                    CardListTile('Description', port.description),
                    CardListTile('Transport', port.transport.toTransport()),
                    CardListTile('USB Bus', port.busNumber?.toPadded()),
                    CardListTile('USB Device', port.deviceNumber?.toPadded()),
                    CardListTile('Vendor ID', port.vendorId?.toHex()),
                    CardListTile('Product ID', port.productId?.toHex()),
                    CardListTile('Manufacturer', port.manufacturer),
                    CardListTile('Product Name', port.productName),
                    CardListTile('Serial Number', port.serialNumber),
                    CardListTile('MAC Address', port.macAddress),
                  ],
                );
              }),
          ],
        ),
      ),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[

      //       // Video(
      //       //   player: player,
      //       //   height: 500.0,
      //       //   width: 500.0,
      //       //   scale: 1.0, // default
      //       //   showControls: false, // default
      //       // ),
      //       Text('flutter create --org com.donna6355 app_name'),
      //       Text('flutter config --enable-macos-desktop'),
      //       Text('flutter config --no-enable-macos-desktop'),
      //       Text('flutter create --platforms=web'),
      //       Text('flutter run -d chrome'),
      //       Text(
      //           'rm -r ios, rm -r web, rm -r android'), //to remove unneccessary directory
      //       LinearProgressIndicator(
      //         backgroundColor: Colors.orange,
      //         // color: Colors.red,
      //         // valueColor: AlwaysStoppedAnimation(Colors.red),
      //         valueColor: animation,
      //       ),
      //       const Text(
      //         'You have pushed the button this many times:',
      //       ),
      //       Text(
      //         '$_counter',
      //         style: Theme.of(context).textTheme.headline4,
      //       ),
      //       _counter % 2 == 0 ? const SizedBox.shrink() : const Text('ODD NUM'),
      //     ],
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Counter {
  int value = 0;

  void increment() => value++;

  void decrement() => value--;
}

class CardListTile extends StatelessWidget {
  final String name;
  final String? value;

  CardListTile(this.name, this.value);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(value ?? 'N/A'),
        subtitle: Text(name),
      ),
    );
  }
}
