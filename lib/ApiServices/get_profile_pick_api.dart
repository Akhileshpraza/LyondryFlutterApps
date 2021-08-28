
import 'dart:convert';

import 'package:demogetx/ProductModual/Modals/GetProfilePicResponceModal.dart';
import 'package:http/http.dart' as http;

import 'apis.dart';

class GetProfilePickApi{

  GetProfilePicResponceModal getProfilePicResponceModal;

  var jsonString;
  Future<GetProfilePicResponceModal> getUserProfilePick( String token,String mobileNo) async {
    try {
      var urlToken ={"Token" : token,"MobileNo": mobileNo};
      final response = await http.get(baseURL +"ProfilePictureApi/GetProfilePic", headers: urlToken);
      print(response);
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        print(item);
        jsonString =response.body;
        return getProfilePicResponceModalFromJson(jsonString);

      } else {
        print("else parts");
        //logger.d('else part');
        //logger.d(getCustomerProfile_responce_modal.data);
        return null;
      }
    } catch (e) {
      print(e.toString());
      //logger.d(e.toString());
    }
    //notifyListeners();
    return getProfilePicResponceModalFromJson(jsonString);
  }

}