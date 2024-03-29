import 'package:butler_diary/model/diary.dart';
import 'package:butler_diary/model/profile.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../provider/my-selected-date.dart';

import './screen/profile_edit_scr.dart';
import './screen/living_room.dart';
import './screen/diary_scr.dart';
import './screen/diary_edit_scr.dart';
import './screen/profile_scr.dart';
import './screen/dev_message.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await noti();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  final appDocDir = await path_provider.getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocDir.path);
  Hive.registerAdapter(DiaryAdapter());
  Hive.registerAdapter(ProfileAdapter());
  await Hive.openBox('myCats');
  MobileAds.instance.initialize();
  runApp(MyApp());
}

Future<void> noti(context) async {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
// initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('app_icon');
  final InitializationSettings initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);

  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (String? payload) async {
    Navigator.pushNamed(context, '/');
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    noti(context);

    return ChangeNotifierProvider(
      create: (_) => MySelectedDate(),
      child: MaterialApp(
        title: "집사 일기",
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: Color(0xffE5E4DB),
            iconTheme: IconThemeData(
              color: Color(0xff454442),
            ),
            titleTextStyle: TextStyle(
              color: Color(0xff454442),
              fontFamily: "GamjaFlower",
              fontSize: 20,
            ),
          ),
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
            case "/message":
              return MaterialPageRoute(
                builder: (context) => DevMessage(),
                fullscreenDialog: true,
              );
            case "/diary":
              final args = settings.arguments as Profile;
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
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('ko', 'KR'),
        ],
      ),
    );
  }
}


// to run dart devtools
// flutter run --observatory-port=9200
// http://127.0.0.1:9200/owzPdcFa1uk=/

// flutter v_2.2.3 when it made
// currently flutter v_2.5.3
// ThemeData changed as some features deprecated

//flutter pub update
//after flutter update you gotta do this to update dependeicies if out of date