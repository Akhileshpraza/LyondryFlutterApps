

import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {

  Future<void> setCustomerData(int customerid,String name,String mobile,String email ,int customerId,int groupId,String status) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("customerId",customerid );
    prefs.setString("customerName", name);
    prefs.setString("customerMobileNo", mobile);
    prefs.setString("customerEmail", email);
    prefs.setInt("customerGroupId", groupId);
    prefs.setString("entryStatus", status);
  }

  static setcustomerName(String customerName) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("customerName", customerName);
  }
  /*set DeviceType value in SharedPreferences*/

  /*get DeviceType value form SharedPreferences*/
  static Future<String> getCustomerId(SharedPreferences prefs) async {
    //final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("customerId") ?? "";
  }
  static Future<String> getCus(SharedPreferences prefs) async {
    //final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("customerName") ?? "";
  }

  /*set appVersion value in SharedPreferences*/
  static setAppVersion(String appVersion) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("appVersion", appVersion);
  }
  /*get appVersion value form SharedPreferences*/
  static Future<String> getAppVersion() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString("appVersion") ?? "";
  }

  /*set DeviceId value in SharedPreferences*/
  static setDeviceId(String deviceId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("DeviceId", deviceId);
  }
  /*get DeviceId value form SharedPreferences*/
  static Future<String> getDeviceId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString("DeviceId") ?? "";
  }


  /*set deviceModel value in SharedPreferences*/
  static setDeviceModel(String deviceModel) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("deviceModel", deviceModel);
  }
  /*get deviceModel value form SharedPreferences*/
  static Future<String> getDeviceModel() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("deviceModel") ?? "";
  }

  /*set deviceBrand value in SharedPreferences*/
  static setDeviceBrand(String deviceBrand) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("deviceBrand", deviceBrand);
  }
  /*get deviceBrand value form SharedPreferences*/
  static Future<String> getDeviceBrand() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("deviceBrand") ?? "";
  }

  /*set refreshToken value in SharedPreferences*/
  static setRefreshToken(String refreshToken) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("refreshToken", refreshToken);
  }
  /*get refreshToken value form SharedPreferences*/
  static Future<String> getRefreshToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("refreshToken") ?? "";
  }

  /*set accessToken value in SharedPreferences*/
  static setAccessToken(String accessToken) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("accessToken", accessToken);
  }
  /*get accessToken value form SharedPreferences*/
  static Future<String> getAccessToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("accessToken") ?? "";
  }

  /*set referenceId value in SharedPreferences*/
  static setReferenceId(String referenceId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("referenceId", referenceId);
  }
  /*get referenceId value form SharedPreferences*/
  static Future<String> getReferenceId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("referenceId") ?? "";
  }
  /*set isOfficerName value in SharedPreferences*/
  static setIsOfficerName(String isOfficerName) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("isOfficerName", isOfficerName);
  }
  /*get isOfficerName value form SharedPreferences*/
  static Future<String> getIsOfficerName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("isOfficerName") ?? "";
  }

  /*set firstName value in SharedPreferences*/
  static setFirstName(String firstName) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("firstName", firstName);
  }
  /*get firstName value form SharedPreferences*/
  static Future<String> getFirstName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("firstName") ?? "";
  }
 /*set lastName value in SharedPreferences*/
  static setLastName(String lastName) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("lastName", lastName);
  }
  /*get lastName value form SharedPreferences*/
  static Future<String> getLastName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("lastName") ?? "";
  }

 /*set mobileNumber value in SharedPreferences*/
  static setMobileNumber(String mobileNumber) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("mobileNumber", mobileNumber);
  }
  /*get mobileNumber value form SharedPreferences*/
  static Future<String> getMobileNumber() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("mobileNumber") ?? "";
  }
  /*set emailId value in SharedPreferences*/
  static setEmailId(String emailId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("emailId", emailId);
  }
  /*get emailId value form SharedPreferences*/
  static Future<String> getEmailId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("emailId") ?? "";
  }

 /*set designation value in SharedPreferences*/
  static setDesignation(String designation) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("designation", designation);
  }
  /*get designation value form SharedPreferences*/
  static Future<String> getDesignation() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("designation") ?? "";
  }
  /*set reportingManagerId value in SharedPreferences*/
  static setReportingManagerId(String reportingManagerId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("reportingManagerId", reportingManagerId);
  }
  /*get reportingManagerId value form SharedPreferences*/
  static Future<String> getReportingManagerId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("reportingManagerId") ?? "";
  }



  /*set userRoleId value in SharedPreferences*/
  static setUserRoleId(int userRoleId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("userRoleId", userRoleId);
  }
  /*get userRoleId value form SharedPreferences*/
  static Future<int> getUserRoleId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt("userRoleId") ?? 0;
  }

  /*set baseLocation value in SharedPreferences*/
  static setBaseLocation(String baseLocation) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("baseLocation", baseLocation);
  }
  /*get baseLocation value form SharedPreferences*/
  static Future<String> getBaseLocation() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("baseLocation") ?? "";
  }

  /*set baseLocation value in SharedPreferences*/
  static setWorkLocation(String workLocation) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("workLocation", workLocation);
  }
  /*get baseLocation value form SharedPreferences*/
  static Future<String> getWorkLocation() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("workLocation") ?? "";
  }

  /*set baseLocation value in SharedPreferences*/
  static setIsActive(String isActive) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("isActive", isActive);
  }
  /*get baseLocation value form SharedPreferences*/
  static Future<String> getIsActive() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("isActive") ?? "";
  }


  static clearAppPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("refreshToken");
    prefs.remove("accessToken");
    prefs.remove("referenceId");
    prefs.remove("isOfficerName");
    prefs.remove("firstName");
    prefs.remove("lastName");
    prefs.remove("mobileNumber");
    prefs.remove("emailId");
    prefs.remove("designation");
    prefs.remove("reportingManagerId");
    prefs.remove("userRoleId");
    prefs.remove("baseLocation");
    prefs.remove("workLocation");
    prefs.remove("isActive");
  }





}
