import 'package:demogetx/ApiServices/Invoice/customer.dart';
import 'package:demogetx/ApiServices/Invoice/invoice.dart';
import 'package:demogetx/ApiServices/Invoice/pdf_api.dart';
import 'package:demogetx/ApiServices/Invoice/pdf_invoice_api.dart';
import 'package:demogetx/ApiServices/Invoice/supplier.dart';
import 'package:demogetx/ApiServices/Invoice/terms_conditions.dart';
import 'package:demogetx/CommanModual/AppColors/Lcolors.dart';
import 'package:demogetx/ProductModual/Controllers/order_details_controller.dart';
import 'package:demogetx/ProductModual/Modals/OrderTraking.dart';
import 'package:demogetx/ProductModual/Views/display_items_screen.dart';
import 'package:demogetx/ProductModual/Views/feedback_screen.dart';
import 'package:demogetx/ProductModual/Views/invite_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';

class OrderDetailsScreen extends StatefulWidget {
  final int orderId;
  final String orderDate;
  final String orderStatus;

  const OrderDetailsScreen(
      {Key key, this.orderId, this.orderDate, this.orderStatus})
      : super(key: key);

  @override
  _OrderDetailsScreenState createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  OrderDetailsController orderDetailsController =
      Get.put(OrderDetailsController());

  OrderTrackingList orderTakingL;
  bool status = true;
  var orderStatus,orderInvoiceNo;

  @override
  void initState() {
    super.initState();
  }

  void buttonEnabled(){
    if(orderTakingL.trackingStatus == "ReSchedule"){
        status = false;
    }
  }

  void onPresseItems(){
    orderStatus = orderDetailsController.trackingStatus;
    print("*******orderStatus***************$orderStatus");
    switch(orderStatus) {
      case "Pickup Completed": {
        print("Pickup Completed");
        Get.to(DisplayItemsScreen(),arguments: [orderDetailsController.pickupByName,orderDetailsController.pickupSchedulePickupRequestId]);
      }
      break;

      case "Laundry": {  print("laundry");
      Get.to(DisplayItemsScreen(),arguments: [orderDetailsController.pickupByName,orderDetailsController.pickupSchedulePickupRequestId]);

      }
      break;

      case "Delivery Scheduled": {  print("deliveryScheduled");
      Get.to(DisplayItemsScreen(),arguments: [orderDetailsController.pickupByName,orderDetailsController.pickupSchedulePickupRequestId]);
      }
      break;

      case "Delivered": {  print("delivered");
      Get.to(DisplayItemsScreen(),arguments: [orderDetailsController.pickupByName,orderDetailsController.pickupSchedulePickupRequestId]);

      }
      break;

      default: { print("Pickup Not Completed");
      Toast.show("Pickup Not Completed", context);}
      break;
    }
  }

  void onPresseCancel(){
    orderStatus = orderDetailsController.trackingStatus;

    switch(orderStatus) {
      case "Schedule": {
        print("Schedule");
        Get.back();
        orderDetailsController.updateStatusCancel();

        Toast.show("Schedule", context);
      }
      break;

      case "Accepted": {  print("Accepted");
      Get.back();
      orderDetailsController.updateStatusCancel();
      Toast.show("Accepted", context);
      }
      break;

      case "Pickup": {  print("Pickup");
      Get.back();
      orderDetailsController.updateStatusCancel();
      Toast.show("Pickup", context);
      }
      break;

      default: { print("Cancel Not clicked");
      Toast.show("Cancel Not clicked", context);}
      break;
    }
  }

  void onPresseAccepted(){
    orderStatus = orderDetailsController.trackingStatus;

    switch(orderStatus) {
      case "Re Scheduled": {
        print("Re Scheduled");
        Get.back();
        orderDetailsController.updateStatusAccept();
        Toast.show("Schedule Accepted", context);
      }
      break;

      default: { print("Accepted not clickable");
      Toast.show("Accepted not clickable ", context);}
      break;
    }
  }

