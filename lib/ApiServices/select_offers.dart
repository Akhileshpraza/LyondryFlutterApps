import 'dart:convert';
import 'package:demogetx/ApiServices/apis.dart';
import 'package:demogetx/ProductModual/Modals/GetSelectOffersResponceModal.dart';
import 'package:http/http.dart' as http;
class SelectOffersApi{

  GetSelectOffersResponceModal getSelectOffersResponceModal;

  var jsonString;
  Future<GetSelectOffersResponceModal> bannerSlider( String token,String mobileNo) async {
    try {
      var urlToken ={"Token" : token,"MobileNo": mobileNo};
      final response = await http.get(baseURL +"OfferApi/SelectOffers", headers: urlToken);
      print(response);
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        print(item);
        jsonString =response.body;
        return getSelectOffersResponceModalFromJson(jsonString);

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
    return getSelectOffersResponceModalFromJson(jsonString);
  }

}