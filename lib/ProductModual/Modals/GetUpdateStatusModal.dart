import 'dart:convert';

GetUpdateStatusModal getUpdateStatusModalFromJson(String str) => GetUpdateStatusModal.fromJson(json.decode(str));

String getUpdateStatusModalToJson(GetUpdateStatusModal data) => json.encode(data.toJson());

class GetUpdateStatusModal {
  GetUpdateStatusModal({
    this.success,
    this.error,
    this.errorMessage,
  });

  bool success;
  bool error;
  String errorMessage;

  factory GetUpdateStatusModal.fromJson(Map<String, dynamic> json) => GetUpdateStatusModal(
    success: json["success"],
    error: json["Error"],
    errorMessage: json["ErrorMessage"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "Error": error,
    "ErrorMessage": errorMessage,
  };
}
