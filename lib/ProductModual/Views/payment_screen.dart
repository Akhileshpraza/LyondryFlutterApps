import 'package:demogetx/CommanModual/AppColors/Lcolors.dart';
import 'package:demogetx/ProductModual/Controllers/payment_controller.dart';
import 'package:demogetx/ProductModual/Controllers/store_controller.dart';
import 'package:demogetx/ProductModual/Modals/SelectInvoiceStatusModal.dart';
import 'package:demogetx/ProductModual/Modals/SelectStoreResponceModal.dart';
import 'package:demogetx/ProductModual/Views/invite_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toast/toast.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  //StoreController storeController = Get.put(StoreController());
  PaymentController paymentController = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Container(
              //color: Colors.amber,
              child: Row(
                children: [
                  Text("Peyment"),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 35,
                    width: 105,
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => InviteScreen()),
                            );
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
            automaticallyImplyLeading: false,
            backgroundColor: Lcolors.primaryColor,
            bottom: TabBar(
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(50), // Creates border
                  color: Lcolors.primaryDark1Color),
              indicatorColor: Colors.white,
              tabs: [
                Tab(text: 'PENDING'),
                Tab(text: 'COMPLETED'),
                Tab(text: 'OFFERS'),
              ],
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
          body: GetBuilder<PaymentController>(
            builder: (controllers) {
              if (controllers.InvoiceLists != null) {
                return TabBarView(
                  children: [

                        Center(
                            child: Container(
                                child: ListView.builder(
                                        itemCount: controllers.InvoiceLists.length,
                                        itemBuilder:(BuildContext context, int index) {
                                          InvoiceList invoiceList = controllers.InvoiceLists[index];
                                          return
                                            invoiceList.invoiceStatus == "Delivery Scheduled" ?
                                            Card(
                                            child: ListTile(
                                              // leading: Icon(Icons.favorite_border),
                                              subtitle: Text("Date : ${invoiceList.invoicePickupDate} "),
                                              trailing: MaterialButton(
                                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
                                                  elevation: 5.0,
                                                  minWidth: 100,
                                                  height: 45,
                                                  color: Color(0xFF0ECFD1),
                                                  child: new Text('Pay Now',
                                                      style: new TextStyle(fontSize: 16.0, color: Colors.white)),
                                                  onPressed: () {}),

                                              title: Text(
                                                  "Invoice No : ${invoiceList.invoiceOrderId} "
                                                  "   Rs.${invoiceList.invoiceTotalAmount}"),
                                              onTap: () {
                                                //Navigator.push(context, MaterialPageRoute(builder: (context) => OrderDetailsScreen()),);
                                              },
                                            ),
                                          ):Center(child: Text(""));
                                        })),
                          ),






                        Center(child: Container(
                            child:  ListView.builder(
                                        itemCount: controllers.InvoiceLists.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          InvoiceList invoiceList = controllers.InvoiceLists[index];

                                          return
                                            invoiceList.invoiceStatus =="Delivered"?
                                            Card(child: ListTile(
                                              // leading: Icon(Icons.favorite_border),
                                              subtitle: Text(
                                                  "Date : ${invoiceList.invoicePickupDate} "),
                                              trailing: MaterialButton(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  5.0))),
                                                  elevation: 5.0,
                                                  minWidth: 100,
                                                  height: 45,
                                                  color: Color(0xFF0ECFD1),
                                                  child: new Text('Details',
                                                      style: new TextStyle(
                                                          fontSize: 16.0,
                                                          color: Colors.white)),
                                                  onPressed: () {}),

                                              title: Text(
                                                  "Invoice No :  ${invoiceList.invoiceOrderId} "
                                                  "   Rs.${invoiceList.invoiceTotalAmount}"),
                                              onTap: () {},
                                            ),
                                          ):Center(child: Text(""));
                                        })
                          )),
                    Center(child: Text('Coming Soon')),
                  ],
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
