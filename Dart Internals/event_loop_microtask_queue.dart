import 'dart:async';

/// Event loop

/*
* Event loop - bu asinxron vazifalarni bajarish uchun ishlatiladigan mexanizm.
* Event loop doimiy ravishda ishlaydi. Uning ishlash jarayoni quyidagicha:
* 1. Synchronous code
* 2. ALL Microtasks
* 3. ONE Event
* 4. Again all Microtasks
* 5. Next Event

* Event asosan Timer, Timer.periodic, Future(...), Future.delayed, IO, Network requests, User tap, 
* Platform channel callbacks va shunga o'xshash vazifalardan tashkil topadi.

* Agar biz Microtask yaratmoqchi bo'lsak: scheduleMicrotask(), Future.microtask(), async/await continuations
* dan foydalanishimiz mumkin. Microtasklar Event loop ning bir qismi bo'lib, ular Event dan oldin bajariladi.
*/

void main() {
  /*  

  print("A");

  Future(() {
    print("B");
  });

  print("C");

  * Natija:
  * A
  * C
  * B
*/

  /*
  print("A");

  scheduleMicrotask(() {
    print("B");
  });

  Future(() {
    print("C");
  });

  print("D");

  * Natija:
  * A
  * D
  * B
  * C
  */

  Future(() {
    print("Future 1");
  });

  scheduleMicrotask(() {
    print("Microtask 1");
  });

  Future(() {
    print("Future 2");
  });

  scheduleMicrotask(() {
    print("Microtask 2");
  });
}
