import 'package:demogetx/ProductModual/Modals/LoginResponceModal.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {

  Future<bool> saveUser(Data data) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt("customerId", data.customerId);
    prefs.setString("customerName", data.customerName);
    prefs.setString("customerEmailId", data.customerEmailId);
    prefs.setString("customerMobileNo", data.customerMobileNo);
    prefs.setBool("logged", true);

    return prefs.commit();
  }


  Future<Data> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    int customerId = prefs.getInt("customerId");
    String customerName = prefs.getString("customerName");
    String customerMobileNo = prefs.getString("customerEmailId");
    String customerEmailId = prefs.getString("customerMobileNo");

    return Data(
      customerId: customerId,
      customerName: customerName,
      customerMobileNo: customerMobileNo,
      customerEmailId: customerEmailId, entryStatus: '',
    );
  }

  void removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove("customerId");
    prefs.remove("customerName");
    prefs.remove("customerMobileNo");
    prefs.remove("customerEmailId");

  }

  Future<String> getToken(args) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    return token;
  }

}

enum gerAuth{
  Arthtoken,
}