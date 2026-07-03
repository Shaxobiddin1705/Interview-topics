/// Dartda memory 2 turga bo'linadi: 1. [Stack] memory 2. [Heap] memory

/*
* Stack memory: Bu memory turi o'zgaruvchilarni saqlash uchun ishlatiladi. 
* Stack memory tezkor va samarali ishlaydi, lekin uning hajmi cheklangan. 
* Stack memoryda saqlangan o'zgaruvchilar funksiya chaqirilganda yaratiladi 
* va funksiya tugagach avtomatik ravishda yo'q qilinadi.
*/

/*
* Heap memory: Bu memory turi obyektlarni saqlash uchun ishlatiladi. 
* Heap memory Stack memorydan kattaroq va dinamik hajmli.
* Heap memoryda saqlangan obyektlar funksiya chaqirilganda yaratiladi 
* va funksiya tugagach avtomatik ravishda yo'q qilinmaydi.
*/

void main() {
  /// Stack memoryga misol
  print('\n${"=" * 40} \nStack memoryga misol: \n${"=" * 40} \n');

  int number = 10; // Stack memoryda saqlanadi
  String name = "Dart"; // Stack memoryda saqlanadi

  print("Number eski qiymat: $number");
  print("Name eski qiymat: $name");

  number = 20; // Stack memoryda saqlangan o'zgaruvchi yangilanadi
  name = "Flutter"; // Stack memoryda saqlangan o'zgaruvchi yangilanadi

  print("Number yangi qiymat: $number");
  print("Name yangi qiymat: $name");

  /// Heap memoryga misol
  print('\n${"=" * 40} \nHeap memoryga misol: \n${"=" * 40} \n');

  List<int> numbers = [1, 2, 3, 4, 5]; // Heap memoryda saqlanadi

  // Bu yerda faqat manzil(reference) nusxa ko'chiriladi,
  // natijada numbers va numbers2 bir xil manzilga ishora qiladi
  List<int> numbers2 = numbers;

  print("Numbers initialized qiymat: $numbers");
  print("Numbers2 initialized qiymat: $numbers2");

  // Bir xil reference bo'lganligi uchun numbers va numbers2 ikkalasi ham o'zgaradi
  numbers2.add(6);

  print("Numbers add(6) dan keyingi qiymat: $numbers");
  print("Numbers2 add(6) dan keyingi qiymat: $numbers2");

  // numbers2 ga yangi object berilganlkigi uchun o'ziga xotiradan yangi reference oladi,
  //natijada numbers2 o'zgaradi lekin numbers o'zgarmaydi
  numbers2 = [6, 7, 8, 9, 10];

  print("Numbers final value: $numbers");
  print("Numbers2 final value: $numbers2");

  Person person1 = Person("John", 30);
  // Bu yerda faqat manzil(reference) nusxa ko'chiriladi,
  // natijada person1 va person2 bir xil manzilga ishora qiladi
  Person person2 = person1;

  print("Person1: $person1");
  print("Person2: $person2");

  // Bir xil reference bo'lganligi uchun person1 va person2 ikkalasi ham o'zgaradi
  person2.name = "Doe";

  print("Person1 final value: $person1");
  print("Person2 final value: $person2");
}

class Person {
  String _name;
  int _age;

  String get name => _name;
  set name(String name) {
    _name = name;
  }

  int get age => _age;
  set age(int age) {
    _age = age;
  }

  Person(this._name, this._age);

  @override
  String toString() {
    return 'Person(name: $_name, age: $_age)';
  }
}
