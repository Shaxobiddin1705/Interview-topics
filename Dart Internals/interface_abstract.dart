/// Interfaces
/// implements vs extends
/*
* Dart dasturlash tilida interface yo'q lekin har qanday class uning vazifasini bajara oladi.
* agar biz biror bir classdan implement olsak biz ota classning hamma funksiyalarini 
* override qilib ishlatishimiz kerak bo'ladi. Extend qilsak biz override qilishimiz shart
* bo'lmay qoladi. Shunchali ota classning funksiya va qiymatlarini ishlatishimiz mumkun bo'ladi.

* Implement qilishda faqat private fields va functions lar bundan mustasno.
*/

class Animal {
  void eat() {
    print("Animal can eat");
  }
}

class Cat implements Animal {
  @override
  void eat() {
    print('Cat can eat');
  }
}

class Dog extends Animal {}

void main() {
  Cat().eat();
  Dog().eat();
}

/// Abstract

abstract class UserRepositiry {
  Future<int> getUserId();

  Future<String> getUserName() async {
    return 'Jone';
  }
}

/*
* Agar abstract classni extends qilib voris olinsa biz faqat abstract method va abstract field 
* larni override qilishga majbur bo'lamiz, qolganlari ixtiyoriy bo'ladi.

* Agar implements orqali voris olinsa biz hamma method va field larni override qilishimiz shart bo'ladi.
*/

class EmployeeRepositrory extends UserRepositiry {
  @override
  Future<int> getUserId() {
    return Future.value(1234);
  }
}

class TeacherRepository implements UserRepositiry {
  @override
  Future<int> getUserId() {
    return Future.value(5678);
  }

  @override
  Future<String> getUserName() {
    return Future.value("Shaxobiddin");
  }
}