  void onPresseFeedback(){
    orderStatus = orderDetailsController.trackingStatus;

    switch(orderStatus) {
      case "Delivered": {
        print("Delivered");
        Get.to(FeedBackScreen(invoiceNo:orderDetailsController.invoiceNo,),
          arguments: [orderDetailsController.orderId,orderDetailsController.invoiceNo],
        );
        Toast.show("FeedBack", context);
      }
      break;

      default: { print("Feedack not clickable");
      Toast.show("FeedBack not clickable ", context);}
      break;
    }
  }

  void onPresseInvoice() async {
    orderStatus = orderDetailsController.trackingStatus;

    print("************orderInvoiceNo*******************$orderInvoiceNo");

    switch(orderStatus) {
      case "Delivery Scheduled": {
        print("Delivered");
        final date = DateTime.now();
        final dueDate = date.add(Duration(days: 7));
        final invoice = Invoice(
          supplier: Supplier(
            title: "TAX INVOICE",
            subTitle:'LYONDRY (A Unit of Bapuji Surgicals)',
            secondSubTitle: 'Hygiene Fabric & Shoe Care',
            address:'#301, Lyon Square Ground Floor, 14th B Cross, 7th Main, 6th Sector,',
            subAddress: 'HSR Layout, Bangalore - 560102, Karnataka, India.',
            name: 'PH No. : +91 6364248484 GSTIN No. : 29AIVPA2986J1ZJ PAN No. : AIVPA2986J',
          ),
          customer: Customer(
            name: 'Apple Inc.',
            address: 'Apple Street, Cupertino, CA 95014',
          ),
          info: InvoiceInfo(
              customer: orderDetailsController.invoiceMaster.invoiceCustomerCode,
              address: orderDetailsController.invoiceMaster.invoiceCustomerAddress,
              city: 'Bangalore',
              uinqueId: orderDetailsController.invoiceMaster.invoiceCustomerGstNo,
              contactNo: orderDetailsController.invoiceMaster.invoiceCustomerMobileNo,
              emailId: orderDetailsController.customerEmailid,
              gstInvoiceNo:orderDetailsController.invoiceMaster.invoiceNo,
              gstInvoiceDate:orderDetailsController.invoiceMaster.invoiceDateString,
              estimatedDeliveryDate: orderDetailsController.invoiceMaster.invoiceDueDate,
              servicedBy: orderDetailsController.invoiceMaster.invoicePickupBy
          ),
          termsConditionss: TermsConditionss(
              invoiceNetAmount: orderDetailsController.invoiceMaster.invoiceNetAmount,
              invoiceDiscountPercentage: orderDetailsController.invoiceMaster.invoiceDiscountPercentage,
              invoiceDiscountAmount: orderDetailsController.invoiceMaster.invoiceDiscountAmount,
              invoiceTaxPercentage: orderDetailsController.invoiceMaster.invoiceTaxPercentage,

              invoiceCgst: orderDetailsController.invoiceMaster.invoiceCgst,
              invoiceSgst: orderDetailsController.invoiceMaster.invoiceSgst,
              invoiceIgst: orderDetailsController.invoiceMaster.invoiceIgst,
              invoiceTotalTax: orderDetailsController.invoiceMaster.invoiceTotalTax,
              invoiceRoundOff: orderDetailsController.invoiceMaster.invoiceRoundOff,
              invoiceTotalAmount: orderDetailsController.invoiceMaster.invoiceTotalAmount

          ),

          // items: ListView.builder(
          //           itemCount: controllers.gridTranList.length,
          //           itemBuilder: (BuildContext context, int index){
          //           GridTran gridTranModel=controllers.gridTranList.elementAt(index);
          //
          //           return Container(
          //               InvoiceItem(
          //                 sNo: gridTranModel.invoiceTranSlNo,
          //                 description: gridTranModel.invoiceTranDescription,
          //                 hsnsan: gridTranModel.invoiceTranHsnsac,
          //                 quantity: gridTranModel.invoiceTranItemNos,
          //                 umo: gridTranModel.invoiceTranUom,
          //                 price: gridTranModel.invoiceTranItemUnitPrice,
          //                 taxableValue: gridTranModel.invoiceTranTotalTax,
          //               )
          //           );
          //         });


          items: [InvoiceItem(
              sNo: 1,
              description: 'Ladies Top - Dry Cleaning - Folded - None',
              hsnsan: "00999712",
              umo: 'PCS',
              quantity: 3.0,
              price: 59.99,
              taxableValue: 182.18
          ),
            InvoiceItem(
                sNo: 2,
                description: 'Ladies Top - Dry Cleaning - Folded - None',
                hsnsan: "00999712",
                umo: 'PCS',
                quantity: 3.0,
                price: 59.99,
                taxableValue: 182.18
            ),
            InvoiceItem(
                sNo: 3,
                description: 'Ladies Top - Dry Cleaning - Folded - None',
                hsnsan: "00999712",
                umo: 'PCS',
                quantity: 3.0,
                price: 59.99,
                taxableValue: 182.18
            ),
          ],
        );

        final pdfFile = await PdfInvoiceApi.generate(invoice);

        PdfApi.openFile(pdfFile);
        //Toast.show("Invoice not Generate", context);
      }
      break;

      case "Delivered": {  ;
      final date = DateTime.now();
      final dueDate = date.add(Duration(days: 7));
      final invoice = Invoice(
        supplier: Supplier(
          title: "TAX INVOICE",
          subTitle:'LYONDRY (A Unit of Bapuji Surgicals)',
          secondSubTitle: 'Hygiene Fabric & Shoe Care',
          address:'#301, Lyon Square Ground Floor, 14th B Cross, 7th Main, 6th Sector,',
          subAddress: 'HSR Layout, Bangalore - 560102, Karnataka, India.',
          name: 'PH No. : +91 6364248484 GSTIN No. : 29AIVPA2986J1ZJ PAN No. : AIVPA2986J',
        ),
        customer: Customer(
          name: 'Apple Inc.',
          address: 'Apple Street, Cupertino, CA 95014',
        ),
        info: InvoiceInfo(
            customer: orderDetailsController.invoiceMaster.invoiceCustomerCode,
            address: orderDetailsController.invoiceMaster.invoiceCustomerAddress,
            city: 'Bangalore',
            uinqueId: orderDetailsController.invoiceMaster.invoiceCustomerGstNo,
            contactNo: orderDetailsController.invoiceMaster.invoiceCustomerMobileNo,
            emailId: orderDetailsController.customerEmailid,
            gstInvoiceNo:orderDetailsController.invoiceMaster.invoiceNo,
            gstInvoiceDate:orderDetailsController.invoiceMaster.invoiceDateString,
            estimatedDeliveryDate: orderDetailsController.invoiceMaster.invoiceDueDate,
            servicedBy: orderDetailsController.invoiceMaster.invoicePickupBy
        ),
        termsConditionss: TermsConditionss(
            invoiceNetAmount: orderDetailsController.invoiceMaster.invoiceNetAmount,
            invoiceDiscountPercentage: orderDetailsController.invoiceMaster.invoiceDiscountPercentage,
            invoiceDiscountAmount: orderDetailsController.invoiceMaster.invoiceDiscountAmount,
            invoiceTaxPercentage: orderDetailsController.invoiceMaster.invoiceTaxPercentage,

            invoiceCgst: orderDetailsController.invoiceMaster.invoiceCgst,
            invoiceSgst: orderDetailsController.invoiceMaster.invoiceSgst,
            invoiceIgst: orderDetailsController.invoiceMaster.invoiceIgst,
            invoiceTotalTax: orderDetailsController.invoiceMaster.invoiceTotalTax,
            invoiceRoundOff: orderDetailsController.invoiceMaster.invoiceRoundOff,
            invoiceTotalAmount: orderDetailsController.invoiceMaster.invoiceTotalAmount

        ),

        // items: ListView.builder(
        //           itemCount: controllers.gridTranList.length,
        //           itemBuilder: (BuildContext context, int index){
        //           GridTran gridTranModel=controllers.gridTranList.elementAt(index);
        //
        //           return Container(
        //               InvoiceItem(
        //                 sNo: gridTranModel.invoiceTranSlNo,
        //                 description: gridTranModel.invoiceTranDescription,
        //                 hsnsan: gridTranModel.invoiceTranHsnsac,
        //                 quantity: gridTranModel.invoiceTranItemNos,
        //                 umo: gridTranModel.invoiceTranUom,
        //                 price: gridTranModel.invoiceTranItemUnitPrice,
        //                 taxableValue: gridTranModel.invoiceTranTotalTax,
        //               )
        //           );
        //         });


        items: [InvoiceItem(
            sNo: 1,
            description: 'Ladies Top - Dry Cleaning - Folded - None',
            hsnsan: "00999712",
            umo: 'PCS',
            quantity: 3.0,
            price: 59.99,
            taxableValue: 182.18
        ),
          InvoiceItem(
              sNo: 2,
              description: 'Ladies Top - Dry Cleaning - Folded - None',
              hsnsan: "00999712",
              umo: 'PCS',
              quantity: 3.0,
              price: 59.99,
              taxableValue: 182.18
          ),
          InvoiceItem(
              sNo: 3,
              description: 'Ladies Top - Dry Cleaning - Folded - None',
              hsnsan: "00999712",
              umo: 'PCS',
              quantity: 3.0,
              price: 59.99,
              taxableValue: 182.18
          ),
        ],
      );

      final pdfFile = await PdfInvoiceApi.generate(invoice);

      PdfApi.openFile(pdfFile);
        //Toast.show("FeedBack", context);
      }

      //aToast.show("Invoice not Generate", context);
      break;

      default: { print("Invoice not Generate");
      Toast.show("Invoice not Generate", context);}
      break;
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Container(
          //color: Colors.amber,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Details", style: TextStyle(color: Lcolors.whiteColor),),
              SizedBox(width: 20,),
              Container(
                height: 35,
                width: 110,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: Colors.white)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.supervisor_account_sharp,
                        color: Colors.white,
                      ),
                      padding: new EdgeInsets.fromLTRB(0, 0, 0, 3),
                      onPressed: () {
                        Get.to(InviteScreen());
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => InviteScreen()),);
                      },
                    ),
                    //  Icon(Icons.supervisor_account_sharp),
                    Container(
                      margin: const EdgeInsets.only(top: 5.0),
                      child: Text('invite', style: TextStyle(color: Colors.white,),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            GetBuilder<OrderDetailsController>(
              builder: (controllers){
                return Card(
                  child: Column(
                    children: [
                      Container(
                        //margin: EdgeInsets.only(top: 20),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Order Id :",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Lcolors.navyColor),
                              ),
                              Text(widget.orderId.toString(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Lcolors.navyColor)),

                              MaterialButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(5.0))),
                                  elevation: 5.0,
                                  minWidth: 100,
                                  height: 45,
                                  color: Color(0xFF0ECFD1),
                                  child: new Text('Invoice',
                                      style: new TextStyle(
                                          fontSize: 16.0, color: Colors.white)),
                                  onPressed: () async {

                                    onPresseInvoice();

                                  }),
                            ],
                          ),
                        ),
                      ),


                      Container(
                        //margin: EdgeInsets.only(top: 20),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Invoice No :",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Lcolors.navyColor),
                              ),
                              Container(
                                  margin: EdgeInsets.symmetric(horizontal: 25),
                                  child: Text(
                                      orderDetailsController.invoiceNo ?? "0",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Lcolors.navyColor))),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        //margin: EdgeInsets.only(top: 20),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Pickup Date:",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Lcolors.navyColor),
                              ),
                              Container(
                                  margin: EdgeInsets.symmetric(horizontal: 50),
                                  child: Text(widget.orderDate.toString(),
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Lcolors.navyColor))),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        //margin: EdgeInsets.only(top: 20),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Pickup By :",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Lcolors.navyColor),
                              ),
                              Container(
                                  margin: EdgeInsets.symmetric(horizontal: 30),
                                  child: Row(
                                    children: [

                                      Text(
                                          orderDetailsController.pickupByName??"Name",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Lcolors.navyColor)),
                                      IconButton(
                                        icon: Icon(
                                          Icons.call,
                                          color: Lcolors.primaryColor,
                                        ),
                                        onPressed: () => launch(
                                            orderDetailsController.pickupByMobile==null?"":
                                            "tel:${orderDetailsController.pickupByMobile}"),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        //margin: EdgeInsets.only(top: 20),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total Amount:",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Lcolors.navyColor),
                              ),
                              Container(
                                  margin: EdgeInsets.symmetric(horizontal: 60),
                                  child: Text(
                                      "Rs  ${orderDetailsController.totalAmount ?? "0"}",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Lcolors.navyColor))),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        //margin: EdgeInsets.only(top: 20),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Payment Status:",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Lcolors.navyColor),
                              ),
                              Container(
                                  margin: EdgeInsets.symmetric(horizontal: 60),
                                  child: Row(
                                    children: [
                                      orderDetailsController.paymentStatus==null?
                                      Icon(Icons.check_circle):(orderDetailsController.paymentStatus=="Unpaid"?Icon(Icons.check_circle):Icon(Icons.check_circle,color: Lcolors.primaryColor)),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      orderDetailsController.paymentStatus==null?
                                      Text("Unpaid",style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Lcolors.navyColor))
                                      :(orderDetailsController.paymentStatus=="Unpaid"?Text("Unpaid",style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Lcolors.navyColor)):Text("Paid",style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Lcolors.primaryColor)))
                                      ,

                                    ],
                                  )),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        //margin: EdgeInsets.only(top: 20),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Store :",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Lcolors.navyColor),
                              ),
                              Container(
                                  margin: EdgeInsets.symmetric(horizontal: 80),
                                  child: Text(
                                      orderDetailsController.storeName ?? "",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Lcolors.navyColor))),
                            ],
                          ),
                        ),
                      ),

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
                              color: Color(0xFF0ECFD1),
                              child: new Text('Items',
                                  style: new TextStyle(fontSize: 16.0, color: Colors.white)),
                              onPressed: () {
                                onPresseItems();

                              },
                            ),
                            MaterialButton(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
                              elevation: 5.0,
                              minWidth: 100,
                              height: 45,
                              color: Lcolors.whiteColor,
                              child: new Text('Cancel',
                                  style: new TextStyle(fontSize: 16.0, color: Lcolors.navyColor)),
                              onPressed: () {
                                onPresseCancel();
                              },
                            ),
                            //if(orderTakingL.trackingStatus =="ReSchedule")
                            MaterialButton(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
                              elevation: 5.0,
                              minWidth: 100,
                              height: 45,
                              color: Color(0xFF0ECFD1),
                              child: new Text('Accept',
                                  style: new TextStyle(fontSize: 16.0, color: Colors.white)),
                              onPressed: () {
                                onPresseAccepted();
                              },
                            ),


                          ],
                        ),

                      ),
                    ],
                  ),
                );
              },


            ),
            Card(
              child: Column(
                children: [
                  Container(
                    //margin: EdgeInsets.only(top: 20),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Traking :",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Lcolors.primaryColor),
                          ),
                          Text("Status",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Lcolors.navyColor)),
                          Text(widget.orderStatus ?? "",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Lcolors.navyColor)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  Container(
                    //height: 250,
                    child: GetBuilder<OrderDetailsController>(
                      builder: (controller) {
                        return controller.orderTrakingLists != null
                            ? ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                                itemCount: controller.orderTrakingLists.length,
                                itemBuilder: (BuildContext context, int index) {
                                  OrderTrackingList orderTakingL = controller.orderTrakingLists[index];
                                  //orderTakingL.trackingStatus=controller.Status;
                                  return Card(
                                    child: ListTile(
                                      subtitle: Text(
                                          "${orderTakingL.trackingDate}, ${orderTakingL.trackingTime}"),
                                      leading: Icon(
                                        Icons.check_circle,
                                        color: Lcolors.primaryColor,
                                        size: 30,
                                      ),
                                      title: Text(orderTakingL.trackingStatus),
                                      //trailing: Icon(Icons.check_circle,color: Lcolors.primaryColor,size: 30,),
                                      onTap: () {

                                      },
                                    ),
                                  );
                                })
                            : Center(
                                child: CircularProgressIndicator(),
                              );
                      },
                    ),
                  ),

                  Container(
                    alignment: Alignment.centerLeft,
                    margin: new EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 10),
                    //color: Colors.amber,
                    child: new MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0))),
                      elevation: 10.0,
                      minWidth: 355.0,
                      height: 50,
                      color: Color(0xFF0ECFD1),
                      child: new Text('FeedBack and Register Complaint',
                          style: new TextStyle(
                              fontSize: 16.0, color: Colors.white)),
                      onPressed: () {
                        onPresseFeedback();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


