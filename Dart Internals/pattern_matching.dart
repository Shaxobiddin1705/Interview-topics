/// Pattern matching

void main() {
  var user = ("Jone", 25);

  var (name, age) = user;

  print('Name: $name');
  print('Age: $age');

  /// Ignore values
  var (name2, _, age2) = ("Jone", "Doe", 25);
  print('Name: $name2');
  print('Age: $age2');

  /// Type Patterns

  var obj = "Hello, Dart!";
  if (obj case String str) {
    print('String value: $str');
  }

  var obj2 = 42;
  if (obj2 case String str) {
    print('obj2 value is String: $str');
  } else {
    print('obj2 value is ${obj2.runtimeType}: $obj2');
  }

  /// List Pattern
  var list = [1, 2, 3];

  switch (list) {
    case [1, 2, 3]:
      print("Matched");
  }

  /// Map pattern
  var json = {"name": "John", "age": 25};
  if (json case {"name": String name, "age": int age}) {
    print(name);
    print(age);
  }

  /// Record pattern
  var person = (personName: "John", personAge: 25);

  var (:personName, :personAge) = person;

  print(personName);

  /// Logical pattern
  var value = 10;

  switch (value) {
    case 1 || 2 || 3:
      print("Small");
  }

  if (value case >= 0 && <= 100) {
    print("Valid percentage");
  }

  switch (value) {
    case >= 90:
      print("A");

    case >= 80:
      print("B");

    case >= 70:
      print("C");
  }

  /// Guard clause
  final user2 = User(name, age);
  switch (user2) {
    case User(age: var age) when age >= 18:
      print("Adult");

    default:
      print("Minor");
  }

  /// Swap values
  var a = 10;
  var b = 20;

  (a, b) = (b, a);

  print(a);
  print(b);
}

class User {
  final String name;
  final int age;

  const User(this.name, this.age);
}
