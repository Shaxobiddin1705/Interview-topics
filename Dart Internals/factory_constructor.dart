/// Factory Constructor

/*
* Factory Constructor juda kerakli va foydali hisoblanadi. Bu contructordan foydalangan holda
* mavjud bo'lgan instance retun qilish mumkun, va yangi object yaratilishidan oldin biror amallar ham bajarish mumkun.
* Shuningdek caching uchun ham ishlatish mumkun.
*/

class Animal {
  final String name;

  Animal._(this.name);

  factory Animal(String name) {
    return Animal._(name);
  }
}

/// Singleton with factory constructor

// Har doim mavjud instance qaytaradi
class Database {
  static final Database _instance = Database._internal();

  Database._internal();

  factory Database() {
    return _instance;
  }
}

/// Caching with factory constructor

class User {
  final String name;

  User._(this.name);

  static final Map<String, User> _cache = {};

  factory User(String name) {
    return _cache.putIfAbsent(name, () => User._(name));
  }
}

/// Input Validation

class Temperature {
  final double celsius;

  Temperature._(this.celsius);

  factory Temperature(double value) {
    if (value < -273.15) {
      throw ArgumentError('Temperature below absolute zero');
    }

    return Temperature._(value);
  }
}

/// Return Different Subclasses

abstract class Shape {
  double area();

  factory Shape(String type) {
    switch (type) {
      case 'circle':
        return Circle(10);

      case 'square':
        return Square(10);

      default:
        throw Exception();
    }
  }
}

class Circle implements Shape {
  final double radius;

  Circle(this.radius);

  @override
  double area() => 3.14 * radius * radius;
}

class Square implements Shape {
  final double side;

  Square(this.side);

  @override
  double area() => side * side;
}

void main() {
  final circle = Shape("circle");
  final square = Shape("square");

  print(circle);
  print(square);

  final db1 = Database();
  final db2 = Database();
  print(identical(db1, db2));

  var u1 = User("John");
  var u2 = User("John");
  var u3 = User("Mike");

  print(identical(u1, u2));
  print(identical(u1, u3));
}
