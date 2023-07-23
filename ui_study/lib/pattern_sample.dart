// //Using the var keyword, you can eliminate the need to declare types
// //var x = ("23", 0, 77.0, age: 20, name: "Doe");4cdx
// (String, int, double, {int age, String name}) x =
//      ("23", 0, 77.0, age: 20, name: "Doe");
//  print(x.$2);
//  print(x.name);

//  var json = { 'movie': ["Expendables", 2], 'cast':["Jane","Rambo","Chris"] };
// var title, length;
// List<dynamic> casts;
// //JSON Destructuring
// {'movie': [title, length],'cast':casts} = json;
// print("Movie $title is $length hours long with the cast: $casts");