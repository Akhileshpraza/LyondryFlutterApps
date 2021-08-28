import 'package:demogetx/Bindings/signup_binding.dart';
import 'package:demogetx/CommanModual/AddImages/bgimage.dart';
import 'package:demogetx/CommanModual/AddImages/images.dart';
import 'package:demogetx/CommanModual/AppColors/Lcolors.dart';
import 'package:demogetx/ProductModual/Controllers/login_controller.dart';
import 'package:demogetx/ProductModual/Views/signup_screen.dart';
import 'package:demogetx/CommanModual/AddString/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

 LoginController loginController = Get.find();
// LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(fit: StackFit.expand, children: <Widget>[
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
                  height: 200,
                ),
                Form(
                  key: loginController.loginFormKey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          textAlign: TextAlign.start,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          autofocus: false,
                          maxLength: 10,

                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.done,
                          controller: loginController.mobileController,
                          onSaved: (value){
                            loginController.mobile=value;
                          },
                          validator: (value){
                            return loginController.validateMobile(value);
                          },

                          decoration: InputDecoration(
                            hintText: AppString.hintMobile,
                            labelText: AppString.txtmobile,
                            border: OutlineInputBorder(),
                          ),

                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: MaterialButton(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
                          elevation: 5.0,
                          minWidth: 350,
                          height: 45,
                          color: Color(0xFF0ECFD1),
                          child: new Text(AppString.btnLogin,
                              style: new TextStyle(fontSize: 16.0, color: Colors.white)),
                          onPressed: () async{
                            loginController.checkLogin(context);
                           // loginController.userLogin(context);
                           // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginOtpScreen()),);

                          },
                        ),
                  ),

                SizedBox(
                  height: 10,
                ),
                Container(
                    child: Row(
                      children: <Widget>[
                        Text(AppString.txtDontHave),
                        FlatButton(
                          child: Text(AppString.btnSignup,
                            style: TextStyle(fontSize: 20,color: Lcolors.primaryColor,),
                          ),
                          onPressed: ()  {
                            Get.to(SignupScreen(), binding:SignupBinding() );

                          /*  Navigator.push(context, MaterialPageRoute(
                                builder: (context) => SignupScreen()),);*/
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
}


String validateMobile(String value) {
  String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  RegExp regExp = new RegExp(pattern);
  if (value.length == 0) {
    return 'Please enter mobile number';
  }
  else if (!regExp.hasMatch(value)) {
    return 'Please enter valid mobile number';
  }
  return value;
}
