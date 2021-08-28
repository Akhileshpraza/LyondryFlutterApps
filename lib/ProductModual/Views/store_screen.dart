import 'package:demogetx/CommanModual/AppColors/Lcolors.dart';
import 'package:demogetx/ProductModual/Controllers/store_controller.dart';
import 'package:demogetx/ProductModual/Modals/SelectStoreResponceModal.dart';
import 'package:demogetx/ProductModual/Views/invite_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class StoresScreen extends StatefulWidget {
  const StoresScreen({Key key}) : super(key: key);

  @override
  _StoresScreenState createState() => _StoresScreenState();
}

class _StoresScreenState extends State<StoresScreen> {
  var valueChoose;
  List listItems = ['Bangalore'];
  var _selectedCity = 'Bangalore';
  var num;

  StoreController storeController = Get.put(StoreController());

  //var controller = Get.put(StoreController());

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
                  "Stores",
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
        body: Container(
          child: Column(
            children: [
              Container(
                //color: Colors.red,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: new EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 10),
                      //color: Colors.amber,
                      child: Text(
                        "Select City",
                        style: TextStyle(
                          color: Lcolors.primaryColor,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          padding: EdgeInsets.only(left: 16, right: 16),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 2),
                              borderRadius: BorderRadius.circular(10)),
                          child: DropdownButton(
                            dropdownColor: Colors.white,
                            icon: Icon(Icons.arrow_drop_down),
                            iconSize: 20,
                            isExpanded: true,
                            underline: SizedBox(),
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            value: _selectedCity,
                            onChanged: (newValue) {
                              setState(() {
                                //_selectedCity = newValue;
                              });
                            },
                            items: listItems.map((valueItems) {
                              return DropdownMenuItem(
                                value: valueItems,
                                child: Text(valueItems),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 400,
                child: GetBuilder<StoreController>(
                  builder: (controller) {
                    print(
                        "controller  ............................... ${controller.storeList != null ? controller.storeList.length : 0}");
                    return controller.storeList != null
                        ? ListView.builder(
                            itemCount: controller.storeList.length,
                            itemBuilder: (BuildContext context, int index) {
                              StoreList storeListModel = controller.storeList[index];
                              return Card(
                                child: ListTile(
                                  // leading: Icon(Icons.favorite_border),
                                  subtitle: Text(storeListModel.storeLocation),
                                  trailing: MaterialButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0))),
                                    elevation: 5.0,
                                    minWidth: 100,
                                    height: 45,
                                    color: Color(0xFF0ECFD1),
                                    child: new Text('Contact now',
                                        style: new TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.white)),
                                    onPressed: () => launch(
                                        "tel:${storeListModel.storePhone}"),
                                  ),

                                  title: Text(storeListModel.storeName),
                                  onTap: () {
                                    //Navigator.push(context, MaterialPageRoute(builder: (context) => OrderDetailsScreen()),);
                                  },
                                ),
                              );
                            })
                        : Center(child: CircularProgressIndicator(),);
                  },
                ),
              ),

              // Column(
              //   children: [
              //     Expanded(child: Obx((){
              //       return controller.isLoading.value ?
              //           Center(child: CircularProgressIndicator(),)
              //     }))
              //     Container(
              //       height: 500,
              //
              //       child: ListView.builder(
              //           itemCount:Provider.of<SelectStoreProvider>(context).selectStore_responce_modal.storeList.length,
              //           itemBuilder: (BuildContext context,int index){
              //             return Card(
              //               child: ListTile(
              //                 // leading: Icon(Icons.favorite_border),
              //                 subtitle: Text(modal.selectStore_responce_modal.storeList[index].storeLocation),
              //                 trailing: MaterialButton(
              //                   shape: RoundedRectangleBorder(
              //                       borderRadius:
              //                       BorderRadius.all(Radius.circular(5.0))),
              //                   elevation: 5.0,
              //                   minWidth: 100,
              //                   height: 45,
              //                   color: Color(0xFF0ECFD1),
              //                   child: new Text('Contact now',
              //                       style: new TextStyle(
              //                           fontSize: 16.0, color: Colors.white)),
              //
              //                   onPressed: () => launch("tel:${modal.selectStore_responce_modal.storeList[index].storePhone}"),),
              //
              //                 title: Text(modal.selectStore_responce_modal.storeList[index].storeName),
              //                 onTap: (){
              //                   //Navigator.push(context, MaterialPageRoute(builder: (context) => OrderDetailsScreen()),);
              //                 },
              //               ),
              //             );
              //           }
              //       ),
              //
              //     ),
              //   ],
              // ),
            ],
          ),
        ));
  }
}
