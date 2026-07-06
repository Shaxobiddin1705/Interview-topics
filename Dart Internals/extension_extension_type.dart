/// Extensions vs Extension Types

/// Extension

/*
* Extension bu mavjud bo'lgan tipga yangi xususiyatlar qo'shish imkonini beradi, 
* va bu xususiyatlar faqat shu tipga tegishli bo'ladi. Masalan, String tipiga yangi metodlar qo'shish mumkin.
* Lekin mavjud tipning xususiyatlarini o'zgartira olmaydi va yangi tip yaratmaydi.
*/

extension StringExtensions on String {
  bool get isEmail => contains("@");

  String capitalize() {
    return this[0].toUpperCase() + substring(1);
  }
}

/*
void main() {
  print("john".capitalize());

  print("abc@gmail.com".isEmail);
}
*/

/// Extension Types

/*
* Extension types yangi tip yaratish imkonini beradi, va bu tipga yangi xususiyatlar qo'shish mumkin.
* Extension type mavjud tip uchun wrapper vazifasini bajaradi va unga yangi metodlar qo'shish imkonini beradi.
* Masalan, Email tipini yaratib, unga domain() metodini qo'shish mumkin. 
* Bu yerda yangi Email tipini run time vaqtida shunchaki String deb hisoblaydi. Kompilatsiya vaqtida
* esa static tip sifatida ishlaydi. Bu esa type safetyni ta'minlaydi.
*/

extension type Email(String value) {
  String domain() {
    return value.split("@")[1];
  }
}

void main() {
  Email email = Email("john@gmail.com");

  print(email.domain());
}
