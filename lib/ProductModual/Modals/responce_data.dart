
class Data{

  Data({
  this.customerEmailId,
  this.customerName,
  this.customerGender,
  this.customerDob,
  });

  String customerEmailId;
  String customerName;
  String customerGender;
  DateTime customerDob;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
  customerEmailId: json["CustomerEmailId"],
  customerName: json["CustomerName"],
  customerGender: json["CustomerGender"],
  customerDob: DateTime.parse(json["CustomerDOB"]),
  );

  Map<String, dynamic> toJson() => {
  "CustomerEmailId": customerEmailId,
  "CustomerName": customerName,
  "CustomerGender": customerGender,
  "CustomerDOB": customerDob.toIso8601String(),
  };
  }
