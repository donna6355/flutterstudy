// https://medium.com/flutter-community/s-o-l-i-d-the-first-5-principles-of-object-oriented-design-with-dart-f31d62135b7e

class Circle {
  double radius;
  Circle(this.radius);
}

class Square {
  int length;
  Square(this.length);
}

class AreaCalculator {
  List<dynamic> shapes;
  AreaCalculator(this.shapes);

  dynamic sum() {}

  dynamic output() {
    return "The output is ${sum()}";
  }
}
