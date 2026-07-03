/// [Garbage collection] (GC)

/*
* GC faqat xotiraning Heap qismida ishlaydi, chunki Stack memoryda saqlangan o'zgaruvchilar 
* funksiya chaqirilganda yaratiladi va funksiya tugagach avtomatik ravishda yo'q qilinadi.
*/

/*
* Dart dasturlash tilida garbage collection (GC) avtomatik ravishda xotira boshqaruvini amalga oshiradi.
* Dastur ishlash vaqtida xotirada saqlangan keraksiz (unreachable) deb hisoblangan 
* obyektlar va ma'lumotlar avtomatik ravishda yo'q qilinadi. GC dastur ishlash jarayonida malum bir vaqtda 
* ishga tushadi va xotirani tozalaydi. U har doim ham keraksiz bo'lgan obyektlarni darhol yo'q qilmaydi, 
* balki ularni aniqlash va yo'q qilish uchun ma'lum bir vaqt talab qiladi.
*/

/// Dart General Garbage Collection ni ishlatadi: 1. [Young Generation]  va 2. [Old Generation].

/*
* [Young Generation]: Bu yerda yangi yaratilgan obyektlar saqlanadi. 
* [Young Generation] tez-tez tozalanadi, chunki ko'pchilik obyektlar qisqa muddatli bo'ladi va tezda yo'q qilinadi.
* Examples: short-lived objects, temporary data structures, and local variables.
*/

/*
* [Old Generation]: Bu yerda uzoq muddatli obyektlar saqlanadi.
* [Old Generation] kamroq tozalanadi, chunki bu yerda saqlangan obyektlar uzoq muddatli bo'ladi va ko'p hollarda dastur ishlash davomida kerak bo'ladi.
* Examples: long-lived objects, global variables, and static data, singleton, repository, BLoC, cached data.
*/

void main() {
  // Bu yerda malumotlar Old Generation da saqladi, chunki bu static list
  Cache.items.add("Item 1");
  Cache.items.add("Item 2");
}

class Cache {
  static final items = <String>[];
}

/*
class MyPageState extends State<MyPage> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

* Agar bizning page yopilsa biz controller ni dispose qilmasak, u xotirada qoladi va GC uni yo'q qila olmaydi.
* Bu holat memory leak deb ataladi. Memory leak dastur ishlashini sekinlashtiradi va xotira to'lib qolishiga olib keladi. 
* Shuning uchun biz har doim kerak bo'lmagan obyektlarni dispose qilishimiz kerak.

* Bu holatga StreamController ni ham misol keltirishimiz mumkin. Agar biz StreamController ni dispose qilmasak, 
* uning reference xotirada qoladi va GC uni yo'q qila olmaydi. Natijada dastur ishlashini sekinlashtiradi 
* va xotira to'lib qolishiga olib keladi.
*/
