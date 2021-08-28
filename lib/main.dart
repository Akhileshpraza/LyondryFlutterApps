import 'package:demogetx/ProductModual/Views/splash_screen.dart';
import 'package:demogetx/Routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';


import 'Utils/app_preferences.dart';

Future<void> main() async {
  runApp(MyApp());
  //HttpOverrides.global = new MyHttpOverrides();
  await AppPreferences.getInstance();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      debugShowCheckedModeBanner: false,
      //initialBinding: SplashBinding(),
      initialRoute: Routes.INITIAL,
      getPages: AppPages.pages,
      title: 'Lyondry',
      theme: ThemeData(
        primaryColor: Color(0xFF0ECFD1),
      ),
      home: SplashScreen(),
    );


    //   GetMaterialApp(
    //   title: 'Flutter Demo',
    //   debugShowCheckedModeBanner: false,
    //   initialRoute: '/',
    //   routes: {
    //     '/':(context) => SplashScreen(),
    //   },
    //   theme: ThemeData(
    //       primaryColor: Color(0xFF0ECFD1),
    //   ),
    //  // home: SplashScreen(),
    // );
  }
}


// class MyHttpOverrides extends HttpOverrides{
//   @override
//   HttpClient createHttpClient(SecurityContext context){
//     return super.createHttpClient(context)
//       ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
//   }
// }

/*          Get.offAllNamed(Routes.LOGIN);
*/


/*GetMaterialApp(

      debugShowCheckedModeBanner: false,
      initialBinding: SplashBinding(),
      initialRoute: Routes.INITIAL,
      getPages: AppPages.pages,
      title: 'IS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: CustomColor.YELLOW_COLOR_,
      ),
      home: SplashScreen(),
    );*/
