import 'package:flutter/material.dart';
import './views/views.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SafeArea(child: MyHomePage()),
      initialRoute: '/',
      routes: {
        '/sliver': (_) => const SliverTutorial(),
        '/imgpicker': (_) => const ImgPickerTutorial(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Tutorial'),
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: () => Navigator.pushNamed(context, '/sliver'),
            title: const Text('Sliver Tutorial'),
          ),
          ListTile(
            onTap: () => Navigator.pushNamed(context, '/imgpicker'),
            title: const Text('img picker tutorial'),
          )
        ],
      ),
    );
  }
}


// There's almost no difference.
// ListView is a SliverList. Same with GridView, which is a SliverGrid.
// They are doing exactly the same thing. The only difference between them is that SliverList is a sliver, not a widget. Which means it's used inside a ScrollView, usually CustomScrollView.
// ListView is nothing else but a biding of SliverList to transform it into a Widget to make it usable alongside other widgets such as Row/Container.

// flutter build apk --release --target-platform=android-arm64

// how to add googleservice info plist!!
// I'll also show this later in a lecture but in case you try running the app on an iOS simulator or device and you're getting an error right now, make sure you add "GoogleServices-Info.plist" to the iOS project by:
// 1) Opening XCode and opening the iOS folder as a project there
// 2) Adding the "GoogleServices-Info.plist" file via "Add Files" (right click on "Runner" in the left bar and choose "Add Files to 'Runner'") => Select the "GoogleServices-Info.plist" file

// https://gyutaehan.me/macesococoapodsseolchihegyul/
// damn cocoapod error