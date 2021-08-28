

import 'dart:convert';

import 'package:demogetx/ProductModual/Modals/SelectServiceResponceModal.dart';
import 'package:http/http.dart' as http;

import 'apis.dart';

class SelectServicesApi{

  var stringJson;
  Future<SelectServiceResponceModal> getSelectServices(int serviceId) async {
    try {
      var response = await http.get(baseURL + "ServiceApi/SelectService?ServiceId=$serviceId");
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        stringJson = response.body;
        print(item);
        //selectStore_responce_modal = SelectStoreResponceModal.fromJson(item);
        return selectServiceResponceModalFromJson(stringJson);

      }
      else {
        print("else parts");

      }
    }
    catch(e){
      print(e.toString());

    }
    return selectServiceResponceModalFromJson(stringJson);
  }
}