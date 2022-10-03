class Counter {
  int val = 0;
  int increment() => val++;
  int decrement() => val--;
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
}
