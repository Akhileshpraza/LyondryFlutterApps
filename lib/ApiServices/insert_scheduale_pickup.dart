
import 'dart:convert';

import 'package:demogetx/ProductModual/Modals/InsertPickupResponceModal.dart';
import 'package:http/http.dart' as http;

import 'apis.dart';
class InsertPickupApi{

  InsertPickupResponceModal insertPickupResponceModal;

  Future<InsertPickupResponceModal> insertPickup(
      int pickupRequestCustomerId,
      int pickupRequestTimeSlotId,
      int pickupRequestServiceId,
      int pickupRequestStoreId,
      int pickupRequestAddressId,
      int pickupRequestStatusId,
      String pickupRequestServiceType,
      String token,
      String mobileNo) async {
    print("insertPickup     call response parts }");


    try {
      var urlToken = {"Token": token,"MobileNo": mobileNo};

      Map<String, dynamic> map = { "PickupRequestCustomerId": pickupRequestCustomerId.toString(),
                  "PickupRequestTimeSlotId": pickupRequestTimeSlotId.toString(),
                  "PickupRequestServiceId": pickupRequestServiceId.toString(),
                  "PickupRequestStoreId": pickupRequestStoreId.toString(),
                  "PickupRequestAddressId": pickupRequestAddressId.toString(),
                  "PickupRequestStatusId": pickupRequestStatusId.toString(),
                  "PickupRequestServiceType": pickupRequestServiceType.toString()};

      final response = await http.post(Uri.parse(baseURL +"PickupRequestApi/InsertPickup"), body: map, headers: urlToken);

      print("response parts  ${response.body}");
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        insertPickupResponceModal = InsertPickupResponceModal.fromJson(item);
        print(insertPickupResponceModal.toString());
        //logger.d(response.body);

      } else {
        print("else parts");

      }
    } catch (e) {
      print(e.toString());

    }

    return insertPickupResponceModal;
  }


}