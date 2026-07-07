/// Records
/// Bu dart3 da yangi chiqarilgan bo'lib bir nechta qiymatlarni class yaratmasdan ishlatish mumkun

void main() {
  (String, int) user = ('John', 25);

  print(user.$1);
  print(user.$2);

  /// Named records
  ({String name, int age}) user2 = (name: 'John', age: 25);

  print(user2.name);
  print(user2.age);

  final person = (name: 'John', age: 25);

  final (:name, :age) = person;

  print(name);
  print(age);

  /// Mixed records
  (int, String, {bool isAdmin}) user3 = (1, 'John', isAdmin: true);

  print(user3.$1);
  print(user3.$2);
  print(user3.isAdmin);

  /// Return multiple values
  ///
  (User, String) login() {
    return (User(name: 'John'), 'ABC123');
  }

  final result = login();

  print(result.$1);
  print(result.$2);

  /// Records inside collection
  List<(String, int)> users = [('John', 20), ('Mike', 30)];

  for (final (name, age) in users) {
    print('$name is $age');
  }

  /// Function patterns
  void printUser((String, int) user) {
    print(user.$1);
  }

  printUser(users.first);

  /// TypeDef

  UserRecord getUser() {
    return (name: 'John', age: 25);
  }

  print(getUser());
}

/// Typedef
typedef UserRecord = ({String name, int age});

class User {
  final String? name;
  final int? age;

  const User({this.name, this.age});
}

class LoginResult {
  final User user;
  final String token;

  LoginResult(this.user, this.token);
}
