//Liste elemanları için kullanılacak olan taslak
class Transaction {
  String id;
  String title;
  double amount;
  //Zaman kullanımı için kullanılan ön tanımlı sınıf
  DateTime date;

  Transaction(
      {required this.amount,
      required this.date,
      required this.id,
      required this.title});
}
