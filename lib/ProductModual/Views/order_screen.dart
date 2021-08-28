import 'package:demogetx/CommanModual/AppColors/Lcolors.dart';
import 'package:demogetx/ProductModual/Controllers/order_controller.dart';
import 'package:demogetx/ProductModual/Modals/GetSelecteOrder.dart';
import 'package:demogetx/ProductModual/Views/invite_screen.dart';
import 'package:demogetx/ProductModual/Views/order_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  String orderStatus;
  OrderController orderController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Container(
          //color: Colors.amber,
          child: Row(
            children: [
              Text("Orders",style: TextStyle(color: Lcolors.whiteColor),),

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
      body:
      GetX<OrderController>(
        builder: (controller){
          print("controller  ..........pickupRequestList..................... ${controller.pickupRequestLists != null ? controller.pickupRequestLists.length : 0}");

          return controller.isLoading.isTrue?Center(child: CircularProgressIndicator()):  Container(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount:controller.getSelecteOrderModal.pickupRequestList.length,
                itemBuilder: (BuildContext context,int index){
                  PickupRequestList pickupRequestListModal = controller.pickupRequestLists[index];
                  return Card(
                    child: ListTile(
                      //leading: Icon(Icons.favorite_border),
                      subtitle: Text(controller.getSelecteOrderModal.pickupRequestList[index].pickupRequestStatus),
                      trailing: Text(controller.getSelecteOrderModal.pickupRequestList[index].pickupRequestDate,
                        style: TextStyle(color: Lcolors.primaryColor,fontSize: 15),),
                      title: Text(controller.getSelecteOrderModal.pickupRequestList[index].pickupRequestId.toString()),
                      onTap: (){
                        Get.to(OrderDetailsScreen(orderId:controller.getSelecteOrderModal.pickupRequestList[index].pickupRequestId,
                          orderDate: controller.getSelecteOrderModal.pickupRequestList[index].pickupRequestDate,
                          orderStatus: controller.getSelecteOrderModal.pickupRequestList[index].pickupRequestStatus,),
                            //Second way
                            arguments: [controller.getSelecteOrderModal.pickupRequestList[index].pickupRequestId]);
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => OrderDetailsScreen()),);
                      },
                    ),
                  );
                }
            ),
            // : Center(child: CircularProgressIndicator(),
          );
        },
      ),
      // GetX<OrderController>(
      //   builder: (controller){
      //     print("controller  ..........pickupRequestList..................... ${controller.pickupRequestLists != null ? controller.pickupRequestLists.length : 0}");
      //
      //     return controller.isLoading.isTrue?Center(child: CircularProgressIndicator()):  Container(
      //       child: ListView.builder(
      //           scrollDirection: Axis.vertical,
      //           shrinkWrap: true,
      //           itemCount:controller.pickupRequestLists.length,
      //           itemBuilder: (BuildContext context,int index){
      //             PickupRequestList pickupRequestListModal = controller.pickupRequestLists[index];
      //              return Card(
      //               child: ListTile(
      //                 //leading: Icon(Icons.favorite_border),
      //                 subtitle: Text(pickupRequestListModal.pickupRequestStatus),
      //                 trailing: Text(pickupRequestListModal.pickupRequestDate,
      //                   style: TextStyle(color: Lcolors.primaryColor,fontSize: 15),),
      //                 title: Text(pickupRequestListModal.pickupRequestId.toString()),
      //                 onTap: (){
      //                   Get.to(OrderDetailsScreen(orderId:pickupRequestListModal.pickupRequestId,
      //                     orderDate: pickupRequestListModal.pickupRequestDate,
      //                   orderStatus: pickupRequestListModal.pickupRequestStatus,),
      //                       //Second way
      //                       arguments: [pickupRequestListModal.pickupRequestId]);
      //                   //Navigator.push(context, MaterialPageRoute(builder: (context) => OrderDetailsScreen()),);
      //                 },
      //               ),
      //             );
      //           }
      //        ),
      //       // : Center(child: CircularProgressIndicator(),
      //     );
      //   },
      // ),
    );
  }
}
