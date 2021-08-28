// To parse this JSON data, do
//
//     final getSelectOffersResponceModal = getSelectOffersResponceModalFromJson(jsonString);

import 'dart:convert';

GetSelectOffersResponceModal getSelectOffersResponceModalFromJson(String str) => GetSelectOffersResponceModal.fromJson(json.decode(str));

String getSelectOffersResponceModalToJson(GetSelectOffersResponceModal data) => json.encode(data.toJson());

class GetSelectOffersResponceModal {
  GetSelectOffersResponceModal({
    this.success,
    this.offersList,
    this.error,
    this.errorMessage,
  });

  bool success;
  List<OffersList> offersList;
  bool error;
  String errorMessage;

  factory GetSelectOffersResponceModal.fromJson(Map<String, dynamic> json) => GetSelectOffersResponceModal(
    success: json["success"],
    offersList: List<OffersList>.from(json["offersList"].map((x) => OffersList.fromJson(x))),
    error: json["Error"],
    errorMessage: json["ErrorMessage"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "offersList": List<dynamic>.from(offersList.map((x) => x.toJson())),
    "Error": error,
    "ErrorMessage": errorMessage,
  };
}

class OffersList {
  OffersList({
    this.offerImage,
  });

  String offerImage;

  factory OffersList.fromJson(Map<String, dynamic> json) => OffersList(
    offerImage: json["OfferImage"],
  );

  Map<String, dynamic> toJson() => {
    "OfferImage": offerImage,
  };
}
