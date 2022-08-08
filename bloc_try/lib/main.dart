import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //check system mode!
    var brightness = SchedulerBinding.instance.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

// with context. if you check the system mode before material app, it doesn't work as context is not completed
//      var brightness = MediaQuery.of(context).platformBrightness;
//  bool isDarkMode = brightness == Brightness.dark;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            systemOverlayStyle:
                SystemUiOverlayStyle(statusBarColor: Colors.white)),
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: OrientationBuilder(
        builder: (context, orientation) {
          return ListView(
            children: [
              Text('Isaac은 사랑스러운 1년 10∗∗-∗∗개월 고양이∗∗'),
              orientation == Orientation.portrait
                  ? Column(
                      children: [
                        Flexible(
                            child: Text('Isaac은 사랑스러운 1년 10∗∗-∗∗개월 고양이∗∗')),
                        Flexible(
                            child: Text('Isaac은 사랑스러운 1년 10∗∗-∗∗개월 고양이∗∗')),
                      ],
                    )
                  : Row(
                      children: [
                        Flexible(
                            child: Text('Isaac은 사랑스러운 1년 10∗∗-∗∗개월 고양이∗∗')),
                        Flexible(
                            child: Text('Isaac은 사랑스러운 1년 10∗∗-∗∗개월 고양이∗∗')),
                      ],
                    ),
              Baseline(
                baseline: 10,
                baselineType: TextBaseline.ideographic,
                child: Text('Isaac은 사랑스러운 1년 10개월 고양이∗∗'),
              ),
              Baseline(
                baseline: 100,
                baselineType: TextBaseline.ideographic,
                child: Text('Isaac은 사랑스러운 1년 10개월 고양이'),
              ),
            ],
          );
        },
      ),
    );
  }
}
