import 'package:demogetx/Bindings/login_binging.dart';
import 'package:demogetx/CommanModual/BottomNavigation/tabbar.dart';
import 'package:demogetx/ProductModual/Views/login_screen.dart';
import 'package:demogetx/Utils/app_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(Duration(seconds:3),(){
      print("After 3 seconds");
      //Get.to('/login');

      String token =AppPreferences.getString(AppPreferences.token);
      print("*****************************$token*********************");
      token==null?
      Get.to(LoginScreen(),binding: LoginBinding()):
      Get.to(Navigation());

     });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(

            child: Container(
              constraints: BoxConstraints.expand(),
              child: Image.asset("assets/images/splash_lyondry_screen.jpg",fit: BoxFit.cover),
            )
        )
    );
  }
}
