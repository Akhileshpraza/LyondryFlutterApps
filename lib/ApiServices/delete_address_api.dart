import 'dart:convert';
import 'package:demogetx/ProductModual/Modals/DeleteAddressResponceModal.dart';
import 'package:http/http.dart' as http;
import 'apis.dart';

class DeleteAddressApi {

  DeleteAddressResponceModal deleteAddressResponceModal;

  Future<DeleteAddressResponceModal> deleteAddressApi(int addressId,int customerAddressId ,String token,String mobileNo) async {
    try {
      var map = {"Token": token,"MobileNo":mobileNo};
      //print(" dataModel.toJson()   ${ dataModel.toJson()}");
      Map<String, dynamic> jsonData ={
        "AddressId": addressId.toString(),
        "AddressCustomerId":customerAddressId.toString()} ;
      final response = await http.post(Uri.parse(baseURL +"DeleteAddressApi/DeleteAddress"), body: jsonData, headers: map);
      print(response);
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        print(item);
        deleteAddressResponceModal= DeleteAddressResponceModal.fromJson(item);
      } else {
        print("else parts");

      }
    } catch (e) {
      print(e.toString());

    }
    return deleteAddressResponceModal;
  }

}