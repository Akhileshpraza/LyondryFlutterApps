import 'package:demogetx/CommanModual/AppColors/Lcolors.dart';
import 'package:demogetx/CommanModual/BottomNavigation/tabbar.dart';
import 'package:demogetx/ProductModual/Controllers/add_address_controller.dart';
import 'package:demogetx/ProductModual/Controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({Key key}) : super(key: key);

  @override
  _AddAddressState createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {

  AddAddressController addAddressController = Get.find();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          automaticallyImplyLeading: true,
          title: Container(
            //color: Colors.amber,
            child: Row(
              children: [
                //Text(" Add Address", style: TextStyle(color: Lcolors.whiteColor),),
                "Add Address".text.color(Lcolors.whiteColor).make()

              ],
            ),
          ),

        ),
        body: SingleChildScrollView(
          child: GetBuilder<AddAddressController>(
            builder: (controller){
              return controller.customerMobileNo!=null? Column(
                children: [
                  Form(
                    key: controller.addAddressssFormKey,
                    child: Padding(padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Container(alignment: Alignment.topLeft,
                            child: "Search Location*".text.color(Lcolors.navyColor).make()
                            //Text("Search Location*", style: TextStyle(color: Lcolors.navyColor),),
                          ),
                          SizedBox(height: 10,),
                          TextFormField(
                            textAlign: TextAlign.start,
                            autofocus: false,
                            enabled: true,
                            style: TextStyle(color: Lcolors.navyColor),
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(hintText: "Enter Location Name", border: OutlineInputBorder(),),
                          ),
                          SizedBox(height: 10,),

                          Container(alignment: Alignment.topLeft,
                            child: Text("House Name*",
                              style: TextStyle(color: Lcolors.navyColor),
                            ),
                          ),
                          SizedBox(height: 10,),
                          TextFormField(
                            controller: addAddressController.houseNameController,
                            onSaved: (value) {
                              addAddressController.house = value;
                            },
                            validator: (value) {
                              return addAddressController.validateHouseName(value);
                            },

                            // inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]'),),
                            // ],
                            /*  inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp('[0-9]'),
                      ),
                    ],*/
                            textAlign: TextAlign.start,
                            autofocus: false,
                            enabled: true,
                            style: TextStyle(color: Lcolors.navyColor),
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(hintText: "Enter House Name", border: OutlineInputBorder(),),
                          ),
                          SizedBox(height: 10,),

                          Container(alignment: Alignment.topLeft,
                            child: Text("Street*",
                              style: TextStyle(color: Lcolors.navyColor),
                            ),
                          ),
                          SizedBox(height: 10,),
                          TextFormField(
                            controller: addAddressController.streetController,
                            onSaved: (value) {
                              addAddressController.street = value;
                            },
                            validator: (value) {
                              return addAddressController.validateStreet(value);
                            },
                            textAlign: TextAlign.start,
                            autofocus: false,
                            enabled: true,
                            style: TextStyle(color: Lcolors.navyColor),
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(hintText: "Enter street", border: OutlineInputBorder(),),
                          ),
                          SizedBox(height: 10,),

                          Container(alignment: Alignment.topLeft,
                            child: Text("Landmark",
                              style: TextStyle(color: Lcolors.navyColor),
                            ),
                          ),
                          SizedBox(height: 10,),
                          TextFormField(
                            controller: addAddressController.landmarkController,
                            onSaved: (value) {
                              addAddressController.landmark = value;
                            },
                            validator: (value) {
                              return addAddressController.validateLandmark(value);
                            },
                            textAlign: TextAlign.start,
                            autofocus: false,
                            enabled: true,
                            style: TextStyle(color: Lcolors.navyColor),
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(hintText: "Enter near landmark ", border: OutlineInputBorder(),),
                          ),
                          SizedBox(height: 10,),
                          Container(alignment: Alignment.topLeft,
                            child: Text("Select Address Type*",
                              style: TextStyle(color: Lcolors.navyColor),
                            ),
                          ),
                          SizedBox(height: 10.0,),
                          GetBuilder<AddAddressController>(
                            builder: (controller){
                              return Container(
                                height: 45,
                                padding: EdgeInsets.only(left: 16,right: 16),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey,width: 2),
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: DropdownButton<String>(
                                  //dropdownColor: LColors.grayColor,
                                  isExpanded: true,
                                  underline: SizedBox(),
                                  icon: Icon(Icons.arrow_drop_down),
                                  iconSize: 20,

                                  items: controller.addressType
                                      .map((String dropDownStringItem) {
                                    return DropdownMenuItem<String>(
                                      value: dropDownStringItem,
                                      child: Text(dropDownStringItem),
                                    );
                                  }).toList(),
                                  onChanged: (String newValueSelected) {
                                    controller.onDropDownAddressType(
                                        newValueSelected
                                    );
                                  },
                                  value: controller.addressTypeItemSelected,
                                ),
                              );
                            },
                          ),


                          SizedBox(height: 10,),
                          Container(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Checkbox(
                                      focusColor: Colors.lightBlue,
                                      activeColor: Lcolors.primaryColor,
                                      value: addAddressController.isCheked,
                                      onChanged: (value) {
                                        print("newValue   $value");
                                       // addAddressController.isCheked = newValue;
                                        setState(() {
                                          addAddressController.isCheked = value;
                                          if(addAddressController.isCheked) {
                                            addAddressController
                                                .defaulteAddress = "1";
                                          }else{
                                            addAddressController
                                                .defaulteAddress = "0";
                                          }
                                        });
                                        // if(Value == true){
                                        //   print("VaL True   $Value");
                                        //   this.addAddressController.isCheked = true;
                                        // }else {
                                        //   print("VaL False  $Value");
                                        //   this.addAddressController.isCheked = false;
                                        // }
                                        //addAddressController.isCheked=newValue;

                                      }

                                  ),
                                  Text('Default Address'),
                                  SizedBox(width:  10.0),

                                ]
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(alignment: Alignment.topLeft,
                                      child: Text("Select City*",
                                        style: TextStyle(color: Lcolors.navyColor),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Container(alignment: Alignment.centerRight,
                                          child: Text("Pincode*",
                                            style: TextStyle(color: Lcolors.navyColor),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 45,
                                      width: 120,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.grey,width: 2),
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      child: DropdownButton<String>(
                                        //dropdownColor: LColors.grayColor,
                                        underline: SizedBox(),
                                        icon: Icon(Icons.arrow_drop_down),
                                        iconSize: 20,
                                        items: addAddressController.city
                                            .map((String dropDownStringItem) {
                                          return DropdownMenuItem<String>(
                                            value: dropDownStringItem,
                                            child: Text(dropDownStringItem),
                                          );
                                        }).toList(),
                                        onChanged: (String newValueSelected) {
                                          addAddressController.onDropDownItemSelected(
                                              newValueSelected
                                          );
                                        },
                                        value: addAddressController.cityItemSelected,
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Container(

                                            height: 60,
                                            width: 150,
                                            alignment: Alignment.center,
                                            child: TextFormField(
                                              controller: addAddressController.pincodeController,
                                              onSaved: (value) {
                                                addAddressController.pincode = value;
                                              },
                                              validator: (value) {
                                                return addAddressController.validatePincode(value);
                                              },
                                              textAlign: TextAlign.center,
                                              autofocus: false,
                                              enabled: true,
                                              style: TextStyle(color: Lcolors.navyColor),
                                              keyboardType: TextInputType.number,
                                              maxLength: 6,
                                              textInputAction: TextInputAction.done,
                                              decoration: InputDecoration(hintText: "Enter Pin", border: OutlineInputBorder(),),
                                            )
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MaterialButton(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
                          elevation: 5.0,
                          minWidth: 100,
                          height: 45,
                          color: Lcolors.whiteColor,
                          child: new Text('Cancel',
                              style: new TextStyle(fontSize: 16.0, color: Lcolors.navyColor)),
                          onPressed: () {
                            Get.back();
                            //Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateProfile()),);

                            //Get.off(UpdateProfile());
                          },
                        ),
                        MaterialButton(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
                          elevation: 5.0,
                          minWidth: 200,
                          height: 45,
                          color: Color(0xFF0ECFD1),
                          child: new Text('Next',
                              style: new TextStyle(fontSize: 16.0, color: Colors.white)),
                          onPressed: () {
                            addAddressController.insertAddress(context);

                            //Get.to(Navigation());


                          },
                        ),

                      ],
                    ),

                  ),
                  SizedBox(height: 20,),
                ],
              )
                  :Center(child: CircularProgressIndicator(),);
            },

          ),
        )
        );

  }

}