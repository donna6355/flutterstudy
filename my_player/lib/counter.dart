import 'package:http/http.dart' as http;

class Counter {
  int val = 0;
  String str() => val.intoTwoDigit();
  Test test = Test.complete;
  int increment() => val++;
  int decrement() => val--;

  Future<bool> fetchTest(http.Client client) async {
    final uri = Uri.parse('https://jsonplaceholder.typicode.com/albums/1');
    final response = await client.get(uri);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return true;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      return false;
    }
  }
}

//updated enum!

enum Test {
  stopped('Loading is stopped.'),

  loading('Loading is progressing.'),

  complete('Loading is complete.'),

  failed('Loading has failed.');

  final String description;
  const Test(this.description);
  bool isFinished() => this == failed || this == complete;

//get String from the enum
  @override
  String toString() => "The Loading is $name and $description";
}

extension Digit on int {
  String intoTwoDigit() => toString().padLeft(2, '0');
}
