import 'package:get/get.dart';

class Localization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          'GREETING': 'Good Morning!',
          'LANGUAGE': 'English',
        },
        'ko': {
          'GREETING': '좋은 아침:)',
          'LANGUAGE': '한국어',
        }
      };
}
