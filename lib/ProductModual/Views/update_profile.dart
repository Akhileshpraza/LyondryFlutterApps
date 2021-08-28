import 'dart:convert';
import 'dart:io';

import 'package:demogetx/Bindings/insert_address_binding.dart';
import 'package:demogetx/CommanModual/AppColors/Lcolors.dart';
import 'package:demogetx/ProductModual/Controllers/update_profile_controller.dart';
import 'package:demogetx/ProductModual/Controllers/upload_profile_pic_controller.dart';
import 'package:demogetx/ProductModual/Views/add_address.dart';
import 'package:demogetx/ProductModual/Views/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toast/toast.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({Key key}) : super(key: key);

  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  var genderPosition;
  var name ,mobileNumber, emailid,username,token;

  UpdateProfileController updateProfileController = Get.find();
  UploadProfilePicController uploadProfilePicController = Get.put(UploadProfilePicController());


  @override
  void initState() {
    // TODO: implement initState

    var mob =updateProfileController.customerMobile;
    var name =updateProfileController.customerName;
    var email =updateProfileController.customerEmailid;
    //
    // print("********************mob***************************"+mob);
    // print("********************name***************************"+name);
    // print("********************email***************************"+email);
    super.initState();

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
                Text(" Edit Profile", style: TextStyle(color: Lcolors.whiteColor),),

              ],
            ),
          ),

        ),
        body: Stack(fit: StackFit.expand, children: <Widget>[
          //BgImage(),
          Padding(padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: GetBuilder<UpdateProfileController>(
                builder: (controller){
                  return Column(
                    children: [
                      Card(
                        child: Column(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                new Container(
                                  height: 100.0,
                                  //color: Colors.amber,
                                  alignment: Alignment.center,
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 5),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            height: 100,

                                            child:  imageProfile()),
                                        FlatButton(onPressed: (){},
                                          child: Container(
                                            height: 40,
                                            width: 100,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                border: Border.all(color: Colors.grey,width: 2),
                                                borderRadius: BorderRadius.circular(10)
                                            ),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.file_upload,color: Lcolors.primaryColor,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    uploadProfilePicController.userProfilePicUpload(context);
                                                    // controller.imageFile==null? Toast.show("Please Select the Image", context)
                                                    // : uploadProfilePicController.userProfilePicUpload(context);
                                                    //Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateProfile()),);
                                                  },
                                                  child: new Padding(
                                                    padding: new EdgeInsets.all(10.0),
                                                    child: new Text("Upload",style: TextStyle(color: Lcolors.navyColor),),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          // shape: Border.all(width: 2.0, color: LColors.primaryColor,),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 20, ),
                                  child: Container(
                                    height: 40,

                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey,width: 2),
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextButton(onPressed: (){
                                          showModalBottomSheet(
                                              context: context,
                                              builder: ((builder)=> bottomSheet()));
                                        },
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.photo_size_select_actual_outlined,color: Lcolors.primaryColor,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  showModalBottomSheet(
                                                      context: context,
                                                      builder: ((builder)=> bottomSheet()));
                                                },
                                                child: new Padding(
                                                  padding: new EdgeInsets.symmetric(horizontal: 10.0),
                                                  child: new Text("Select Image",style: TextStyle(color: Lcolors.navyColor),),
                                                ),
                                              ),
                                            ],
                                          ),
                                          // shape: Border.all(width: 2.0, color: LColors.primaryColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),

                      Form(
                        key: controller.customerUpdateFormKey,
                        child: Card(
                          child: Column(
                            children: <Widget>[
                              Padding(padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(height: 20,),
                                    Container(alignment: Alignment.topLeft,
                                      child: Text("Full Name",
                                        style: TextStyle(color: Lcolors.navyColor),
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    TextFormField(
                                      controller: controller.nameController,
                                      // onSaved: (value) {
                                      //   controller.name = value;
                                      // },
                                      validator: (value) {
                                        return controller.validateUserName(value);
                                      },
                                      textAlign: TextAlign.start,
                                      enabled: true,

                                      style: TextStyle(color: Lcolors.navyColor),
                                      keyboardType: TextInputType.text,
                                      textInputAction: TextInputAction.done,
                                      decoration: InputDecoration(hintText: "Enter User Name", border: OutlineInputBorder(),),
                                    ),
                                    SizedBox(height: 10,),
                                    Container(alignment: Alignment.topLeft,

                                      child: Text("MobileNo",
                                        style: TextStyle(color: Lcolors.navyColor),
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    TextFormField(
                                      controller: controller.mobileController,
                                      onSaved: (value) {
                                        controller.mobile = value;
                                      },
                                      validator: (value) {
                                        return controller.validateMobile(value);
                                      },
                                      textAlign: TextAlign.start,
                                      enabled: false,

                                      readOnly: true,
                                      style: TextStyle(color: Lcolors.navyColor),
                                      keyboardType: TextInputType.number,
                                      textInputAction: TextInputAction.done,
                                      decoration: InputDecoration(hintText: "Mobile Number", border: OutlineInputBorder(),),
                                    ),
                                    SizedBox(height: 10,),
                                    Container(alignment: Alignment.topLeft,
                                      child: Text("Email Id",
                                        style: TextStyle(color: Lcolors.navyColor),
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    TextFormField(
                                      controller: controller.emailController,
                                      // onSaved: (value) {
                                      //   controller.email = value;
                                      // },
                                      validator: (value) {
                                        return controller.validateEmail(value);
                                      },
                                      textAlign: TextAlign.start,
                                      enabled: true,
                                      style: TextStyle(color: Lcolors.navyColor),
                                      keyboardType: TextInputType.emailAddress,
                                      textInputAction: TextInputAction.done,

                                      decoration: InputDecoration(hintText: "Emailid", border: OutlineInputBorder(),),
                                    ),

                                    SizedBox(height: 10,),
                                    Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.symmetric(horizontal: 10,vertical:10),
                                          alignment: Alignment.topLeft,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                            children: [
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text("Gender", style: TextStyle(color: Lcolors.navyColor),),
                                                  SizedBox(height: 10,),
                                                  Container(
                                                    height: 45,
                                                    width: 120,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(color: Colors.grey,width: 2),
                                                        borderRadius: BorderRadius.circular(10)
                                                    ),
                                                    child: DropdownButton(
                                                      icon: Icon(Icons.arrow_drop_down),
                                                      iconSize: 20,

                                                      underline: SizedBox(),
                                                      //dropdownColor: LColors.grayColor,

                                                      items: controller.gender
                                                          .map((String dropDownStringItem) {
                                                        return DropdownMenuItem<String>(
                                                          value: dropDownStringItem,
                                                          child: Text(dropDownStringItem),
                                                        );
                                                      }).toList(),
                                                      onChanged: (String newValueSelected) {
                                                        controller.onDropDownGenderType(
                                                            newValueSelected);
                                                      },
                                                      value: controller.genderItemSelected,
                                                    ),
                                                  ),
                                                ],
                                              ),

                                              Column(
                                                children: [
                                                  Text("Date of Birth", style: TextStyle(color: Lcolors.navyColor),
                                                  ),
                                                  Row(
                                                    mainAxisSize: MainAxisSize.min,

                                                    children: <Widget>[
                                                      Text(controller.correntDate,
                                                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                                      ),

                                                      IconButton(icon: Icon(Icons.date_range, color: Lcolors.primaryColor,size: 30,),
                                                          padding: new EdgeInsets.fromLTRB(0, 0, 0, 3),
                                                          onPressed: (){
                                                            controller.selectDate(context);
                                                            //_selectDate(context);
                                                          }
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FlatButton(onPressed: (){},
                                  color: Lcolors.primaryColor,
                                  height: 45,
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.add,color: Lcolors.whiteColor,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Get.to(AddAddress(),binding: InsertAddressBinding());
                                          // Navigator.push(context, MaterialPageRoute(builder: (context) => AddAddress()),);
                                        },
                                        child: new Padding(
                                          padding: new EdgeInsets.symmetric(horizontal: 70),
                                          child: new Text("Add New Address",style: TextStyle(color: Lcolors.whiteColor),),
                                        ),
                                      ),
                                    ],
                                  ),
                                  //shape: Border.all(width: 2.0, color: LColors.primaryColor,),
                                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
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
                              child: new Text('Cancel', style: new TextStyle(fontSize: 16.0, color: Lcolors.navyColor)),
                              onPressed: () {
                                Get.back();

                              },
                            ),

                            MaterialButton(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
                                elevation: 5.0,
                                minWidth: 200,
                                height: 45,
                                color: Color(0xFF0ECFD1),
                                child: new Text('Next', style: new TextStyle(fontSize: 16.0, color: Colors.white)),
                                onPressed: () async {
                                  controller.checkCustomerUpdate();
                                  controller.updateCustomerProfiles(context);
                                }
                            ),
                          ],
                        ),

                      ),
                      SizedBox(height: 20,),
                    ],
                  );
                },
              ),
            ),
          ),
        ]));
  }

  Widget imageProfile(){
    return GetBuilder<UploadProfilePicController>(
        builder: (controller){
          return Center(
            child: Stack(children: [
              CircleAvatar(
                  radius: 80.0,
                  backgroundImage: controller.imageFile==null? AssetImage("assets/images/rating.png"):
                 // controller.profileImage!=null?Image.memory(base64Decode(controller.profileImage.toString())):
                  FileImage(File(controller.imageFile.path.toString()))
              ),

            ],),
          );
        }
    );
  }

  Widget bottomSheet(){
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 20.0
      ),
      child: Column(
        children: [
          Text("Choose Profile Photo",style: TextStyle(fontSize: 20.0,color: Lcolors.navyColor,fontWeight: FontWeight.w500),),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(onPressed: (){
                uploadProfilePicController.tackPhoto(ImageSource.camera);
              },
                  icon: Icon(Icons.camera_alt,color: Lcolors.primaryColor,),
                  label: Text("Camera",style: TextStyle(color: Lcolors.navyColor),)),

              TextButton.icon(onPressed: (){
                uploadProfilePicController.tackPhoto(ImageSource.gallery);

              },
                  icon: Icon(Icons.image,color: Lcolors.primaryColor,),
                  label: Text("Gallery",style: TextStyle(color: Lcolors.navyColor))),
            ],
          )
        ],
      ),
    );
  }

}
