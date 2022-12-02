// https://medium.com/flutter-community/s-o-l-i-d-the-first-5-principles-of-object-oriented-design-with-dart-f31d62135b7e

import 'dart:math';

abstract class ShapeInterface {
  area();
}

class Circle implements ShapeInterface {
  double radius;
  Circle(this.radius);

//after open-closed
  @override
  num area() {
    return pow(radius, 2) * pi;
  }
}

class Square implements ShapeInterface {
  int length;
  Square(this.length);

//after open-closed
  @override
  num area() {
    return pow(length, 2);
  }
}

class AreaCalculator {
  List<dynamic> shapes;
  AreaCalculator(this.shapes);

  num sum() {
    //before open-closed
    // List<num> area = [];
    // for (var shape in shapes) {
    //   if (shape is Square) {
    //     area.add(pow(shape.length, 2));
    //   } else if (shape is Circle) {
    //     area.add(pow(shape.radius, 2) * pi);
    //   }
    // }
    // return area.reduce((x, y) => x + y);
    num total = 0;
    for (var shape in shapes) {
      if (shape is ShapeInterface) {
        total += shape.area();
        continue;
      }
      throw Exception('Shape Exception');
    }
    return total;
  }

  dynamic output() {
    return "The output is ${sum()}";
  }
}
