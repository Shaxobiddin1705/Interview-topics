/// Constructors

/*
* Konstruktirlar asosan class ichidagi o'zgaruvchilarga qiymatni obyekt yaratilganda 
* berish uchun ishlatiladi, va ularning ham turlari ko'p:
* 1. Default
* 2. Generative
* 3. Named
* 4. Constant
* 5. Factory
* 6. Redirecting
* 7. Private
*/

/// Default Constructor

/*
* Bu constructor agar dasturchi tomonidan berilmasa dart tili o'zi yaratadigan constructor hisoblanadi.
*/

/// Generative Constructor

/*
* Generative Constructor bu oddiy contructor bo'lib har safar yangi object yaratadi.

  class User {
    final String name;

    User(this.name);
  }
*/

/// Named Constructor

class User {
  final int age;
  final String name;

  const User(this.age, this.name);

  User.admin(this.age) : this.name = "Admin";

  User.friend(int age2, String name2) : this.age = age2, this.name = name2;
}

/// Optional Parameters

class Person {
  final String name;
  final String surname;

  Person(this.name, [this.surname = "New User"]);
}

/// Initializer List

class Rectangle {
  final int area;

  Rectangle(int width, int height) : area = width * height;
}

/// Redirecting Constructor

class Employee {
  final String name;
  final int age;

  Employee(this.name, this.age);

  Employee.guest() : this("Guest", 0);
}

/// Constant Constructor

class Point {
  final int x;
  final int y;

  const Point(this.x, this.y);
}
