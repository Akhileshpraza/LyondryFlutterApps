import 'dart:async';
import 'dart:convert';
import 'package:demogetx/ApiServices/apis.dart';
import 'package:demogetx/ProductModual/Modals/SelectStoreResponceModal.dart';
import 'package:http/http.dart' as http;

class SelectStoreApi{


  bool isLoading = false;
  var jsonString;
  SelectStoreResponceModal selectStoreResponceModal;


  Future<SelectStoreResponceModal> getSelectStore(int storeId) async {
    try {

      final response = await http.get(baseURL +"StoreApi/SelectStore?StoreId=$storeId");
      print(response);
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        print(item);
        jsonString =response.body;
        return selectStoreResponceModalFromJson(jsonString);

      } else {
        print("else parts");

        return null;
      }
    } catch (e) {
      print(e.toString());

    }

    return selectStoreResponceModalFromJson(jsonString);
  }
}