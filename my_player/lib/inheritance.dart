// https://medium.com/@manoelsrs/dart-extends-vs-implements-vs-with-b070f9637b36

class Vehicle {
  Vehicle(this.color);

  final String color;
  final String definition = 'Vehicle';
}

class Car extends Vehicle {
  Car(String color) : super(color);

  @override
  String get definition => 'Car ${super.definition}';
}

class Hatch extends Car {
  Hatch(String color) : super(color);
}

//  You use extends when you want to create a more specific version of a class.

class Car2 implements Vehicle {
  Car2(this.carColor);

  final String carColor;

  @override
  String get color => carColor;

  @override
  String get definition => '$carColor car';
}

main() {
  final hatch = Hatch('red');
  print('Result: ${hatch is Vehicle}');
  // Output -> Result: true

  final car = Car2('red');
  print('Result: definition: ${car.definition}');
  // Output -> Result: definition: red car
  print('Result: is Vehicle type: ${car is Vehicle}');
  // Output -> is Vehicle type: true
}
