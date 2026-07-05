import 'dart:async';

/// Streams: [Single Subscription] and [Broadcast]

/*
* [Single subscription]: Bunda faqat 1 dona listener bo'ladi. Agar siz bir nechta 
* listener qo'shmoqchi bo'lsangiz xatolik beradi. 
* [Single subscription] stream cold stream hisoblanadi, chunki faqat listen qilingan vaqtda stream ishga tushadi.

final stream = Stream.fromIterable([1, 2, 3]);
stream.listen(print);
*/

/*
* [Broadcast]: Bunda bir nechta listener bo'lishi mumkin.
* [Broadcast] stream hot stream hisoblanadi, bunda stream mustaqil ravishda ishlaydi. 

final controller = StreamController<int>.broadcast();

controller.stream.listen(print);

controller.stream.listen((e) {
  print("Second $e");
});

controller.add(1);
*/

void main() {
  final stream = Stream.fromIterable([1, 2, 3]);
  stream.listen((e) {
    print("[Single subscription] listener: $e");
  });

  final controller = StreamController<int>.broadcast();

  controller.stream.listen((e) {
    print("[Broadcast] First listener: $e");
  });

  controller.stream.listen((e) {
    print("[Broadcast] Second listener: $e");
  });

  controller.add(1);
  controller.add(2);
}
