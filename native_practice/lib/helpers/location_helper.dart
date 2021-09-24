const GOOGLE_KEY = 'AIzaSyBM25zXl6dZAWZhp-1jfwkrSdJKX5nB7GY';

class LocationHelper {
  static String genLocPrevImg(
      {required double latitude, required double longitude}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:C%7C$latitude,$longitude&key=$GOOGLE_KEY';
  }
}
