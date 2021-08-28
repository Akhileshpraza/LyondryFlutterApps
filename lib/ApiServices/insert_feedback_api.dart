
import 'dart:convert';

import 'package:demogetx/ApiServices/apis.dart';
import 'package:demogetx/ProductModual/Modals/InsertFeedbackResponceModal.dart';
import 'package:http/http.dart' as http;
class InsertFeedBackApi{

  InsertFeedbackResponceModal insertFeedbackResponceModal;

  Future<InsertFeedbackResponceModal> insertFeedBack(
      String token,
      String mobileNo,
      String feedbackDate,
      String feedbackInvoiceNo,
      String feedBackItems,
      String feedbackDescription,
      String feedbackImage

      ) async {
    try {
      var urlToken = {"Token": token,"MobileNo": mobileNo};

      var map = { "FeedbackDate": feedbackDate,
        "FeedbackInvoiceNo": feedbackInvoiceNo,
        "FeedBackItems": feedBackItems,
        "FeedbackDescription": feedbackDescription,
        "FeedbackImage": feedbackImage,
        };

      final response = await http.post(Uri.parse(baseURL +"FeedbackApi/InsertFeedback"), body: map, headers: urlToken);
      print("response parts  $response");
      print("response parts  ${response.body}");
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        insertFeedbackResponceModal = InsertFeedbackResponceModal.fromJson(item);
        print(insertFeedbackResponceModal.toString());
        //logger.d(response.body);

      } else {
        print("else parts");

      }
    } catch (e) {
      print(e.toString());

    }

    return insertFeedbackResponceModal;
  }
}