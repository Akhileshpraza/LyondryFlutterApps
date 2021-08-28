import 'package:demogetx/CommanModual/AppColors/Lcolors.dart';
import 'package:demogetx/Utils/app_preferences.dart';
import 'package:flutter/material.dart';

class InviteScreen extends StatefulWidget {
  const InviteScreen({Key key}) : super(key: key);

  @override
  _InviteScreenState createState() => _InviteScreenState();
}

class _InviteScreenState extends State<InviteScreen> {
  String mobileNo, emailId;
  @override
  void initState() {
    super.initState();

    mobileNo = AppPreferences.getString(AppPreferences.customerMobileNo);
    emailId = AppPreferences.getString(AppPreferences.customerEmailId);

  }

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
                "",
                style: TextStyle(color: Lcolors.whiteColor),
              ),
              SizedBox(
                width: 40,
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

        child: Container(
          margin: EdgeInsets.only(left: 16.0,right: 16.0),
          child: Column(

            children: [
              SizedBox(height: 20,),
              Container(

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Referral Points Earned",style: TextStyle(color: Lcolors.navyColor,fontSize: 16,fontWeight: FontWeight.w500),),
                    Container(
                      height: 30,
                      width: 110,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: Lcolors.primaryColor)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.star,
                              color: Colors.amber,
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
                              '100',
                              style: TextStyle(
                                color: Colors.amber,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                child: Image.asset("assets/images/invitebg.png"),
              ),
              SizedBox(height: 20,),
              Container(alignment: Alignment.topLeft,
                child: Text("Mobile",
                  style: TextStyle(color: Lcolors.grayColor,fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: Lcolors.grayColor)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 16,bottom: 16,left: 16),
                      child: Text(mobileNo,
                        style: TextStyle(
                          color: Lcolors.navyColor,fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(alignment: Alignment.topLeft,
                child: Text("Email",
                  style: TextStyle(color: Lcolors.grayColor,fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: Lcolors.grayColor)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 16,bottom: 16,left: 16),
                      child: Text(emailId,
                        style: TextStyle(
                          color: Lcolors.navyColor,fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40,),
              Container(
                height: 45,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Lcolors.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(color: Colors.grey, offset: Offset(0.0, 1.0), blurRadius: 4.0,),
                  ],
                ),

                child: TextButton(

                  onPressed: (){},
                  child: Text("Invite now"
                    ,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Lcolors.whiteColor),),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
