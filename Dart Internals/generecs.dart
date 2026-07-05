/// Generecs

/*
* Generic class, method va variable larni xar xil data type lar bilan ishlash imkonini beradi.
* Har doim bir xil narsani qayta qayta yozish o'rniga, generic larni ishlatish orqali kodni qayta ishlatish mumkin bo'ladi.

class Box<T> {
  T value;

  Box(this.value);
}

final Box<int> intBox = Box(10);
final Box<String> stringBox = Box("Hello");


* Bu yerda type berilgandan keyin o'zgaruvchi boshqa type ga o'zgartirib bo'lmaydi. 
* Agar bu yerda dynamic ishlatganimizda edi o'zgaruvchining type ni istalgan vaqtda o'zgartirib bo'lardi.

class Box {
  dynamic value;
}

final box = Box();

box.value = 10;
box.value = "Hello";
box.value = User();
*/

/// Multiple Generic types dan ham foydalanish mumkin.

class Pair<K, V> {
  final K key;
  final V value;

  Pair(this.key, this.value);

  @override
  String toString() {
    return 'key: $key, data type: ${key.runtimeType}, '
        'value: $value, data type: ${value.runtimeType}';
  }
}

void main() {
  final pair1 = Pair<int, String>(1, "Apple");
  print(pair1);

  final pair2 = Pair<String, double>("Pi", 3.14);
  print(pair2);

  print(first<int>([1, 2, 3]));
  print(first<String>(["A", "B"]));
}

T first<T>(List<T> items) {
  return items.first;
}

/*
* Generic ni ApiResponse olish uchun ham ishlatsa bo'ladi.

class ApiResponse<T> {
  final T data;

  ApiResponse(this.data);
}

ApiResponse<User>

ApiResponse<List<User>>

ApiResponse<Product>
*/

/// Generic extentions:

/*
extension FirstOrNull<T> on List<T> {
  T? firstOrNull() {
    if (isEmpty) return null;

    return first;
  }
}
*/
