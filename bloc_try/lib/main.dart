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
        appBarTheme: const AppBarTheme(
            systemOverlayStyle:
                const SystemUiOverlayStyle(statusBarColor: Colors.white)),
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

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: OrientationBuilder(
//         builder: (context, orientation) {
//           return ListView(
//             children: [
//               Text('Isaac은 사랑스러운 1년 10∗∗-∗∗개월 고양이∗∗'),
//               orientation == Orientation.portrait
//                   ? Column(
//                       children: [
//                         Flexible(
//                             child: Text('Isaac은 사랑스러운 1년 10∗∗-∗∗개월 고양이∗∗')),
//                         Flexible(
//                             child: Text('Isaac은 사랑스러운 1년 10∗∗-∗∗개월 고양이∗∗')),
//                       ],
//                     )
//                   : Row(
//                       children: [
//                         Flexible(
//                             child: Text('Isaac은 사랑스러운 1년 10∗∗-∗∗개월 고양이∗∗')),
//                         Flexible(
//                             child: Text('Isaac은 사랑스러운 1년 10∗∗-∗∗개월 고양이∗∗')),
//                       ],
//                     ),
//               ShaderMask(
//                 blendMode: BlendMode.srcATop,
//                 shaderCallback: (bounds) {
//                   return _shimmerGradient.createShader(bounds);
//                 },
//                 child: Container(
//                   width: 54,
//                   height: 54,
//                   decoration: const BoxDecoration(
//                     color: Colors.black,
//                     shape: BoxShape.circle,
//                   ),
//                   child: ClipOval(
//                     child: Image.network(
//                       'https://flutter'
//                       '.dev/docs/cookbook/img-files/effects/split-check/Avatar1.jpg',
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _shimmerController;

  @override
  void initState() {
    super.initState();

    _shimmerController = AnimationController.unbounded(vsync: this)
      ..repeat(min: -0.5, max: 1.5, period: const Duration(milliseconds: 1000));
  }

  @override
  void dispose() {
    _shimmerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var _shimmerGradient = LinearGradient(
      colors: const [
        Color(0xFFEBEBF4),
        Color(0xFFF4F4F4),
        Color(0xFFEBEBF4),
      ],
      stops: const [
        0.1,
        0.3,
        0.4,
      ],
      begin: const Alignment(-1.0, -0.3),
      end: const Alignment(1.0, 0.3),
      tileMode: TileMode.clamp,
      transform:
          _SlidingGradientTransform(slidePercent: _shimmerController.value),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Shimmer Trial')),
      body: ShaderMask(
        blendMode: BlendMode.srcATop,
        shaderCallback: (bounds) {
          return _shimmerGradient.createShader(bounds);
        },
        child: Column(children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(16),
              ),
              // child: ClipRRect(
              //   borderRadius: BorderRadius.circular(16),
              //   child: Image.network(
              //     'https://flutter'
              //     '.dev/docs/cookbook/img-files/effects/split-check/Food1.jpg',
              //     fit: BoxFit.cover,
              //   ),
              // ),
            ),
          ),
          const SizedBox(height: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 24,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: 250,
                height: 24,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}

class _SlidingGradientTransform extends GradientTransform {
  const _SlidingGradientTransform({
    required this.slidePercent,
  });

  final double slidePercent;

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(bounds.width * slidePercent, 0.0, 0.0);
  }
}
