import 'package:demogetx/Bindings/insert_address_binding.dart';
import 'package:demogetx/CommanModual/AppColors/Lcolors.dart';
import 'package:demogetx/CommanModual/BottomNavigation/tabbar.dart';
import 'package:demogetx/ProductModual/Controllers/scheduale_pickup_controller.dart';
import 'package:demogetx/ProductModual/Views/add_address.dart';
import 'package:demogetx/ProductModual/Views/invite_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SchedualePickup extends StatefulWidget {
  const SchedualePickup({Key key}) : super(key: key);

  @override
  _SchedualePickupState createState() => _SchedualePickupState();
}

class _SchedualePickupState extends State<SchedualePickup> {

  SchedualePickUpController schedualePickUpController = Get.put(SchedualePickUpController());

  @override
  void initState() {

    setState(() {
      schedualePickUpController.getUserAddress();
    });

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
              Text("Schedule",style: TextStyle(color: Lcolors.whiteColor),),

              SizedBox(width:40,),

              Container(height: 35, width: 105,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: Colors.white)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(icon: Icon(Icons.supervisor_account_sharp, color: Colors.white,),
                      padding: new EdgeInsets.fromLTRB(0, 0, 0, 3),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => InviteScreen()),);
                      },
                    ),
                    //  Icon(Icons.supervisor_account_sharp),
                    Container(
                      margin: const EdgeInsets.only(top: 5.0),
                      child: Text('invite',
                        style: TextStyle(color: Colors.white,),
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
            icon: Icon(Icons.notifications, color: Colors.white,),
            onPressed: () {
              //Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()),);
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.white,),
            onPressed: () {
              //Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()),);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: GetBuilder<SchedualePickUpController>(
          builder: (controller){
            return Column(
              children: [
                SizedBox(height: 10,),
                Center(
                  child: Text("Schedule Pickup",style: TextStyle(fontSize: 20.0,color: Lcolors.navyColor),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: new EdgeInsets.symmetric(horizontal: 16.0,vertical: 5),
                  //color: Colors.amber,
                  child: Text("Service",
                    style: TextStyle(color: Lcolors.primaryColor,fontSize: 16,),
                    textAlign: TextAlign.left,),),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.only(left: 16,right: 16),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey,width: 2),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: (
                          DropdownButton(
                            dropdownColor: Colors.white,
                            icon: Icon(Icons.arrow_drop_down),
                            iconSize: 20,
                            isExpanded: true,
                            underline: SizedBox(),
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            value: controller.serviceListModel,
                            onChanged: (newValue){
                              controller.serviceLists(newValue);

                            },
                            items: controller.servicesList.map((serviceListModel) {
                              return DropdownMenuItem(
                                value:serviceListModel,
                                child: Text(serviceListModel.serviceName),
                              );
                            }).toList(),
                          )
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: new EdgeInsets.symmetric(horizontal: 16.0,vertical: 5),
                  //color: Colors.amber,
                  child: Text("Store",
                    style: TextStyle(color: Lcolors.primaryColor,fontSize: 16,),
                    textAlign: TextAlign.left,),),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.only(left: 16,right: 16),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey,width: 2),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: DropdownButton(
                        dropdownColor: Colors.white,
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: 20,
                        isExpanded: true,
                        underline: SizedBox(),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16
                        ),
                        value: controller.storeListModel,
                        onChanged: (newValue){
                          controller.storeLists(newValue);
                          // setState(() {
                          //   controller.storeListModel = newValue;
                          // });
                        },
                        items: controller.storeList.map((storeListModel) {
                          return DropdownMenuItem(
                            value: storeListModel,
                            child: Text(storeListModel.storeName),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Radio<String>(
                              value: 'Ragular',
                              groupValue: controller.radioButtonValue,
                              activeColor: Lcolors.primaryColor,

                              onChanged: (val){
                                controller.handleradioButton(val);
                              }),
                          Text("Regular")
                        ],
                      ),
                      Row(
                        children: [
                          Radio<String>(
                              value: 'Express',
                              groupValue: controller.radioButtonValue,
                              activeColor: Lcolors.primaryColor,
                              onChanged: (val){
                                controller.handleradioButton(val);

                          }),
                          Text("Express")
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  //color: Colors.blue,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          //color: Colors.deepOrange,
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                child: Text("Date", style: TextStyle(color: Lcolors.navyColor),
                                ),
                              ),
                              SizedBox(height: 10,),
                              Container(

                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey,width: 2),
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,

                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      //child: Text(DateFormat("dd/MM/yyyy").format(DateTime.parse("${selectedDate.toString()}".split(' ')[0])),
                                      child: Text(controller.correntDate,
                                        //formattedStr,
                                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                      ),
                                    ),

                                    IconButton(icon: Icon(Icons.date_range, color: Lcolors.primaryColor,size: 30,),
                                        padding: new EdgeInsets.fromLTRB(0, 0, 0, 3),
                                        onPressed: (){
                                      setState(() {
                                        controller.selectDate(context);
                                      });

                                    }
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:const EdgeInsets.all(4.0),
                        child: Container(
                          //color: Colors.amber,
                          margin: EdgeInsets.symmetric(horizontal: 0.0,vertical:5.0),
                          child:  Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Time Slots", style: TextStyle(color: Lcolors.navyColor),),

                              SizedBox(height: 10.0,),
                              Container(
                                //color: Colors.green,
                                child: Container(
                                  padding: EdgeInsets.only(left: 4,right: 4),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey,width: 2),
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: DropdownButton(
                                    dropdownColor: Colors.white,
                                    icon: Icon(Icons.arrow_drop_down),
                                    iconSize: 20,
                                    isExpanded: false,
                                    underline: SizedBox(),
                                    style: TextStyle(color: Lcolors.navyColor, fontSize: 16),
                                    value: controller.timeSlotListModal,
                                    onChanged: (newValue){
                                      controller.timeSlotsLists(newValue);

                                      // setState(() {
                                      //   controller.timeSlotListModal = newValue;
                                      // });
                                    },
                                    items: controller.selectTileSlotLists.map((timeSlotListModals) {
                                      return DropdownMenuItem(
                                        value: timeSlotListModals,
                                        child: Text(timeSlotListModals.timeSlotValue),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount:controller.getAddressResponceModal.customerAddressList.length,
                      //itemCount:controller.getAddressResponceModal.customerAddressList.length,
                      itemBuilder: (BuildContext context,int index){
                        // final item =controller.customerAddressLists[index];
                        //CustomerAddressList customerAddressList = controller.customerAddressLists[index];

                        return Card(
                          margin: EdgeInsets.only(left: 8.0,right: 8.0,top: 8.0),
                          child: RadioListTile(
                            value: controller.getAddressResponceModal.customerAddressList[index].addressId,
                            groupValue: controller.getAddressResponceModal.customerAddressList[index].addressCustomerIdSelected,
                            activeColor: Lcolors.primaryColor,
                            onChanged: (value){
                             // addressCustomerIds = value;
                              controller.addressIdSelected =value;
                              print("^^^^^^^^^^^^^^^^^${controller.addressIdSelected}");
                              //int listLength= controller.customerAddressLists.length;
                              controller.customerAddressLists.forEach((customerAddressModel) {

                                setState(() {
                                  controller.getAddressResponceModal.customerAddressList[index].addressId== value?
                                  controller.getAddressResponceModal.customerAddressList[index].addressCustomerIdSelected=value
                                      : controller.getAddressResponceModal.customerAddressList[index].addressCustomerIdSelected=0;
                                });
                              });
                            },

                          title: Text('${controller.getAddressResponceModal.customerAddressList[index].addressBuildingNoHouseName}${", "}'
                              '${controller.getAddressResponceModal.customerAddressList[index].addressStreet}${", "}'
                              '${controller.getAddressResponceModal.customerAddressList[index].addressLandmark}${", "}'
                              '${controller.getAddressResponceModal.customerAddressList[index].addressCity}${", "}'
                              '${controller.getAddressResponceModal.customerAddressList[index].addressPin}'),


                          subtitle: Text(controller.getAddressResponceModal.customerAddressList[index].addressDefault=="0"?"Default Address":"Home Address"),),
                        );


                        // return Card(
                        //   child: ListTile(
                        //     // leading: Icon(Icons.favorite_border),
                        //     title: Text('${customerAddressList.addressBuildingNoHouseName}${", "}'
                        //         '${customerAddressList.addressStreet}${", "}'
                        //         '${customerAddressList.addressLandmark}${", "}'
                        //         '${customerAddressList.addressCity}${", "}'
                        //         '${customerAddressList.addressPin}'),
                        //     leading: IconButton(
                        //       icon: Icon(
                        //         Icons.radio_button_off,
                        //         color: Lcolors.primaryColor,
                        //       ),
                        //       onPressed: () {
                        //         //Get.to(UpadateAddress());
                        //         //Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()),);
                        //       },
                        //     ),
                        //     subtitle: Text(customerAddressList.addressDefault=="0"?"Default Address":"Home Address"),
                        //     onTap: (){
                        //       //Navigator.push(context, MaterialPageRoute(builder: (context) => OrderDetailsScreen()),);
                        //     },
                        //   ),
                        // );
                      }
                  ),
                ),

                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RaisedButton(
                            onPressed: (){
                          Get.to(AddAddress(),binding: InsertAddressBinding());
                        }, color: Lcolors.primaryColor,
                            //height: 45,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.add,color: Lcolors.whiteColor,
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.to(AddAddress(),binding: InsertAddressBinding());

                                    //Navigator.push(context, MaterialPageRoute(builder: (context) => AddAddress()),);
                                  },
                                  child: new Padding(
                                    padding: new EdgeInsets.symmetric(horizontal: 70),
                                    child: new Text("Add New Address",style: TextStyle(color: Lcolors.whiteColor),),
                                  ),
                                ),
                              ],
                            ),
                            //shape: Border.all(width: 2.0, color: LColors.primaryColor,),
                            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
                        ),

                      ],
                    ),
                  ),
                ),
                SizedBox(height: 40,),
                Container(
                  child: Padding(
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

                            setState(() {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Navigation()),);

                            });
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
                              controller.pickupSchedual(context);

                            }


                        ),
                      ],
                    ),

                  ),
                ),
              ],
            );

          },

        ),
      ),
    );
  }
}
