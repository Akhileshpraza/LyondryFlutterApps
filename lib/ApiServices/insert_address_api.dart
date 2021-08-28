import 'dart:convert';
import 'package:demogetx/ProductModual/Modals/InsertAddressResponceModal.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'apis.dart';


class InsertAddressApi{
  InsertAddressResponceModal insertAddressResponceModal;

  var logger =Logger();
  bool isCheked =false;
  void changeStatus(){
    isCheked = true;
  }

  Future<InsertAddressResponceModal> insertAddress(
        int customerId,
        String houseName,
        String addressStreet,
        String addressCity,
        String pinCode,
        String landMark,
        String locationLaLo,
        String addressType,
        String addressDefault,
        String addressActive,
       String entryStatus,
       String token,
       String mobileNo) async {
  //Future<InsertAddressResponceModal> insertAddress(InsertAddressBody dataModel,String token) async {
     try {
       var map = {'Token': token,'MobileNo':mobileNo,'Content-Type': 'application/json'};
       Map<String, dynamic> jsonData ={
           "AddressCustomerId":customerId.toString(),
           "AddressBuildingNoHouseName":houseName,
           "AddressStreet":addressStreet,
           "AddressCity":addressCity,
           "AddressPin":pinCode,
           "AddressLandmark":landMark,
           "AddressLocationLaLo":locationLaLo,
           "AddressType":addressType,
           "AddressDefault":addressDefault,
           "AddressActive":addressActive,
           "EntryStatus":entryStatus} ;


       final response = await http.post(baseURL +"AddressApi/InsertAddress",headers: map, body: jsonEncode(jsonData));
       //final response = await http.post(Uri.parse(baseURL + "AddressApi/InsertAddress"), body: dataModel.toJson(),headers: map);
      print("response parts  ${response.body}");
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        insertAddressResponceModal = InsertAddressResponceModal.fromJson(item);
        print(insertAddressResponceModal.toString());

      } else {
        print("else parts");
       // logger.d('else part');

      }
    } catch (e) {
      print(e.toString());

    }

    return insertAddressResponceModal;
  }

}


