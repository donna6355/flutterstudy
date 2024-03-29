// https://medium.com/@manoelsrs/dart-extends-vs-implements-vs-with-b070f9637b36

class Vehicle {
  Vehicle(this.color);

  final String color;
  final String definition = 'Vehicle';
}

class Car extends Vehicle {
  Car(String color) : super(color);

  // @override
  // String get definition => 'Car ${super.definition}';
}

//  You use extends when you want to create a more specific version of a class.
class Hatch extends Car {
  Hatch(String color) : super(color);
}

//U use implements when you want to inherit only structure not all of their value as interface.
//U gotta override
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
  print(hatch.definition);
  // Output -> Car Vehicel
  print('Result: ${hatch is Car}');
  // Output -> Result: true

  final cars = Car('green');
  print(cars.definition);
  // Output -> Vehicle //possible to access parent class's value
  print(cars.color);
  // Output -> green

  final car = Car2('red');
  print('Result: definition: ${car.definition}');
  // Output -> Result: definition: red car
  print('Result: is Vehicle type: ${car is Vehicle}');
  // Output -> is Vehicle type: true
  print('Result: is Vehicle type: ${car is Car}');

  final bird = Bird();
  bird.fly();
  final duck = Duck();
  duck.fly();
  duck.swim();
}

// Mixin is a different type of structure, which can only be used with the keyword with and is used to include common code snippets, I'd say, reuse the code.

class Animal {}

// behaviors
abstract class Flyer {
  void fly() => print('I can fly!');
  void fall() => print('failed to fly and fall!!!');
}

abstract class Swimmer {
  void swim() => print('I can swim!');
}

//using implements... you cannot reuse the code ... in this case you gotta go with 'WITH'
// class Bird extends Animal implements Flyer {
//   @override
//   void fly() => print('I can fly!');
// }

// class Duck extends Animal implements Swimmer, Flyer {
//   @override
//   void fly() => print('I can fly!');

//   @override
//   void swim() => print('I can swim!');
// }

class Bird extends Animal with Flyer {}

class Duck extends Animal with Swimmer, Flyer {}
