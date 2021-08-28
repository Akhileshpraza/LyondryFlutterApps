import 'dart:convert';
import 'package:demogetx/ApiServices/apis.dart';
import 'package:demogetx/ProductModual/Modals/UpdateCustomerResponceModal.dart';
import 'package:http/http.dart' as http;


class UpdateCustomerApi{

  UpdateCustomerResponceModal updateCustomerResponceModal;

  Future<UpdateCustomerResponceModal> updateCustomerProfile(
      String customerEmailId,
      String customerName,
      String customerGender,
      String customerDOB,
      String customerMobileNo,
      String token) async {
    try {

      var urlToken ={'Token':token,
        'Content-Type': 'application/json'};

      Map<String, dynamic> map = {
        "CustomerEmailId": customerEmailId,
        "CustomerName": customerName,
        "CustomerGender" : customerGender,
        "CustomerDOB" : customerDOB,
        "CustomerMobileNo" : customerMobileNo};

      final response = await http.post(Uri.parse(baseURL + "CustomerUpdateApi/UpdateCustomer"),headers:urlToken,body: jsonEncode(map));

      print("***response***************${response.statusCode}");
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        print(item);
        updateCustomerResponceModal = UpdateCustomerResponceModal.fromJson(item);
        print(updateCustomerResponceModal.toString());

      } else {
        print("else parts");
      }
    } catch (e) {
      print(e.toString());
    }

    return updateCustomerResponceModal;
  }


}