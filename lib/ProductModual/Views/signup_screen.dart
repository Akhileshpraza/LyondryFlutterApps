import 'package:demogetx/CommanModual/AddImages/bgimage.dart';
import 'package:demogetx/CommanModual/AddImages/images.dart';
import 'package:demogetx/CommanModual/AppColors/Lcolors.dart';
import 'package:demogetx/ProductModual/Controllers/signup_controller.dart';
import 'package:demogetx/ProductModual/Views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toast/toast.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  SignupController signupController = Get.find();

  bool shouldCheckDefault = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appBar: AppBar(title: Text("Registration"),),
        body: Stack(fit: StackFit.expand, children: <Widget>[
      BgImage(),
      Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Form(
                  key: signupController.signupFormKey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ClipRRect(
                            child: (Limages.biglogo),
                          ),
                          SizedBox(
                            height: 100,
                          ),
                          TextFormField(
                            textAlign: TextAlign.start,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            autofocus: false,
                            enabled: true,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            controller: signupController.nameController,
                            onSaved: (value) {
                              signupController.mobile = value;
                            },
                            validator: (value) {
                              return signupController.validateUserName(value);
                            },
                            decoration: InputDecoration(
                              hintText: "User Name",
                              labelText: "User Name",
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(

                            textAlign: TextAlign.start,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            autofocus: false,
                            maxLength: 10,
                            enabled: true,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.done,
                            controller: signupController.mobileController,
                            onSaved: (value) {
                              signupController.mobile = value;
                            },
                            validator: (value) {
                              return signupController.validateMobile(value);
                            },
                            decoration: InputDecoration(
                              hintText: "User Mobile number",
                              labelText: "Mobile Number",
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            textAlign: TextAlign.start,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            autofocus: false,
                            enabled: true,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.done,
                            controller: signupController.emailController,
                            onSaved: (value) {
                              signupController.mobile = value;
                            },
                            validator: (value) {
                              return signupController.validateEmail(value);
                            },
                            decoration: InputDecoration(
                              hintText: "User Email Id",
                              labelText: "Email Id",
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),

                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Checkbox(
                                    focusColor: Colors.lightBlue,
                                    activeColor: Lcolors.primaryColor,
                                    value: signupController.isCheked,
                                    onChanged: (newValue) {
                                      print("newValue   $newValue");
                                      setState(() {
                                        signupController.isCheked = newValue;
                                      });

                                    }),
                                Text('I agree to all the terms and conditions'),
                                SizedBox(width: 10.0),
                              ]),

                          // based up on this bool value
                          SizedBox.shrink(),
                          Container(
                            child: MaterialButton(
                              onPressed: () async {
                                signupController.checkSignup();
                                if(!signupController.isCheked){
                                  Toast.show("Please accept the terms and conditions to proceed...", context);
                                }
                                else{
                                  signupController.registerCustomer(context);
                                }
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0))),
                              elevation: 5.0,
                              minWidth: 350,
                              height: 45,
                              color: Lcolors.primaryColor,
                              child: new Text('SignUp',
                                  style: new TextStyle(
                                      fontSize: 16.0, color: Colors.white)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Already have an account?'),
                    FlatButton(
                      textColor: Lcolors.primaryColor,
                      child: Text(
                        'Login ',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () async {
                        Get.back();
                      },
                    )
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    ]));
  }
}
