import 'package:butler_diary/model/diary.dart';
import 'package:butler_diary/model/profile.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import './screen/profile_edit_scr.dart';
import './screen/living_room.dart';
import './screen/diary_scr.dart';
import './screen/diary_edit_scr.dart';
import './screen/profile_scr.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await hiveBox();
  runApp(MyApp());
}

Future<void> hiveBox() async {
  final appDocDir = await path_provider.getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocDir.path);
  Hive.registerAdapter(DiaryAdapter());
  Hive.registerAdapter(ProfileAdapter());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Butler's Diary",
      theme: ThemeData(
        snackBarTheme: SnackBarThemeData(
          contentTextStyle: TextStyle(fontFamily: "GamjaFlower"),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              Color(0xff454442),
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            primary: Color(0xff454442),
          ),
        ),
        fontFamily: 'GamjaFlower',
        primaryColor: Color(0xffE5E4DB),
        scaffoldBackgroundColor: Color(0xffE5E4DB),
        textTheme: const TextTheme(
          bodyText2: TextStyle(
            color: Color(0xff454442),
            fontSize: 16,
          ),
        ),
      ),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case "/":
            return MaterialPageRoute(builder: (context) => LivingRoom());
          case "/diary":
            final args = settings.arguments as String;
            return MaterialPageRoute(
              builder: (context) => DiaryScr(args),
            );
          case "/diary_edit":
            final args = settings.arguments as Map<String, dynamic>;
            return MaterialPageRoute(
              builder: (context) => DiaryEditScr(args),
              fullscreenDialog: true,
            );
          case "/profile":
            final args = settings.arguments as Profile;
            return MaterialPageRoute(
              builder: (context) => ProfileScr(args),
              fullscreenDialog: true,
            );
          case "/profile_edit":
            return MaterialPageRoute(
              builder: (context) => ProfileEditScr(),
              fullscreenDialog: true,
            );
        }
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          '집사 다이어리',
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Text('냥님1'),
            Text('냥님2'),
            Text('냥님3'),
            Text('이용 안내'),
            Text('개발자 메시지'),
          ],
        ),
      ),
      body: Center(
        child: Text('Text'),
      ),
    );
  }
}
