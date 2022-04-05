import 'package:flutter/material.dart';
import './views/views.dart';
import 'package:new_version/new_version.dart';

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
        '/imgcarousel': (_) => const ImgCarouselTutorial(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          const CircularProgressIndicator();
        }
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
              ),
              ListTile(
                onTap: () => Navigator.pushNamed(context, '/imgcarousel'),
                title: const Text('img carousel tutorial'),
              ),
            ],
          ),
        );
      },
      future: _fetch1(context),
    );
  }

  Future<void> _fetch1(BuildContext context) async {
    final newVersion = NewVersion(
      iOSId: 'com.google.Vespa',
      androidId: 'com.google.android.apps.cloudconsole',
    );

    bool simpleBehavior = 2 > 0;

    if (simpleBehavior) {
      basicStatusCheck(newVersion, context);
    } else {
      await advancedStatusCheck(newVersion, context);
    }
  }

  basicStatusCheck(NewVersion newVersion, BuildContext context) {
    newVersion.showAlertIfNecessary(context: context);
  }

  advancedStatusCheck(NewVersion newVersion, BuildContext context) async {
    final status = await newVersion.getVersionStatus();
    if (status != null) {
      debugPrint(status.releaseNotes);
      debugPrint(status.appStoreLink);
      debugPrint(status.localVersion);
      debugPrint(status.storeVersion);
      debugPrint(status.canUpdate.toString());
      newVersion.showUpdateDialog(
        context: context,
        versionStatus: status,
        dialogTitle: 'Custom Title',
        dialogText: 'Custom Text',
      );
    }
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

//TODO try git extensions

//android storage space running out 
//wipe data in vdm or go to "show advanced setting " and modify memory/storage