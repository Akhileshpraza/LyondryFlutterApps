import 'package:demogetx/CommanModual/AddImages/bgimage.dart';
import 'package:demogetx/CommanModual/AddImages/images.dart';
import 'package:demogetx/CommanModual/AppColors/Lcolors.dart';
import 'package:demogetx/CommanModual/BottomNavigation/tabbar.dart';
import 'package:demogetx/ProductModual/Controllers/login_otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';


class LoginOtpScreen extends StatefulWidget {
  const LoginOtpScreen({Key key}) : super(key: key);

  @override
  _LoginOtpScreenState createState() => _LoginOtpScreenState();
}

class _LoginOtpScreenState extends State<LoginOtpScreen> {
  String signature = "{{ app signature }}";

  LoginOtpController loginOtpController = Get.find();

  var otpNo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:
      Stack(fit: StackFit.expand, children: <Widget>[
        BgImage(),
        Center(

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                ClipRRect(
                  child: (Limages.biglogo),
                ),

                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      // PhoneFieldHint(),
                      // Spacer(),
                      Container(child: _cardotp(),),
                      SizedBox(height: 20,),
                      Container(alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text('Enter OTP',style: TextStyle(fontSize: 16),),),
                      ),

                      SizedBox(height: 10,),
                      Container(
                        child:  PinFieldAutoFill(
                          decoration: UnderlineDecoration(
                            textStyle: TextStyle(fontSize: 20, color: Colors.black),
                            colorBuilder: FixedColorBuilder(Colors.black.withOpacity(0.3)),
                          ),
                          codeLength: 6,
                          controller: loginOtpController.otpController,
                          onCodeSubmitted: (code) {},
                          onCodeChanged: (code) {
                            //print(code);
                            otpNo = code;
                            print(otpNo);
                            if (code?.length == 8) {
                              FocusScope.of(context).requestFocus(FocusNode());
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Navigation()),);

                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                       child: MaterialButton(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
                          elevation: 5.0,
                          minWidth: 350,
                          height: 45,
                          color: Lcolors.primaryColor,
                          child: new Text('Verify', style: new TextStyle(fontSize: 16.0, color: Colors.white)),
                          onPressed: ()async {
                            loginOtpController.otpVerifyUser(context);
                          },
                        ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    child: Row(
                      children: <Widget>[
                        Text('Haven’t got OTP?'),
                        FlatButton(
                          child: Text('Resend',
                            style: TextStyle(fontSize: 20,color: Lcolors.primaryColor,),
                          ),
                          onPressed: () {

                          },
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ))
              ],
            ),
          ),
        ),
      ),
      ]));
  }

  void resendOtp() {}
}

Widget _cardotp(){
  return new Card(
    child: const SizedBox(
      width: 340,
      height: 100,
      child: Center(
        child: Text('A 6 digit code has been send to your mobile number',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF31396B),fontSize: 16,),),
      ),
    ),
    color: Colors.white60,

  );
}
