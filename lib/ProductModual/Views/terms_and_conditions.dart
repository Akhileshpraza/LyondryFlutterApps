import 'package:demogetx/CommanModual/AppColors/Lcolors.dart';
import 'package:demogetx/CommanModual/BottomNavigation/tabbar.dart';
import 'package:demogetx/ProductModual/Controllers/order_controller.dart';
import 'package:demogetx/ProductModual/Controllers/terms_conditions_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toast/toast.dart';

class TermsAndConditionsScreen extends StatefulWidget {
  const TermsAndConditionsScreen({Key key}) : super(key: key);

  @override
  _TermsAndConditionsScreenState createState() => _TermsAndConditionsScreenState();
}

class _TermsAndConditionsScreenState extends State<TermsAndConditionsScreen> {

  TermsConditions termsConditions = Get.put(TermsConditions());
  OrderController orderController = Get.put(OrderController());

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
                "Terms and Conditions",
                style: TextStyle(color: Lcolors.whiteColor),
              ),


            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 20.0,),
              Center(child: Text("Terms and conditions",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0,color: Lcolors.navyColor),)),
              SizedBox(height: 20.0,),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: 16.0,right: 16.0),
                child: Text("LYONDRY Eco Carry Bags Are Chargeable"
                  ,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Lcolors.navyColor),),
              ),
              SizedBox(height: 10.0,),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: 16.0,right: 16.0),
                child: Text("Kindly Preserve This Ticket Until Garments Are Delivered."
                  ,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Lcolors.navyColor),),
              ),
              SizedBox(height: 10.0,),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: 16.0,right: 16.0),
                child: Text("Please Check All Your Garments At The Time Of Delivery."
                  ,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Lcolors.navyColor),),
              ),
              SizedBox(height: 10.0,),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: 16.0,right: 16.0),
                child: Text("Bill Once Made Cannot Be Cancelled."
                  ,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Lcolors.navyColor),),
              ),
              SizedBox(height: 10.0,),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: 16.0,right: 16.0),
                child: Text("LYONDRY Does Not Guarantee Removal Of All Stains."
                  ,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Lcolors.navyColor),),
              ),
              SizedBox(height: 10.0,),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: 16.0,right: 16.0),
                child: Text("Handloom Cottons/Silks and Dyed Fabrics May Change Colour Or Fade When Dry Cleaned."
                  ,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Lcolors.navyColor),),
              ),
              SizedBox(height: 10.0,),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: 16.0,right: 16.0),
                child: Text("LYONDRY Reserves The Right To Refuse Cleaning Any Garment/Article."
                  ,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Lcolors.navyColor),),
              ),
              SizedBox(height: 10.0,),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: 16.0,right: 16.0),
                child: Text("Quality of texture, colour, trimmings, etc. is entirely at owner’s risk."
                  ,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Lcolors.navyColor),),
              ),
              SizedBox(height: 10.0,),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: 16.0,right: 16.0),
                child: Text("The Company does not hold itself responsible for delay loss or damage to any article arising from unforeseen circumstances or from causes beyond control."
                  ,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Lcolors.navyColor),),
              ),
              SizedBox(height: 10.0,),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: 16.0,right: 16.0),
                child: Text("In the event of damage to article that is not caused by any of the above stated characteristics. LYONDRY liability is limited to six (6) times the cleaning charge of the damaged article."
                  ,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Lcolors.navyColor),),
              ),
              SizedBox(height: 10.0,),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: 16.0,right: 16.0),
                child: Text("Any difference in the count of items and the number of items on the bill must be reported at the time of delivery only. LYONDRY will not be responsible once the garments are out of the store."
                  ,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Lcolors.navyColor),),
              ),
              SizedBox(height: 10.0,),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: 16.0,right: 16.0),
                child: Text("In the unforeseen events of loss or misplacement of any article, LYONDRY shall conduct careful examination of the specific case. LYONDRY liability with respect to any lost item shall not exceed ten (10) times of charges for cleaning of article after as billed."
                  ,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Lcolors.navyColor),),
              ),
              SizedBox(height: 10.0,),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                        focusColor: Colors.lightBlue,
                        activeColor: Lcolors.primaryColor,
                        value: termsConditions.isCheked,
                        onChanged: (newValue) {
                          print("newValue   $newValue");
                          setState(() {
                            termsConditions.isCheked = newValue;
                          });

                        }),
                    Text('I agree to all the terms and conditions'),
                    SizedBox(width: 10.0),
                  ]),
              SizedBox(height: 10.0,),
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
                      color: Lcolors.whiteColor,
                      child: new Text('Cancel',
                          style: new TextStyle(fontSize: 16.0, color: Lcolors.navyColor)),
                      onPressed: () {

                        // setState(() {
                           Navigator.push(context, MaterialPageRoute(builder: (context) => Navigation()),);
                        //
                        // });
                      },
                    ),
                    // Consumer<ProfileProvider>(
                    //   builder: (context,modal,_)=>
                    MaterialButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
                      elevation: 5.0,
                      minWidth: 200,
                      height: 45,
                      color: Color(0xFF0ECFD1),
                      child: new Text('Next',
                          style: new TextStyle(fontSize: 16.0, color: Colors.white)),
                      onPressed: () async {
                        if(!termsConditions.isCheked){
                          Toast.show("Please accept the terms and conditions to proceed...", context);
                        }
                        else{
                          orderController.getSelectOrder().then((value) {
                            if(value.success){
                              Toast.show("Schedual Pickup Successfully", context);
                              Get.to(Navigation());
                            }
                          });

                        }

                      },

                    ),

                  ],
                ),

              ),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),

    );
  }
}
