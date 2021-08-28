import 'package:demogetx/CommanModual/AppColors/Lcolors.dart';
import 'package:demogetx/ProductModual/Controllers/feedback_controller.dart';
import 'package:demogetx/ProductModual/Modals/SelectInvoiceResponceModal.dart';
import 'package:demogetx/ProductModual/Views/order_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class FeedBackScreen extends StatefulWidget {
  final String invoiceNo, invoiceDate;

  const FeedBackScreen({Key key, this.invoiceNo, this.invoiceDate})
      : super(key: key);

  @override
  _FeedBackScreenState createState() => _FeedBackScreenState();
}

class _FeedBackScreenState extends State<FeedBackScreen> {
  FeedBackController feedBackController = Get.put(FeedBackController());

  List<CheckBoxListTileModel> checkBoxListTileModel =
      CheckBoxListTileModel.getUsers();
  String startIndex;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FeedBackController>(

      builder: (controller) {
        return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Container(
                //color: Colors.amber,
                child: Row(
                  children: [
                    Text(
                      "FeedBack",
                      style: TextStyle(color: Lcolors.whiteColor),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 35,
                      width: 110,
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
                              // Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()),);
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
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: new EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 10),
                    //color: Colors.amber,
                    child: Text(
                      "Items",
                      style: TextStyle(
                        color: Lcolors.grayColor,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    // color: Colors.red,
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: controller.gridTranList.length,
                        itemBuilder: (BuildContext context, int index) {
                          GridTran gridTranModel=controller.gridTranList.elementAt(index);
                          String itemname =gridTranModel.invoiceTranDescription;
                          String itemcode =gridTranModel.invoiceTranItemCode;
                          itemcode =controller.itemCode.toString();
                          //**********convertsubString**************
                          final endIndex = itemname.indexOf("-");
                          String name = itemname.substring(0 , endIndex);

                          return Column(
                            children: [
                              new Card(
                                child: new Container(
                                  padding: new EdgeInsets.all(10.0),
                                  child: Column(
                                    children: <Widget>[
                                      new CheckboxListTile(
                                          activeColor: Lcolors.primaryColor,
                                          dense: true,
                                          //font change
                                          title: new Text(name,

                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                letterSpacing: 0.5),
                                          ),
                                          // value: gridTranModel.isChecked,
                                          // onChanged: (bool val) {
                                          //   //itemChange(val, index);
                                          //   gridTranModel.isChecked = false;
                                          // })
                                          value: checkBoxListTileModel[index].isCheck,
                                          onChanged: (bool val) {
                                            if(gridTranModel.isChecked==true)
                                              gridTranModel.invoiceTranItemCode.toString();

                                            else
                                            itemChange(val, index);
                                          })
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: new EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 10),
                    //color: Colors.amber,
                    child: Text(
                      "Items",
                      style: TextStyle(
                        color: Lcolors.grayColor,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    height: 45,
                    padding: EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.circular(10)),
                    alignment: Alignment.centerLeft,
                    margin: new EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 10),
                    //color: Colors.amber,
                    child: Text(
                      feedBackController.correntDate,
                      style: TextStyle(
                          color: Lcolors.navyColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: new EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 10),
                    //color: Colors.amber,
                    child: Text(
                      "Invoice No.",
                      style: TextStyle(
                        color: Lcolors.grayColor,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    height: 45,
                    padding: EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.circular(10)),
                    alignment: Alignment.centerLeft,
                    margin: new EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 10),
                    //color: Colors.amber,
                    child: Text(
                      widget.invoiceNo ?? "0",
                      style: TextStyle(
                          color: Lcolors.navyColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: new EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 10),
                    //color: Colors.amber,
                    child: Text(
                      "Description",
                      style: TextStyle(
                        color: Lcolors.grayColor,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    alignment: Alignment.centerLeft,
                    //margin: new EdgeInsets.symmetric(horizontal: 16.0,vertical: 10),
                    //color: Colors.amber,
                    child: TextFormField(
                       controller: controller.descriptionController,

                      // validator: validateMobile,
                      // onSaved: (String val) {
                      //   mobileNumber = val;
                      // },
                      textAlign: TextAlign.start,
                      autofocus: false,
                      enabled: true,

                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        hintText: "Enter Description",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  GetBuilder<FeedBackController>(
                    builder: (controller) {
                      return Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * .2,
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 1),
                                    color: Colors.black12,
                                  ),
                                  child: controller.imageArray.isEmpty
                                      ? Center(child: Text("No Image"))
                                      : Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: GridView.count(
                                            crossAxisCount: 3,
                                            children: List.generate(
                                                controller.imageArray.length,
                                                (index) {
                                              var img =
                                                  controller.imageArray[index];
                                              return Container(
                                                  child: Image.file(img));
                                            }),
                                          ),
                                        )),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              alignment: Alignment.center,
                              margin: new EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 10),
                              height: 45,
                              padding: EdgeInsets.only(left: 16, right: 16),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Lcolors.primaryColor, width: 2),
                                  borderRadius: BorderRadius.circular(10)),
                              //color: Colors.amber,
                              child: new MaterialButton(
                                // color: Color(0xFF0ECFD1),
                                child: new Text('Add Images',
                                    style: new TextStyle(
                                        fontSize: 16.0,
                                        color: Lcolors.navyColor)),
                                onPressed: () {
                                  controller.openCamera();
                                  // pickImageFromGallery();
                                  // setState(() {
                                  //   _isNeedHelp = true;
                                  // });
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0))),
                            elevation: 5.0,
                            minWidth: 100,
                            height: 45,
                            color: Lcolors.whiteColor,
                            child: new Text('Cancel',
                                style: new TextStyle(
                                    fontSize: 16.0, color: Lcolors.navyColor)),
                            onPressed: () {
                              Get.back();
                            },
                          ),
                          MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0))),
                              elevation: 5.0,
                              minWidth: 200,
                              height: 45,
                              color: Color(0xFF0ECFD1),
                              child: new Text('Next',
                                  style: new TextStyle(
                                      fontSize: 16.0, color: Colors.white)),
                              onPressed: () {
                                controller.insertFeedbacks(context);
                              }),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ));
      },
    );
  }

  void itemChange(bool val, int index) {
    setState(() {
      checkBoxListTileModel[index].isCheck = val;
    });
  }
}

class CheckBoxListTileModel {
  int userId;
  String img;
  String title;
  bool isCheck;

  CheckBoxListTileModel({this.userId, this.img, this.title, this.isCheck});

  static List<CheckBoxListTileModel> getUsers() {
    return <CheckBoxListTileModel>[
      CheckBoxListTileModel(
          userId: 1,
          img: 'assets/images/android_img.png',
          title: "Android",
          isCheck: true),
      CheckBoxListTileModel(
          userId: 2,
          img: 'assets/images/flutter.jpeg',
          title: "Flutter",
          isCheck: false),
      CheckBoxListTileModel(
          userId: 3,
          img: 'assets/images/ios_img.webp',
          title: "IOS",
          isCheck: false),
      CheckBoxListTileModel(
          userId: 4,
          img: 'assets/images/php_img.png',
          title: "PHP",
          isCheck: false),
      CheckBoxListTileModel(
          userId: 5,
          img: 'assets/images/node_img.png',
          title: "Node",
          isCheck: false),
    ];
  }
}
