import 'dart:convert';
import 'package:demogetx/Bindings/update_profile_binding.dart';
import 'package:demogetx/CommanModual/AppColors/Lcolors.dart';
import 'package:demogetx/ProductModual/Controllers/get_profile_controller.dart';
import 'package:demogetx/ProductModual/Controllers/profile_controller.dart';
import 'package:demogetx/ProductModual/Controllers/update_profile_controller.dart';
import 'package:demogetx/ProductModual/Modals/GetAddressResponceModal.dart';
import 'package:demogetx/ProductModual/Views/invite_screen.dart';
import 'package:demogetx/ProductModual/Views/update_address.dart';
import 'package:demogetx/ProductModual/Views/update_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name,emailid,gender,dateOfBirths,dob;

  ProfileController profileController;
  GetProfileController getProfileController;


  @override
  void initState() {
    profileController = Get.put(ProfileController());
    getProfileController = Get.put(GetProfileController());

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Container(
          //color: Colors.amber,
          child: Row(
            children: [
              Text(
                "Profile",
                style: TextStyle(color: Lcolors.whiteColor),
              ),
              SizedBox(
                width: 40,
              ),
              Container(
                height: 35,
                width: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: Colors.white)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.supervisor_account_sharp,
                        color: Colors.white,
                      ),
                      padding: new EdgeInsets.fromLTRB(0, 0, 0, 3),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => InviteScreen()),);
                      },
                    ),
                    //  Icon(Icons.supervisor_account_sharp),
                    Container(
                      margin: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        'invite',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
            onPressed: () {
              //Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()),);
            },
          ),
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            onPressed: () {
              //Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()),);
            },
          ),
        ],
      ),
      body: Stack(fit: StackFit.expand, children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: GetBuilder<ProfileController>(
                    builder: (pController){

                      //return pController.isLoading.isTrue ?Text("Loading") : Text("Found Data");
                       return pController.isLoading.isTrue?
                      Center(child: CircularProgressIndicator()):
                       Column(
                        children: [
                          Card(
                            child: Column(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    new Container(
                                        height: 100.0,

                                        alignment: Alignment.topLeft,
                                        child: Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 5),
                                          child: Row(

                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                               Container(
                                                   // color: Colors.amber,
                                                   height: 100,
                                                   width: 90,
                                                   child: pController.getProfilePicResponceModal.data.customerProfilePicStr.toString()==null ?Icon(Icons.account_circle,size:100):Image.memory(base64Decode(pController.getProfilePicResponceModal.data.customerProfilePicStr,),height: 90,fit: BoxFit.fill)),

                                              //child:Image(image: NetworkImage("https://i.imgur.com/BoN9kdC.png"))),
                                            ],
                                          ),
                                        )),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(horizontal: 20),
                                      alignment: Alignment.topLeft,
                                      child: Text(pController.name??'UserName', style: TextStyle(color: Lcolors.navyColor)),
                                    ),
                                    SizedBox(
                                      height: 1.0,
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(horizontal: 20),
                                      alignment: Alignment.topLeft,
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [

                                          Text(
                                              pController.mobileno==null?'MobileNo':pController.mobileno, style: TextStyle(color: Lcolors.navyColor)),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.edit,
                                                color: Lcolors.primaryColor,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  Get.to(UpdateProfile(), binding: UpdateProfileBinding(),
                                                      arguments:[pController.getCustomerProfileResponceModal.data.customerName,
                                                        pController.getCustomerProfileResponceModal.data.customerEmailId,
                                                        pController.getCustomerProfileResponceModal.data.customerGender,
                                                        pController.getCustomerProfileResponceModal.data.customerDob,
                                                        pController.getProfilePicResponceModal.data.customerProfilePicStr]
                                                      // arguments:[pController.customerName,
                                                      //   pController.customerEamilid,
                                                      //   pController.customerGender,
                                                      //  // pController.customerDob,
                                                      //   pController.getProfilePicResponceModal.data.customerProfilePicStr]
                                                  ).then((value){
                                                    // profileController.callAll();
                                                    profileController.customerProfile();
                                                    pController.getProfilePick();
                                                    //pController.getUserAddress();
                                                  });

                                                },
                                                child: new Padding(
                                                  padding: new EdgeInsets.all(10.0),
                                                  child: new Text(
                                                    "Edit",
                                                    style: TextStyle(
                                                        color: Lcolors.navyColor),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 1.0,
                          ),
                          Card(
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  alignment: Alignment.topLeft,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Full Name",
                                        style: TextStyle(color: Lcolors.grayColor),
                                      ),
                                      Text(
                                        "Email Id",
                                        style: TextStyle(color: Lcolors.grayColor),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 20),
                                  alignment: Alignment.topLeft,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Text("UserName"),
                                      Text(pController.customerUserName?? 'UserName',
                                        style: TextStyle(color: Lcolors.navyColor),
                                      ),
                                      // Text(pController.getCustomerProfileResponceModal.data.customerName.toString()==null?
                                      // "UserName":pController.getCustomerProfileResponceModal.data.customerName.toString(),
                                      //   style: TextStyle(color: Lcolors.navyColor),
                                      // ),
                                     // Text("Emailid"),
                                      Text(pController.customerUserEmailId??
                                      "Emailid",
                                        style: TextStyle(color: Lcolors.navyColor),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 20),
                                  alignment: Alignment.topLeft,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Gender",
                                        style: TextStyle(color: Lcolors.grayColor),
                                      ),
                                      Text(
                                        "Date of Birth",
                                        style: TextStyle(color: Lcolors.grayColor),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  alignment: Alignment.topLeft,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Text("Emailid"),
                                      Text(
                                        pController.customerUserGender==null?"Gender":
                                        pController.customerUserGender== "0" ? "Male" : "Female",
                                        style: TextStyle(color: Lcolors.navyColor),
                                      ),
                                      //Text("12/12/21"),

                                      Text(DateFormat("dd/MM/yyyy").format(DateTime.parse(pController.customerUserDob==null?
                                      //Text(pController.customerUserDob==null?
                                      "DOB":pController.customerUserDob)),
                                        style: TextStyle(color: Lcolors.navyColor),
                                      ),
                                      // Text(pController.getCustomerProfileResponceModal.data.customerDob==null?
                                      // "DOB":pController.getCustomerProfileResponceModal.data.customerDob,
                                      //   style: TextStyle(color: Lcolors.navyColor),
                                      // ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                              ],
                            ),
                          ),
                          Container(
                           // height: 100,
                            child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: pController.getAddressResponceModal.customerAddressList.length,
                                itemBuilder: (BuildContext context, int index) {

                                  return Dismissible(
                                    key: Key(pController.getAddressResponceModal.customerAddressList.toString()),
                                    onDismissed: (direction) {

                                      pController.deleteAddress(context, index);
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(
                                          "Address Delete Successfully")));
                                    },
                                    background: Container(
                                        color: Lcolors.primaryColor),
                                    child: Card(
                                      child: ListTile(
                                        // leading: Icon(Icons.favorite_border),
                                        title: Text(
                                            '${pController.getAddressResponceModal.customerAddressList[index].addressBuildingNoHouseName}${", "}'
                                                '${pController.getAddressResponceModal.customerAddressList[index].addressStreet}${", "}'
                                                '${pController.getAddressResponceModal.customerAddressList[index].addressLandmark}${", "}'
                                                '${pController.getAddressResponceModal.customerAddressList[index].addressCity}${", "}'
                                                '${pController.getAddressResponceModal.customerAddressList[index].addressPin}'),
                                        trailing: IconButton(
                                          icon: Icon(
                                            Icons.edit,
                                            color: Lcolors.primaryColor,
                                          ),
                                          onPressed: () {
                                            Get.to(UpadateAddress(
                                                addressId: pController.getAddressResponceModal.customerAddressList[index].addressId,
                                                addressCustomerId: pController.getAddressResponceModal.customerAddressList[index].addressCustomerId,
                                                addressBuildingNoHouseName: pController.getAddressResponceModal.customerAddressList[index].addressBuildingNoHouseName,
                                                addressStreet: pController.getAddressResponceModal.customerAddressList[index].addressStreet,
                                                addressCity: pController.getAddressResponceModal.customerAddressList[index].addressCity,
                                                addressPin: pController.getAddressResponceModal.customerAddressList[index].addressPin,
                                                addressLandmark: pController.getAddressResponceModal.customerAddressList[index].addressLandmark,
                                                addressType: pController.getAddressResponceModal.customerAddressList[index].addressType,
                                                addressDefault: pController.getAddressResponceModal.customerAddressList[index].addressDefault),
                                              arguments: [pController.getAddressResponceModal.customerAddressList[index].addressId,
                                                pController.getAddressResponceModal.customerAddressList[index].addressCustomerId,
                                                pController.getAddressResponceModal.customerAddressList[index].addressBuildingNoHouseName,
                                                pController.getAddressResponceModal.customerAddressList[index].addressStreet,
                                                pController.getAddressResponceModal.customerAddressList[index].addressCity,
                                                pController.getAddressResponceModal.customerAddressList[index].addressPin,
                                                pController.getAddressResponceModal.customerAddressList[index].addressLandmark,
                                                pController.getAddressResponceModal.customerAddressList[index].addressType,
                                                pController.getAddressResponceModal.customerAddressList[index].addressDefault],
                                            );
                                            //     .then((value){
                                            //   print("back calling /////////////////////////////////");
                                            //   if(value!=null)
                                            //     pController.getUserAddress();
                                            // });

                                          },

                                        ),
                                        subtitle: Text(pController
                                            .getAddressResponceModal.customerAddressList[index].addressDefault == "0" ? "Default Address" : "Home Address"),
                                        onTap: () {},
                                      ),
                                    ),
                                  );
                                }

                                ),
                            // child: GetBuilder<GetAddreesController>(
                            //   builder: (controller) {
                            //     print(
                            //         "controller  ............................... ${controller.customerAddressLists != null ? controller.customerAddressLists.length : 0}");
                            //     return controller.customerAddressLists != null
                            //         ? ListView.builder(
                            //         itemCount:
                            //         controller.customerAddressLists.length,
                            //         itemBuilder: (BuildContext context, int index) {
                            //           controller.customerAddressList = controller.customerAddressLists[index];
                            //           CustomerAddressList customerAddressListModal = controller.customerAddressLists.elementAt(index);
                            //           int addId = customerAddressListModal.addressId;
                            //
                            //          pController.customerAddressId =addId;
                            //
                            //          print("******customerAddressId****************${pController.customerAddressId}");
                            //
                            //           return Dismissible(
                            //             key: Key(controller.customerAddressList.toString()),
                            //             onDismissed: (direction) {
                            //               pController.deleteAddress(context, index);
                            //               ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(
                            //                   "Address Delete Successfully")));
                            //             },
                            //             background: Container(
                            //                 color: Lcolors.primaryColor),
                            //             child: Card(
                            //               child: ListTile(
                            //                 // leading: Icon(Icons.favorite_border),
                            //                 title: Text(
                            //                     '${controller.customerAddressList.addressBuildingNoHouseName}${", "}'
                            //                         '${controller.customerAddressList.addressStreet}${", "}'
                            //                         '${controller.customerAddressList.addressLandmark}${", "}'
                            //                         '${controller.customerAddressList.addressCity}${", "}'
                            //                         '${controller.customerAddressList.addressPin}'),
                            //                 trailing: IconButton(
                            //                   icon: Icon(
                            //                     Icons.edit,
                            //                     color: Lcolors.primaryColor,
                            //                   ),
                            //                   onPressed: () {
                            //                     Get.to(UpadateAddress(
                            //                         addressId: customerAddressListModal.addressId,
                            //                         addressCustomerId: customerAddressListModal.addressCustomerId,
                            //                         addressBuildingNoHouseName: customerAddressListModal.addressBuildingNoHouseName,
                            //                         addressStreet: customerAddressListModal.addressStreet,
                            //                         addressCity: customerAddressListModal.addressCity,
                            //                         addressPin: customerAddressListModal.addressPin,
                            //                         addressLandmark: customerAddressListModal.addressLandmark,
                            //                         addressType: customerAddressListModal.addressType,
                            //                         addressDefault: customerAddressListModal.addressDefault),
                            //                       arguments: [customerAddressListModal.addressId,
                            //                         customerAddressListModal.addressCustomerId,
                            //                         customerAddressListModal.addressBuildingNoHouseName,
                            //                         customerAddressListModal.addressStreet,
                            //                         customerAddressListModal.addressCity,
                            //                         customerAddressListModal.addressPin,
                            //                         customerAddressListModal.addressLandmark,
                            //                         customerAddressListModal.addressType,
                            //                         customerAddressListModal.addressDefault],
                            //                     );
                            //
                            //
                            //                     //Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()),);
                            //                   },
                            //
                            //                 ),
                            //                 subtitle: Text(controller
                            //                     .customerAddressList
                            //                     .addressDefault ==
                            //                     "0"
                            //                     ? "Default Address"
                            //                     : "Home Address"),
                            //                 onTap: () {
                            //                   //Navigator.push(context, MaterialPageRoute(builder: (context) => OrderDetailsScreen()),);
                            //                 },
                            //               ),
                            //             ),
                            //           );
                            //         })
                            //         : Center(
                            //       child: CircularProgressIndicator(),
                            //     );
                            //   },
                            // ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                "Membership Plans",
                                style: TextStyle(
                                    color: Lcolors.primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0),
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Card(
                            child: Column(
                              children: [
                                Container(
                                    child: Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.symmetric(horizontal: 20),
                                          child: Row(
                                            children: [
                                              Text(
                                                "Basic Plan",
                                                style: TextStyle(
                                                    color: Lcolors.primaryColor,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16.0),
                                              ),
                                              Icon(
                                                Icons.check_circle,
                                                color: Lcolors.primaryColor,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        Container(
                                            margin: EdgeInsets.symmetric(horizontal: 20),
                                            child: Text(
                                                "Free pickup and delivery 24x7 customer care assistance 24 hour promised delivery")),
                                        SizedBox(
                                          height: 20.0,
                                        ),
                                        MaterialButton(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.all(Radius.circular(5.0))),
                                          elevation: 5.0,
                                          minWidth: 300,
                                          height: 45,
                                          color: Color(0xFF0ECFD1),
                                          child: new Text('Cancel Membership',
                                              style: new TextStyle(
                                                  fontSize: 16.0, color: Colors.white)),
                                          onPressed: () {
                                            //Navigator.push(context, MaterialPageRoute(builder: (context) => Navigation()),);
                                            // setState(() {
                                            //   _isNeedHelp = true;
                                            // });
                                          },
                                        ),
                                        SizedBox(
                                          height: 10,
                                        )
                                      ],
                                    ))
                              ],
                            ),
                          ),
                          Card(
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                                  height: 55,
                                  child: Row(
                                    children: [
                                      Text(
                                        "Gold Plan",
                                        style: TextStyle(
                                          color: Colors.amber,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      );
                    },

                  ),

                ),
              ),
            ])


    );
  }
}
