import 'package:demogetx/CommanModual/AppColors/Lcolors.dart';
import 'package:demogetx/ProductModual/Controllers/display_items_controller.dart';
import 'package:demogetx/ProductModual/Modals/GetSelectPickupCompletedModal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DisplayItemsScreen extends StatefulWidget {
  const DisplayItemsScreen({Key key}) : super(key: key);

  @override
  _DisplayItemsScreenState createState() => _DisplayItemsScreenState();
}

class _DisplayItemsScreenState extends State<DisplayItemsScreen> {
  DisplayItemsController displayItemsController = Get.put(DisplayItemsController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Container(
          //color: Colors.amber,
          child: Row(
            children: [
              Text("Items",style: TextStyle(color: Lcolors.whiteColor),),

              SizedBox(width:40,),

              Container(height: 35, width: 120,
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
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => InviteScreen()),);
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
      body:
      GetBuilder<DisplayItemsController>(
        builder: (controller){
          print("controller  ..........deliveryDetailsLists..................... ${controller.deliveryDetailsLists != null ? controller.deliveryDetailsLists.length : 0}");

          return  Container(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount:controller.deliveryDetailsLists.length,
                itemBuilder: (BuildContext context,int index){
                  DeliveryDetailsList deliveryDetailsListModal = controller.deliveryDetailsLists[index];
                  print("******deliveryDetailsListModal******************${deliveryDetailsListModal.orderDetailsItemName}");
                  return Card(
                    child: ListTile(
                      //leading: Icon(Icons.favorite_border),
                      subtitle: Text(deliveryDetailsListModal.orderDetailsTotalNo.toString()+" Nos"),
                      trailing:Icon(Icons.favorite_border),
                      title: Text(deliveryDetailsListModal.orderDetailsItemName),
                      onTap: (){

                      },
                    ),
                  );
                }
            ),
            // : Center(child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
