
import 'dart:convert';

import 'package:demogetx/ProductModual/Modals/GetProfilePicResponceModal.dart';
import 'package:http/http.dart' as http;

import 'apis.dart';
class UploadProfilePicApi{

  GetProfilePicResponceModal getProfilePicResponceModal;

  var stringJson;
  Future<GetProfilePicResponceModal> getProfilePic(String token,customerMobileNo,String customerProfilePicStr) async {
    var urlToken ={'Token' : token,'Content-Type': 'application/json'};
    var map ={"CustomerMobileNo":customerMobileNo,"CustomerProfilePicStr":customerProfilePicStr};
    try {
      var response = await http.post(baseURL +"ProfilePictureApi/UploadProfilePic",headers: urlToken ,body: jsonEncode(map));
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        stringJson = response.body;
        print(item);
        return getProfilePicResponceModalFromJson(stringJson);

      }
      else {
        print("else parts");

      }
    }
    catch(e){
      print(e.toString());

    }
    return getProfilePicResponceModalFromJson(stringJson);
  }
}