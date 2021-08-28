import 'dart:convert';

InsertFeedbackResponceModal insertFeedbackResponceModalFromJson(String str) => InsertFeedbackResponceModal.fromJson(json.decode(str));

String insertFeedbackResponceModalToJson(InsertFeedbackResponceModal data) => json.encode(data.toJson());

class InsertFeedbackResponceModal {
  InsertFeedbackResponceModal({
     this.success,
     this.data,
     this.error,
     this.errorMessage,
  });

  bool success;
  Data data;
  String error;
  String errorMessage;

  factory InsertFeedbackResponceModal.fromJson(Map<String, dynamic> json) => InsertFeedbackResponceModal(
    success: json["success"],
    data: Data.fromJson(json["data"]),
    error: json["Error"],
    errorMessage: json["ErrorMessage"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data.toJson(),
    "Error": error,
    "ErrorMessage": errorMessage,
  };
}

class Data {
  Data({
     this.feedbackId,
  });

  int feedbackId;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    feedbackId: json["FeedbackId"],
  );

  Map<String, dynamic> toJson() => {
    "FeedbackId": feedbackId,
  };
}
