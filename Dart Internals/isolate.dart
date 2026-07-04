import 'dart:convert';
import 'dart:isolate';

/// Dart single thread dasturlash tili hisob lanadi, lekin u bir nechta isolate
/// larni yaratish orqali parallel ishlashni qo'llab quvvatlaydi.

/*
* Har bir Isolateda alohida bor narsalar:
* 1. Stack memory
* 2. Heap memory
* 3. Event loop
* 4. Microtask Queue 
*/

/*
* Agar bizda og'ir funksiya bo'lsa uning uchun alohida isolate yaratishimiz kerak bo'ladi, 
* chunki u main isolate ni bloklaydi va dastur ishlashini sekinlashtiradi.

void main() {
  heavyCalculation(); // takes 5 seconds
  runApp(MyApp());
}

* Bu yerda heavyCalculation() funksiya main isolate ni bloklaydi va runApp() funksiya 5 soniya kutadi.
* Natijada dastur ishlashini sekinlashtiradi.
*/

/// Isolatelar o'rtasida faqat xabar(message) almashish mumkun, objectlarni almashish mumkun emas.

/// compute()
/*
* compute() kichik vazifalarni bajarish uchun ishlatiladi.
* Bu funksiya alohida isolate yaratadi va u yerda berilgan funksiya ishga tushadi.
* Natijani qaytaradi va o'zi yaratgan isolate ni yo'q qiladi.
* final result = await compute(parseJson, json);
*/

/// Isolate.spawn() og'ir vazifalar va background ishlar uchun ishlatiladi.

/*
* Alohida isolate yaratish ham tekin emas, chunki u uchun har safar alohida xotira ajratiladi.
* Har safar Heap, Stack memory va Event loop alohida yaratiladi. 
*/

void main() async {
  // final result = await compute(parseJson, json);
  // print('Natija: $result');

  final receivePort = ReceivePort();
  await Isolate.spawn(heavyCalculation, receivePort.sendPort);

  // Isolate dan kelgan natijani kutish
  final result2 = await receivePort.first;
  print('Natija 2: $result2');
}

void parseJson(String json) {
  // JSON ni parse qilish
  final data = jsonDecode(json);
  return data;
}

void heavyCalculation(SendPort sendPort) {
  // Og'ir hisoblash ishlarini bajarish
  int result = 0;
  for (int i = 0; i < 1000000000; i++) {
    result += i;
  }
  // Natijani main isolate ga yuborish
  sendPort.send(result);
}

/*
An isolate is an independent Dart runtime with its own heap, stack, event loop, microtask queue, 
and garbage collector. Unlike threads in languages such as Java, isolates do not share memory, 
which eliminates race conditions on shared objects. They communicate exclusively through message 
passing using ports. Isolates are best suited for CPU-bound work that would otherwise block the UI isolate, 
while asynchronous I/O should generally remain on the main isolate because it doesn't consume CPU while waiting.
*/
