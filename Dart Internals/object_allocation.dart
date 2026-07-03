/// Object Allocation

/*
* Biz varibale elon qilganimizda agar u object bo'lsa variableda faqat manzil(reference) saqlanadi, object esa xotirada saqlanadi.
* Agar biz variablega yangi object beradigan bo'lsak, variable o'ziga xotiradan yangi reference oladi va eski object xotirada qoladi. 
* Agar eski objectga boshqa variable reference qilmasa, u keraksiz bo'lib qoladi va Garbage Collector (GC) uni yo'q qiladi.
*/

void main() {
  User user1 = User("John", 30);
  User user2 = user1; // Bu yerda faqat manzil(reference) nusxa ko'chiriladi,
  // natijada user1 va user2 bir xil manzilga ishora qiladi
}

class User {
  String name;
  int age;

  User(this.name, this.age);
}
