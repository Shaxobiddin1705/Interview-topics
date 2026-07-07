/// Sealed class

/*
* Bu class dart3 dan keyin chiqarilgan bo'lib asosan ota class sifatida ishlatiladi.
* Lekin bu classni o'zi turgan file(library) dan tashqarida extend qilish imkonini bermaydi.
*/

/*
* Abtract va Sealed ning farqi abtract class ni xoxlagan joyda extnd qilib ishlatish mumkun,
* lekin sealed ni faqat o'sha library ichida ishlatish mumkun, va interface sifatida ham ishlatib bo'lmaydi
*/

sealed class ApiResult {
  const ApiResult();
}

class Success extends ApiResult {
  final String data;

  const Success(this.data);
}

class Error extends ApiResult {
  final String message;

  const Error(this.message);
}

void main() {
  String handeResult(ApiResult result) {
    return switch (result) {
      Success(:final data) => "Data is $data",
      Error(:final message) => "Error is $message",
    };
  }

  print(handeResult(Success("received ....")));
}
