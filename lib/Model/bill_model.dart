// bill_model.dart

class Bill {
  final String billName;
  final String billAmount;
  final String note;

  Bill({
    required this.billName,
    required this.billAmount,
    required this.note,
  });
  // @override
  // String toString() {
  //   return '$billName, $billAmount, $note';
  // }

  Map<String, dynamic> toJson() {
    return {
      'billName': billName,
      'billAmount': billAmount,
      'note': note,
    };
  }

  factory Bill.fromJson(Map<String, dynamic> json) {
    return Bill(
      billName: json['billName'],
      billAmount: json['billAmount'],
      note: json['note'],
    );
  }
}

