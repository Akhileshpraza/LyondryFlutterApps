import 'dart:convert';
import 'package:demogetx/ProductModual/Modals/UpdateAddressResponceModal.dart';
import 'package:http/http.dart' as http;
import 'apis.dart';

class UpdateAddressApi{

  UpdateAddressResponceModal updateAddressResponceModal;

  bool isCheked =false;
  void changeStatus(){
    isCheked = true;
  }

  Future<UpdateAddressResponceModal> updateAddress(
      int customerId,
      int addressId,
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
    try {
      var map = {'Token': token,'MobileNo': mobileNo,'Content-Type': 'application/json'};

      Map<String, dynamic> jsonData ={
        "AddressId": addressId.toString(),
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
      final response = await http.post(Uri.parse(baseURL + "UpdateAddressApi/UpdateAddress"),headers: map ,body: jsonEncode(jsonData));
      print(response);
      print("response parts  ${response.body}");
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        updateAddressResponceModal = UpdateAddressResponceModal.fromJson(item);
        print(updateAddressResponceModal.toString());
        //logger.d(response.body);

      } else {
        print("else parts");

      }
    } catch (e) {
      print(e.toString());

    }

    return updateAddressResponceModal;
  }
}