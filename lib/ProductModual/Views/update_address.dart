import 'package:demogetx/CommanModual/AppColors/Lcolors.dart';
import 'package:demogetx/ProductModual/Controllers/update_address_controller.dart';
import 'package:demogetx/ProductModual/Views/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpadateAddress extends StatefulWidget {
  final String addressBuildingNoHouseName,
      addressStreet,
      addressCity,
      addressPin,
      addressLandmark,
      addressType,
      addressDefault;
  final int addressId, addressCustomerId;

  const UpadateAddress({
    Key key,
    this.addressId,
    this.addressCustomerId,
    this.addressBuildingNoHouseName,
    this.addressStreet,
    this.addressCity,
    this.addressPin,
    this.addressLandmark,
    this.addressType,
    this.addressDefault,
  }) : super(key: key);

  @override
  _UpadateAddressState createState() => _UpadateAddressState();
}

class _UpadateAddressState extends State<UpadateAddress> {
  UpdateAddressController updateAddressController;

  @override
  void initState() {
    updateAddressController = Get.put(UpdateAddressController());
    super.initState();
  }

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
                Text(
                  " Update Address",
                  style: TextStyle(color: Lcolors.whiteColor),
                ),
              ],
            ),
          ),
        ),
        body: Stack(fit: StackFit.expand, children: <Widget>[
          //BgImage(),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetBuilder<UpdateAddressController>(builder: (controller) {
                return SingleChildScrollView(
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Form(
                            key: controller.updateAddressssFormKey,
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "Search Location*",
                                          style: TextStyle(
                                              color: Lcolors.navyColor),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextFormField(
                                        // controller: userLastNameController,
                                        textAlign: TextAlign.start,
                                        autofocus: false,
                                        enabled: true,
                                        style:
                                            TextStyle(color: Lcolors.navyColor),
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.done,
                                        decoration: InputDecoration(
                                          hintText: "Enter Location Name",
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "House Name*",
                                          style: TextStyle(
                                              color: Lcolors.navyColor),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextFormField(
                                        controller:
                                            controller.houseNameController,
                                        onSaved: (value) {
                                          controller.setHouseName = value;
                                          // setState(() {
                                          //   updateAddressController.setHouseName = value;
                                          // })
                                        },
                                        validator: (value) {
                                          print("****value*************$value");
                                          return controller
                                              .validateHouseName(value);
                                        },
                                        textAlign: TextAlign.start,
                                        autofocus: false,
                                        enabled: true,
                                        style:
                                            TextStyle(color: Lcolors.navyColor),
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.done,
                                        decoration: InputDecoration(
                                          hintText: "Enter House Name",
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "Street*",
                                          style: TextStyle(
                                              color: Lcolors.navyColor),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextFormField(
                                        controller: updateAddressController
                                            .streetController,
                                        validator: (value) {
                                          return controller
                                              .validateStreet(value);
                                        },
                                        textAlign: TextAlign.start,
                                        autofocus: false,
                                        enabled: true,
                                        style:
                                            TextStyle(color: Lcolors.navyColor),
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.done,
                                        decoration: InputDecoration(
                                          hintText: "Enter street",
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "Landmark",
                                          style: TextStyle(
                                              color: Lcolors.navyColor),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextFormField(
                                        controller: updateAddressController
                                            .landmarkController,
                                        validator: (value) {
                                          return controller
                                              .validateLandmark(value);
                                        },
                                        textAlign: TextAlign.start,
                                        autofocus: false,
                                        enabled: true,
                                        style:
                                            TextStyle(color: Lcolors.navyColor),
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.done,
                                        decoration: InputDecoration(
                                          hintText: "Enter near landmark ",
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "Select Address Type*",
                                          style: TextStyle(
                                              color: Lcolors.navyColor),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Container(
                                        height: 45,
                                        padding: EdgeInsets.only(
                                            left: 16, right: 16),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey, width: 2),
                                            borderRadius:
                                                BorderRadius.circular(10)),
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
                                                newValueSelected);
                                          },
                                          value: controller
                                              .addressTypeItemSelected,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Checkbox(
                                                  focusColor: Colors.lightBlue,
                                                  activeColor:
                                                      Lcolors.primaryColor,
                                                  value: controller.isCheked,
                                                  onChanged: (newValue) {
                                                    //modal.changeStatus();
                                                    setState(() {
                                                      controller.isCheked =
                                                          newValue;
                                                      if (controller.isCheked) {
                                                        controller
                                                                .defaulteAddress =
                                                            "1";
                                                      } else {
                                                        controller
                                                                .defaulteAddress =
                                                            "0";
                                                      }
                                                    });
                                                  }),
                                              Text('Default Address'),
                                              SizedBox(width: 10.0),
                                            ]),
                                      ),
                                      Container(
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  alignment: Alignment.topLeft,
                                                  child: Text(
                                                    "Select City*",
                                                    style: TextStyle(
                                                        color:
                                                            Lcolors.navyColor),
                                                  ),
                                                ),
                                                Column(
                                                  children: [
                                                    Container(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Text(
                                                        "Pincode*",
                                                        style: TextStyle(
                                                            color: Lcolors
                                                                .navyColor),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  height: 45,
                                                  width: 120,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.grey,
                                                          width: 2),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: DropdownButton<String>(
                                                    //dropdownColor: LColors.grayColor,
                                                    underline: SizedBox(),
                                                    icon: Icon(
                                                        Icons.arrow_drop_down),
                                                    iconSize: 20,
                                                    items: controller.city.map(
                                                        (String
                                                            dropDownStringItem) {
                                                      return DropdownMenuItem<
                                                          String>(
                                                        value:
                                                            dropDownStringItem,
                                                        child: Text(
                                                            dropDownStringItem),
                                                      );
                                                    }).toList(),
                                                    onChanged: (String
                                                        newValueSelected) {
                                                      controller
                                                          .onDropDownItemSelected(
                                                              newValueSelected);
                                                    },
                                                    value: controller
                                                        .cityItemSelected,
                                                  ),
                                                ),
                                                Column(
                                                  children: [
                                                    Container(
                                                        height: 60,
                                                        width: 150,
                                                        alignment:
                                                            Alignment.center,
                                                        // decoration: BoxDecoration(
                                                        //     border: Border.all(color: Colors.grey,width: 2),
                                                        //     borderRadius: BorderRadius.circular(10)
                                                        // ),
                                                        child: TextFormField(
                                                          controller:
                                                              updateAddressController
                                                                  .pincodeController,
                                                          textAlign:
                                                              TextAlign.center,
                                                          autofocus: false,
                                                          enabled: true,
                                                          style: TextStyle(
                                                              color: Lcolors
                                                                  .navyColor),
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          maxLength: 6,
                                                          textInputAction:
                                                              TextInputAction
                                                                  .done,
                                                          decoration:
                                                              InputDecoration(
                                                            hintText:
                                                                "Enter Pin",
                                                            border:
                                                                OutlineInputBorder(),
                                                          ),
                                                        )),
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
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MaterialButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0))),
                                  elevation: 5.0,
                                  minWidth: 100,
                                  height: 45,
                                  color: Lcolors.whiteColor,
                                  child: new Text('Cancel',
                                      style: new TextStyle(
                                          fontSize: 16.0,
                                          color: Lcolors.navyColor)),
                                  onPressed: () {
                                    Get.back();

                                    //Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()),);
                                    //Get.to(ProfileScreen());
                                    // setState(() {
                                    //    Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()),);
                                    //
                                    // });
                                  },
                                ),
                                MaterialButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0))),
                                  elevation: 5.0,
                                  minWidth: 200,
                                  height: 45,
                                  color: Color(0xFF0ECFD1),
                                  child: new Text('Next',
                                      style: new TextStyle(
                                          fontSize: 16.0, color: Colors.white)),
                                  onPressed: () {
                                    //controller.checkAddress(context);
                                    controller.userUpdateAddress(context);
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                      Visibility(
                        visible:  controller.isProcessing.value,

                        child: Container(
                            decoration: new BoxDecoration(
                                color: Colors.blue[200],
                                borderRadius: new BorderRadius.circular(10.0)),
                            width: 300.0,
                            height: 200.0,
                            alignment: AlignmentDirectional.center,
                            child: new Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Center(
                                    child: new SizedBox(
                                      height: 50.0,
                                      width: 50.0,
                                      child: new CircularProgressIndicator(
                                        value: null,
                                        strokeWidth: 7.0,
                                      ),
                                    ),
                                  ),
                                ])),
                      ),
                    ],
                  ),
                );
              })),
        ]));
  }
}
