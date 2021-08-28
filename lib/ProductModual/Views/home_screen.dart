import 'dart:typed_data';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:demogetx/CommanModual/AppColors/Lcolors.dart';
import 'package:demogetx/ProductModual/Controllers/logout_controller.dart';
import 'package:demogetx/ProductModual/Controllers/order_controller.dart';
import 'package:demogetx/ProductModual/Controllers/selecte_services_controller.dart';
import 'package:demogetx/ProductModual/Views/about_us_screen.dart';
import 'package:demogetx/ProductModual/Views/invite_screen.dart';
import 'package:demogetx/ProductModual/Views/schedual_pickup_screen.dart';
import 'package:demogetx/ProductModual/Views/terms_and_conditions.dart';
import 'package:demogetx/Utils/app_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toast/toast.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CarouselSlider carouselSlider;

  ByteData imageData;
  var img;
  var decodedBytes;
  var file;
  var name, mobileNumber, emailid, token;
  String orderStatus;
  List imgList = [
    'assets/images/banner.png',
    'assets/images/banner.png',
    'assets/images/banner.png',
    'assets/images/banner.png',
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  LogoutController logoutController;
  SelecteServicesController selecteServicesController = Get.put(SelecteServicesController());
  OrderController orderController=Get.put(OrderController());


  @override
  void initState() {
    super.initState();
    logoutController = Get.put(LogoutController());
    //selecteServicesController.
    orderController.getSelectOrder();


   // print("*******orderStatus00********${selecteServicesController.orderStatus}");
    //print("*******orderStatus09********${orderController.orderStatus}");

    //print("*******orderStatus*12*******${selecteServicesController.orderStatus.length}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Container(
          //color: Colors.amber,
          child: Row(
            children: [
              Image.asset(
                "assets/images/logo_small.png",
                fit: BoxFit.cover,
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 35,
                width: 100,
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
              Icons.qr_code,
              color: Colors.white,
            ),
            onPressed: () {
              //Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()),);
            },
          ),
          // IconButton(
          //   icon: Icon(Icons.notifications, color: Colors.white,),
          //   onPressed: () {
          //     //Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()),);
          //   },
          // ),
          PopupMenuButton<int>(
            color: Colors.white,
            itemBuilder: (context) =>
            [
              PopupMenuItem<int>(value: 0, child: Text("About us")),
              PopupMenuItem<int>(value: 1, child: Text("Terms of Service")),
              PopupMenuDivider(),
              PopupMenuItem<int>(
                  value: 2,
                  child: Row(
                    children: [
                      Icon(
                        Icons.logout,
                        color: Lcolors.primaryColor,
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Text("Logout")
                    ],
                  )),
            ],
            onSelected: (item) => selectedItem(context, item),
            // IconButton(
            //   icon: Icon(Icons.more_vert, color: Colors.white,),
            //   onPressed: () {
            //     //Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()),);
            //   },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Color(0xFF0ECFD1),
              height: 35,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      AppPreferences.getString(AppPreferences.customerName) ?? "",
                      style: TextStyle(fontSize: 16, color: Lcolors.whiteColor),
                    ),
                  ),
                  Container(
                      child: Text(
                          '+91 ${AppPreferences.getString(
                              AppPreferences.customerMobileNo) ?? ""}',
                          style: TextStyle(
                              fontSize: 16, color: Lcolors.whiteColor))),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  GetBuilder<SelecteServicesController>(
                    builder: (controllers){
                   return  Container(
                        // child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            CarouselSlider(
                                items: imgList.map((imgUrl) {
                                  return Builder(
                                    builder: (BuildContext context) {
                                      return Container(
                                        width: MediaQuery
                                            .of(context)
                                            .size
                                            .width,
                                        margin:
                                        EdgeInsets.symmetric(horizontal: 10.0),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: Image.asset(imgUrl, fit: BoxFit.fill,
                                        ),
                                      );
                                    },
                                  );
                                }).toList(),
                                options: CarouselOptions(
                                  height: 120,
                                  aspectRatio: 16 / 9,
                                  viewportFraction: 0.8,
                                  initialPage: 0,
                                  enableInfiniteScroll: true,
                                  reverse: false,
                                  autoPlay: true,
                                  autoPlayInterval: Duration(seconds: 3),
                                  autoPlayAnimationDuration:
                                  Duration(milliseconds: 2000),
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  enlargeCenterPage: true,
                                  //onPageChanged: callbackFunction,
                                  scrollDirection: Axis.horizontal,
                                ))
                          ],
                        ),
                        //),
                      );
                    },

                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: new EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
              //color: Colors.amber,
              child: new MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
                elevation: 10.0,
                minWidth: 355.0,
                height: 40,
                color: Color(0xFF0ECFD1),
                child: new Text('Schedule a Pickup',
                    style: new TextStyle(fontSize: 16.0, color: Colors.white)),
                onPressed: () {
                  Get.to(SchedualePickup());
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => SchedualePickup()),);
                  // setState(() {
                  //   _isNeedHelp = true;
                  // });
                },
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: new EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
              //color: Colors.amber,
              child: Text(
                "Services",
                style: TextStyle(
                  color: Lcolors.primaryColor,
                  fontSize: 16,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              height: 225,
              //color: Colors.red,
              child: GetBuilder<SelecteServicesController>(
                builder: (controller) {
                  return GridView.count(
                    crossAxisCount: 3,
                    children:
                    List.generate(controller.servicesList.length, (index) {
                      // print(
                      //     "...............................${controller.servicesList[0].serviceIcon}");

                      return Center(
                          child: Column(
                            children: [
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100.0),
                                  side: BorderSide(color: Colors.white70, width: 1)),
                                child: Container(

                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Image.memory((controller.servicesList[index].serviceIcon) ?? "",
                                      height: 35,
                                      width: 35,
                                    ),
                                  ),
                                ),
                              ),
                              Text(controller.servicesList[index].serviceName ??
                                  "")
                            ],
                          ));
                    }),
                  );
                },
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: new EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
              //color: Colors.amber,
              child: Text("Recent order Status", style: TextStyle(color: Lcolors.primaryColor, fontSize: 16,), textAlign: TextAlign.left,
              ),
            ),
            Container(
              height: 100,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ListView(
                    // This next line does the trick.
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        width: 160.0,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            //*********Schedual
                            orderController.orderStatus ==null?Icon(Icons.check_circle):
                            ((orderController.orderStatus == "Schedule"?Icon(Icons.check_circle, color: Lcolors.primaryColor):
                            (orderController.orderStatus == "Accepted"?Icon(Icons.check_circle, color: Lcolors.primaryColor):
                            (orderController.orderStatus == "Pickup"?Icon(Icons.check_circle, color: Lcolors.primaryColor):
                            (orderController.orderStatus == "Pickup Completed"?Icon(Icons.check_circle, color: Lcolors.primaryColor):
                            (orderController.orderStatus == "Lyondry"?Icon(Icons.check_circle, color: Lcolors.primaryColor):
                            (orderController.orderStatus == "Pickup Completed"?Icon(Icons.check_circle, color: Lcolors.primaryColor):
                            (orderController.orderStatus == "Delivery Scheduled"?Icon(Icons.check_circle, color: Lcolors.primaryColor):
                            (orderController.orderStatus == "Delivered"?Icon(Icons.check_circle, color: Lcolors.primaryColor):
                            Icon(Icons.check_circle)))))))))),

                            SizedBox(
                              height: 10,
                            ),

                            orderController.orderStatus==null?Text("Schedule", style: TextStyle(color: Lcolors.blackgtgray)):
                            ((orderController.orderStatus == "Schedule"?Text("Schedule", style: TextStyle(color: Lcolors.primaryColor)):
                            (orderController.orderStatus == "Accepted"?Text("Schedule", style: TextStyle(color: Lcolors.primaryColor)):
                            (orderController.orderStatus == "Pickup"?Text("Schedule", style: TextStyle(color: Lcolors.primaryColor)):
                            (orderController.orderStatus == "Pickup Completed"?Text("Schedule", style: TextStyle(color: Lcolors.primaryColor)):
                            (orderController.orderStatus == "Lyondry"?Text("Schedule", style: TextStyle(color: Lcolors.primaryColor)):
                            (orderController.orderStatus == "Pickup Completed"?Text("Schedule", style: TextStyle(color: Lcolors.primaryColor)):
                            (orderController.orderStatus == "Delivery Scheduled"?Text("Schedule", style: TextStyle(color: Lcolors.primaryColor)):
                            (orderController.orderStatus == "Delivered"?Text("Schedule", style: TextStyle(color: Lcolors.primaryColor)):
                            Text("Schedule", style: TextStyle(color: Lcolors.blackgtgray))))))))))),

                          ],
                        ),
                      ),
                      Container(
                        width: 160.0,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),

                            //Accepted

                            orderController.orderStatus ==null?Icon(Icons.check_circle):
                            ((orderController.orderStatus == "Schedule"?Icon(Icons.check_circle):
                            (orderController.orderStatus == "Accepted"?Icon(Icons.check_circle, color: Lcolors.primaryColor):
                            (orderController.orderStatus == "Pickup"?Icon(Icons.check_circle, color: Lcolors.primaryColor):
                            (orderController.orderStatus == "Pickup Completed"?Icon(Icons.check_circle, color: Lcolors.primaryColor):
                            (orderController.orderStatus == "Lyondry"?Icon(Icons.check_circle, color: Lcolors.primaryColor):
                            (orderController.orderStatus == "Pickup Completed"?Icon(Icons.check_circle, color: Lcolors.primaryColor):
                            (orderController.orderStatus == "Delivery Scheduled"?Icon(Icons.check_circle, color: Lcolors.primaryColor):
                            (orderController.orderStatus == "Delivered"?Icon(Icons.check_circle, color: Lcolors.primaryColor):
                            Icon(Icons.check_circle)))))))))),

                            SizedBox(
                              height: 10,
                            ),
                            orderController.orderStatus==null?Text("Accepted", style: TextStyle(color: Lcolors.blackgtgray)):
                            ((orderController.orderStatus == "Schedule"?Text("Accepted", style: TextStyle(color: Lcolors.blackgtgray)):
                            (orderController.orderStatus == "Accepted"?Text("Accepted", style: TextStyle(color: Lcolors.primaryColor)):
                            (orderController.orderStatus == "Pickup"?Text("Accepted", style: TextStyle(color: Lcolors.primaryColor)):
                            (orderController.orderStatus == "Pickup Completed"?Text("Accepted", style: TextStyle(color: Lcolors.primaryColor)):
                            (orderController.orderStatus == "Lyondry"?Text("Accepted", style: TextStyle(color: Lcolors.primaryColor)):
                            (orderController.orderStatus == "Pickup Completed"?Text("Accepted", style: TextStyle(color: Lcolors.primaryColor)):
                            (orderController.orderStatus == "Delivery Scheduled"?Text("Accepted", style: TextStyle(color: Lcolors.primaryColor)):
                            (orderController.orderStatus == "Delivered"?Text("Accepted", style: TextStyle(color: Lcolors.primaryColor)):
                            Text("Accepted", style: TextStyle(color: Lcolors.blackgtgray))))))))))),

                          ],
                        ),
                      ),
                      Container(
                        width: 160.0,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            //*********pickup

                            orderController.orderStatus ==null?Icon(Icons.check_circle):
                            ((orderController.orderStatus == "Schedule"?Icon(Icons.check_circle):
                            (orderController.orderStatus == "Accepted"?Icon(Icons.check_circle):
                            (orderController.orderStatus == "Pickup"?Icon(Icons.check_circle, color: Lcolors.primaryColor):
                            (orderController.orderStatus == "Pickup Completed"?Icon(Icons.check_circle, color: Lcolors.primaryColor):
                            (orderController.orderStatus == "Lyondry"?Icon(Icons.check_circle, color: Lcolors.primaryColor):
                            (orderController.orderStatus == "Pickup Completed"?Icon(Icons.check_circle, color: Lcolors.primaryColor):
                            (orderController.orderStatus == "Delivery Scheduled"?Icon(Icons.check_circle, color: Lcolors.primaryColor):
                            (orderController.orderStatus == "Delivered"?Icon(Icons.check_circle, color: Lcolors.primaryColor):
                            Icon(Icons.check_circle)))))))))),

                            SizedBox(
                              height: 10,
                            ),

                            orderController.orderStatus==null?Text("Pickup", style: TextStyle(color: Lcolors.blackgtgray)):
                            ((orderController.orderStatus == "Schedule"?Text("Pickup", style: TextStyle(color: Lcolors.blackgtgray)):
                            (orderController.orderStatus == "Accepted"?Text("Pickup", style: TextStyle(color: Lcolors.blackgtgray)):
                            (orderController.orderStatus == "Pickup"?Text("Pickup", style: TextStyle(color: Lcolors.primaryColor)):
                            (orderController.orderStatus == "Pickup Completed"?Text("Pickup", style: TextStyle(color: Lcolors.primaryColor)):
                            (orderController.orderStatus == "Lyondry"?Text("Pickup", style: TextStyle(color: Lcolors.primaryColor)):
                            (orderController.orderStatus == "Pickup Completed"?Text("Pickup", style: TextStyle(color: Lcolors.primaryColor)):
                            (orderController.orderStatus == "Delivery Scheduled"?Text("Pickup", style: TextStyle(color: Lcolors.primaryColor)):
                            (orderController.orderStatus == "Delivered"?Text("Pickup", style: TextStyle(color: Lcolors.primaryColor)):
                            Text("Pickup", style: TextStyle(color: Lcolors.blackgtgray))))))))))),

                          ],
                        ),
                      ),
                      Container(
                        width: 160.0,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            //*********pickup completed

                            orderController.orderStatus ==null?Icon(Icons.check_circle):
                            ((orderController.orderStatus == "Schedule"?Icon(Icons.check_circle):
                            (orderController.orderStatus == "Accepted"?Icon(Icons.check_circle):
                            (orderController.orderStatus == "Pickup"?Icon(Icons.check_circle):
                            (orderController.orderStatus == "Pickup Completed"?Icon(Icons.check_circle, color: Lcolors.primaryColor):
                            (orderController.orderStatus == "Lyondry"?Icon(Icons.check_circle, color: Lcolors.primaryColor):
                            (orderController.orderStatus == "Pickup Completed"?Icon(Icons.check_circle, color: Lcolors.primaryColor):
                            (orderController.orderStatus == "Delivery Scheduled"?Icon(Icons.check_circle, color: Lcolors.primaryColor):
                            (orderController.orderStatus == "Delivered"?Icon(Icons.check_circle, color: Lcolors.primaryColor):
                            Icon(Icons.check_circle)))))))))),

                            SizedBox(height: 10,),

                            orderController.orderStatus==null?Text("Pickup Completed", style: TextStyle(color: Lcolors.blackgtgray)):
                            ((orderController.orderStatus == "Schedule"?Text("Pickup Completed", style: TextStyle(color: Lcolors.blackgtgray)):
                            (orderController.orderStatus == "Accepted"?Text("Pickup Completed", style: TextStyle(color: Lcolors.blackgtgray)):
                            (orderController.orderStatus == "Pickup"?Text("Pickup Completed", style: TextStyle(color: Lcolors.blackgtgray)):
                            (orderController.orderStatus == "Pickup Completed"?Text("Pickup Completed", style: TextStyle(color: Lcolors.primaryColor)):
                            (orderController.orderStatus == "Lyondry"?Text("Pickup Completed", style: TextStyle(color: Lcolors.primaryColor)):
                            (orderController.orderStatus == "Pickup Completed"?Text("Pickup Completed", style: TextStyle(color: Lcolors.primaryColor)):
                            (orderController.orderStatus == "Delivery Scheduled"?Text("Pickup Completed", style: TextStyle(color: Lcolors.primaryColor)):
                            (orderController.orderStatus == "Delivered"?Text("Pickup Completed", style: TextStyle(color: Lcolors.primaryColor)):
                            Text("Pickup Completed", style: TextStyle(color: Lcolors.blackgtgray))))))))))),

                          ],
                        ),
                      ),
                      Container(
                        width: 160.0,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            //*********Lyondy

                            orderController.orderStatus ==null?Icon(Icons.check_circle):
                            ((orderController.orderStatus == "Schedule"?Icon(Icons.check_circle):
                            (orderController.orderStatus == "Accepted"?Icon(Icons.check_circle):
                            (orderController.orderStatus == "Pickup"?Icon(Icons.check_circle):
                            (orderController.orderStatus == "Pickup Completed"?Icon(Icons.check_circle):
                            (orderController.orderStatus == "Lyondry"?Icon(Icons.check_circle, color: Lcolors.primaryColor):
                            (orderController.orderStatus == "Pickup Completed"?Icon(Icons.check_circle, color: Lcolors.primaryColor):
                            (orderController.orderStatus == "Delivery Scheduled"?Icon(Icons.check_circle, color: Lcolors.primaryColor):
                            (orderController.orderStatus == "Delivered"?Icon(Icons.check_circle, color: Lcolors.primaryColor):
                            Icon(Icons.check_circle)))))))))),

                            SizedBox(
                              height: 10,
                            ),

                            orderController.orderStatus==null?Text("Lyondry", style: TextStyle(color: Lcolors.blackgtgray)):
                            ((orderController.orderStatus == "Schedule"?Text("Lyondry", style: TextStyle(color: Lcolors.blackgtgray)):
                            (orderController.orderStatus == "Accepted"?Text("Lyondry", style: TextStyle(color: Lcolors.blackgtgray)):
                            (orderController.orderStatus == "Pickup"?Text("Lyondry", style: TextStyle(color: Lcolors.blackgtgray)):
                            (orderController.orderStatus == "Pickup Completed"?Text("Lyondry", style: TextStyle(color: Lcolors.blackgtgray)):
                            (orderController.orderStatus == "Lyondry"?Text("Lyondry", style: TextStyle(color: Lcolors.primaryColor)):
                            (orderController.orderStatus == "Pickup Completed"?Text("Lyondry", style: TextStyle(color: Lcolors.primaryColor)):
                            (orderController.orderStatus == "Delivery Scheduled"?Text("Lyondry", style: TextStyle(color: Lcolors.primaryColor)):
                            (orderController.orderStatus == "Delivered"?Text("Lyondry", style: TextStyle(color: Lcolors.primaryColor)):
                            Text("Lyondry", style: TextStyle(color: Lcolors.blackgtgray))))))))))),

                          ],
                        ),
                      ),
                      Container(
                        width: 160.0,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            //*********Delivery Scheduled

                            orderController.orderStatus ==null?Icon(Icons.check_circle):
                            ((orderController.orderStatus == "Schedule"?Icon(Icons.check_circle):
                            (orderController.orderStatus == "Accepted"?Icon(Icons.check_circle):
                            (orderController.orderStatus == "Pickup"?Icon(Icons.check_circle):
                            (orderController.orderStatus == "Pickup Completed"?Icon(Icons.check_circle):
                            (orderController.orderStatus == "Lyondry"?Icon(Icons.check_circle):
                            (orderController.orderStatus == "Pickup Completed"?Icon(Icons.check_circle):
                            (orderController.orderStatus == "Delivery Scheduled"?Icon(Icons.check_circle, color: Lcolors.primaryColor):
                            (orderController.orderStatus == "Delivered"?Icon(Icons.check_circle, color: Lcolors.primaryColor):
                            Icon(Icons.check_circle)))))))))),

                            SizedBox(
                              height: 10,
                            ),

                            orderController.orderStatus==null?Text("Delivery Scheduled", style: TextStyle(color: Lcolors.blackgtgray)):
                            ((orderController.orderStatus == "Schedule"?Text("Delivery Scheduled", style: TextStyle(color: Lcolors.blackgtgray)):
                            (orderController.orderStatus == "Accepted"?Text("Delivery Scheduled", style: TextStyle(color: Lcolors.blackgtgray)):
                            (orderController.orderStatus == "Pickup"?Text("Delivery Scheduled", style: TextStyle(color: Lcolors.blackgtgray)):
                            (orderController.orderStatus == "Pickup Completed"?Text("Delivery Scheduled", style: TextStyle(color: Lcolors.blackgtgray)):
                            (orderController.orderStatus == "Lyondry"?Text("Delivery Scheduled", style: TextStyle(color: Lcolors.blackgtgray)):
                            (orderController.orderStatus == "Pickup Completed"?Text("Delivery Scheduled", style: TextStyle(color: Lcolors.blackgtgray)):
                            (orderController.orderStatus == "Delivery Scheduled"?Text("Delivery Scheduled", style: TextStyle(color: Lcolors.primaryColor)):
                            (orderController.orderStatus == "Delivered"?Text("Delivery Scheduled", style: TextStyle(color: Lcolors.primaryColor)):
                            Text("Delivery Scheduled", style: TextStyle(color: Lcolors.blackgtgray))))))))))),

                          ],
                        ),
                      ),
                      Container(
                        width: 160.0,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            //*********Delivery


                            orderController.orderStatus==null?Icon(Icons.check_circle):
                            (orderController.orderStatus == "Delivered"? Icon(Icons.check_circle, color: Lcolors.primaryColor):
                            Icon(Icons.check_circle)),
                            SizedBox(
                              height: 10,
                            ),
                            orderController.orderStatus==null?Text("Delivered", style: TextStyle(color: Lcolors.blackgtgray)):
                            (orderController.orderStatus == "Delivered"? Text("Delivered", style: TextStyle(color: Lcolors.primaryColor)):
                            Text("Delivered", style: TextStyle(color: Lcolors.blackgtgray))),


                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            )
          ],
        ),
      ),
    );
  }

  void selectedItem(BuildContext context, item) {
    switch (item) {
      case 0:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => AboutUsScreen()));
        print("About us");
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => TermsAndConditionsScreen()));
        print("Terms of Service");
        break;
      case 2:
        print("User Logged out");
        Toast.show("User Logged out", context);
        logoutController.userLogout(context);
        break;
    }
  }
}
