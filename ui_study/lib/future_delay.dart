import 'package:http/http.dart' as http;

class Api {
  final String _url = 'https://www.isaac.isaac';
  Future<List> fetchSth() async {
    http.Response one = await http.get(Uri.parse(_url));
    http.Response two = await http.get(Uri.parse(_url));
    http.Response three = await http.get(Uri.parse(_url));

    return [one, two, three];
  }

  Future<List> fasterFetchSth() async {
    Future<dynamic> one = http.get(Uri.parse(_url));
    Future<dynamic> two = http.get(Uri.parse(_url));
    Future<dynamic> three = http.get(Uri.parse(_url));

    return Future.wait([one, two, three]);
  }
}
