/// Mixin

/*
* Mixin bu bir nechta classga inheritance qilmasdan turib qayta ishlatiladigan class larni ishlatish imkonini beradi.
* U orqali class ichidagi funksiyalarni ishlatish majburiyati bo'lmaydi. 
*/

/*
* Agar bitta class ga bir xil funksiyasi bor bir nechta mixin lar bo'lsa, 
* u holda o'ng tomondan oxirgi chaqirilgan mixin ishlaydi.

mixin A {
  void printName() {
    print("A");
  }
}

mixin B {
  void printName() {
    print("B");
  }
}

class Test with A, B {}

Test().printName();

*/

void main() {
  final apiService = ApiService();
  apiService.fetchData();
  apiService.sendData();
}

mixin Logger {
  String get tag;

  void log(String message) {
    print("$tag: $message");
  }
}

class ApiService with Logger {
  @override
  String get tag => "[Logger]";

  void fetchData() {
    log("Fetching data from API...");
  }

  void sendData() {
    log("Sending data to API...");
  }
}
