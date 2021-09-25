import 'dart:convert';
import 'package:http/http.dart' as http;

const GOOGLE_KEY = 'AIzaSyDlGjUkwzDes0HYlsKpgqtjHLawnEZ0c5s';

class LocationHelper {
  static String genLocPrevImg(
      {required double latitude, required double longitude}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:C%7C$latitude,$longitude&key=$GOOGLE_KEY';
  }

  static Future<String> getAddress(double lat, double lng) async {
    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$GOOGLE_KEY');
    final response = await http.get(url);
    print(json.decode(response.body));
    return json.decode(response.body)['results'][0]['formatted_address'];
  }
}
