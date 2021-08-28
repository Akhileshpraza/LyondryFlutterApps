import 'package:demogetx/CommanModual/AppColors/Lcolors.dart';
import 'package:demogetx/ProductModual/Views/invite_screen.dart';
import 'package:flutter/material.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key key}) : super(key: key);

  @override
  _AboutUsScreenState createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
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
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 20.0,),
              Center(child: Text("About Us",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0,color: Lcolors.navyColor),)),
              SizedBox(height: 16.0,),
              Container(
                margin: EdgeInsets.only(left: 16.0,right: 16.0),
                child: Text("Lyondry is a part of Bapuji Surgicals, and it is your best destination for all your clothes, presently operating in Bangalore. Here, we provide premium dry cleaning and laundry home pick-up and delivery services at a reasonable price."
                  ,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Lcolors.navyColor),),
              ),
              SizedBox(height: 16.0,),
              Container(
                margin: EdgeInsets.only(left: 16.0,right: 16.0),
                child: Text("If you are looking for a laundry service to end your woes, try out our laundry service. We use the latest technologies, cleaning methods and solutions to deal with your delicate clothes. We will deliver your clean clothes to your doorstep."
                  ,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Lcolors.navyColor),),
              ),
              SizedBox(height: 16.0,),
              Container(
                alignment: Alignment.centerLeft,
                margin: new EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                child: Text("Our Services"
                  ,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Lcolors.navyColor),),
              ),

              Container(
                alignment: Alignment.centerLeft,
                margin: new EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                child: Text("Laundry cleaning"
                  ,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Lcolors.navyColor),),
              ),

              Container(
                alignment: Alignment.centerLeft,
                margin: new EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                child: Text("Dry cleaning"
                  ,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Lcolors.navyColor),),
              ),

              Container(
                alignment: Alignment.centerLeft,
                margin: new EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                child: Text("Altration"
                  ,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Lcolors.navyColor),),
              ),

              Container(
                alignment: Alignment.centerLeft,
                margin: new EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                child: Text("Laundry services"
                  ,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Lcolors.navyColor),),
              ),

              Container(
                alignment: Alignment.centerLeft,
                margin: new EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                child: Text("Shoe care"
                  ,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Lcolors.navyColor),),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: new EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                child: Text("Light starch"
                  ,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Lcolors.navyColor),),
              ),

              Container(
                  alignment: Alignment.centerLeft,
                  margin: new EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                  child: Image.asset("assets/images/banner.png",)  ),
              SizedBox(height: 16,),
              Container(
                height: 45,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: Lcolors.primaryColor,width: 2),
                  borderRadius: BorderRadius.circular(10),

                ),
                margin: new EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                child: TextButton(
                  onPressed: (){},
                  child: Text("Help Desk"
                    ,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Lcolors.primaryColor),),
                ),
              ),
              SizedBox(height: 10,),
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

                margin: new EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                child: TextButton(

                  onPressed: (){},
                  child: Text("Contact Us"
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
