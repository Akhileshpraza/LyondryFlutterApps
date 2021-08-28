import 'package:demogetx/CommanModual/AppColors/Lcolors.dart';
import 'package:demogetx/ProductModual/Views/home_screen.dart';
import 'package:demogetx/ProductModual/Views/invite_screen.dart';
import 'package:demogetx/ProductModual/Views/order_screen.dart';
import 'package:demogetx/ProductModual/Views/payment_screen.dart';
import 'package:demogetx/ProductModual/Views/profile.dart';
import 'package:demogetx/ProductModual/Views/store_screen.dart';
import 'package:flutter/material.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key key}) : super(key: key);

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {

  int currentTab =0;
  final List<Widget> screen= [
    HomeScreen(),
    OrderScreen(),
    StoresScreen(),
    PaymentScreen(),
    ProfileScreen(),
    InviteScreen(),
  ];
  DateTime currentBackPressTime;
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomeScreen();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()=>Future.value(false),
      child: Scaffold(
        // appBar: AppBar(
        //   automaticallyImplyLeading: false,
        //   title: Container(
        //     //color: Colors.amber,
        //     child: Row(
        //       children: [
        //         Image.asset("assets/images/logo_small.png", fit: BoxFit.cover,),
        //         SizedBox(width: 10,),
        //
        //         Container(height: 35, width: 100,
        //           decoration: BoxDecoration(
        //               borderRadius: BorderRadius.circular(6),
        //               border: Border.all(color: Colors.white)),
        //           child: Row(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             //mainAxisAlignment: MainAxisAlignment.center,
        //             children: [
        //               IconButton(icon: Icon(Icons.supervisor_account_sharp, color: Colors.white,),
        //                 padding: new EdgeInsets.fromLTRB(0, 0, 0, 3),
        //                 onPressed: () {
        //                   // Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()),);
        //                 },
        //               ),
        //               //  Icon(Icons.supervisor_account_sharp),
        //               Container(
        //                 margin: const EdgeInsets.only(top: 5.0),
        //                 child: Text('invite',
        //                   style: TextStyle(color: Colors.white,),
        //                 ),
        //               ),
        //             ],
        //           ),
        //         )
        //       ],
        //     ),
        //   ),
        //
        //   actions: [
        //     IconButton(
        //       icon: Icon(Icons.qr_code, color: Colors.white,),
        //       onPressed: () {
        //         //Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()),);
        //       },
        //     ),
        //
        //     // IconButton(
        //     //   icon: Icon(Icons.notifications, color: Colors.white,),
        //     //   onPressed: () {
        //     //     //Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()),);
        //     //   },
        //     // ),
        //
        //     IconButton(
        //       icon: Icon(Icons.more_vert, color: Colors.white,),
        //       onPressed: () {
        //         //Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()),);
        //       },
        //     ),
        //     // SizedBox(height: 30,),
        //     // Icon(Icons.qr_code,color: Colors.white,),
        //     // SizedBox(height: 30,),
        //     // Icon(Icons.notifications ,color: Colors.white,),
        //     // SizedBox(height: 30,),
        //     // Icon(Icons.more_vert,color: Colors.white,),
        //   ],
        // ),


        body: PageStorage(
          child: currentScreen,
          bucket: bucket,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Lcolors.primaryColor,
          child: Icon(Icons.location_on,color: Colors.white,),

          onPressed: (){
            setState(() {
              currentScreen = StoresScreen();
              currentTab =5;
            });
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          child: Container(
            height: 60,
            child: Row(

              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      minWidth: 40,
                      onPressed: (){
                        setState(() {
                          currentScreen = HomeScreen();
                          currentTab =0;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.home,
                            color: currentTab ==0 ?Colors.cyan : Colors.black26,),
                          Text("Home",style: TextStyle(
                              color: currentTab ==0 ? Colors.cyan : Colors.black26
                          ),)
                        ],
                      ),),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: (){
                        setState(() {
                          currentScreen = OrderScreen();
                          currentTab =1;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.shopping_bag,
                            color: currentTab ==1 ?Colors.cyan : Colors.black26,),
                          Text("Order",style: TextStyle(
                              color: currentTab ==1 ? Colors.cyan : Colors.black26
                          ),)
                        ],
                      ),),
                    //SizedBox(height: 20,),
                    // MaterialButton(
                    //   minWidth: 40,
                    //   onPressed: (){
                    //   },
                    //
                    //   // child: Column(
                    //   //   mainAxisAlignment: MainAxisAlignment.center,
                    //   //   children: [
                    //   //     Padding(
                    //   //       padding: const EdgeInsets.fromLTRB(20, 25,0 , 0),
                    //   //       child: Text("Stores",style: TextStyle(
                    //   //           color: currentTab ==5 ? Colors.cyan : Colors.black26
                    //   //       ),),
                    //   //     )
                    //   //   ],
                    //   // ),
                    // )
                  ],
                ),

                //right side tabs
                MaterialButton(
                  //color: Colors.green,
                  minWidth: 40,
                  onPressed: (){
                  },

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 34,0 , 0),

                        child: Expanded(
                          child: Text("",style: TextStyle(
                              color: currentTab ==5 ? Colors.cyan : Colors.black26
                          ),),
                        ),
                      )
                    ],
                  ),
                ),


                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      minWidth: 40,
                      onPressed: (){
                        setState(() {
                          currentScreen = PaymentScreen();
                          currentTab =2;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.account_balance_wallet,
                            color: currentTab ==2 ?Colors.cyan : Colors.black26,),
                          Text("Payment",style: TextStyle(
                              color: currentTab ==2 ? Colors.cyan : Colors.black26
                          ),)
                        ],
                      ),),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: (){
                        setState(() {
                          currentScreen = ProfileScreen();
                          currentTab =3;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.account_circle,
                            color: currentTab ==3 ?Colors.cyan : Colors.black26,),
                          Text("Profile",style: TextStyle(
                              color: currentTab ==3 ? Colors.cyan : Colors.black26
                          ),)
                        ],
                      ),)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );



  }
}
