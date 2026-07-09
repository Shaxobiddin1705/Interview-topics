/// Private Constructor

/*
* Bu class dan faqat shu library ichida instance olish mumkun, bu library tashqarisida yangi 
* instance olishga qo'ymaydi.

* Private constructor ning asosiy maqsadi tashqaridan yangi instance yaratishni oldini olish.
* Bu narsa singleton class lar uchun qo'l keladi.
* Misol uchun Logger hamma joyda 1 ta instance ishlatiladi va har safat chaqirilganda yangi object 
* create bo'lishini oldini oladi va xotiradan hara safar joy ajratilmaydi.
*/

class PrivateConstructor {
  final String id;
  PrivateConstructor._(this.id);
}

void main() {
  final private = PrivateConstructor._("Id");
  print(private);
}

class Logger {
  Logger._();

  static final Logger _instance = Logger._();

  factory Logger() {
    return _instance;
  }
}

class Image {
  final String url;

  Image._(this.url);

  factory Image.network(String url) {
    return Image._(url);
  }

  factory Image.asset(String path) {
    return Image._(path);
  }
}
