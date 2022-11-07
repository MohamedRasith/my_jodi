
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_jodi/common_widgets/custom_spacer_widget.dart';
import 'package:my_jodi/main.dart';
import 'package:my_jodi/utils/constants.dart';
import 'package:my_jodi/utils/fonts.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => const LoginScreen()
    )) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController fname = TextEditingController();
    TextEditingController lname = TextEditingController();
    TextEditingController mobile = TextEditingController();
    TextEditingController address = TextEditingController();
    TextEditingController religion = TextEditingController();
    TextEditingController caste = TextEditingController();
    TextEditingController qualification = TextEditingController();
    TextEditingController email = TextEditingController();
    ImagePicker picker = ImagePicker();
    return WillPopScope(
        onWillPop: _onWillPop,
        child:Scaffold(
        appBar: AppBar(title:Text("Sign Up",style: AppFonts.extraBoldStyle(fontSize: 20,fontColor: AppColors.backgroundColorF5),
        ),
          backgroundColor: AppColors.blackColor,
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));}
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child:Image.asset("assets/images/matrimony.png",width: 200,height: 200,),
                ),
            Center(
              child: GestureDetector(
                onTap: () async{
                  XFile? image = await picker.pickImage(source: ImageSource.gallery);
                  image;
                },
                child: const ProfilePicture(
                  name: 'Mohamed',
                  radius: 51,
                  fontsize: 31,
                ),
              )
            ),
                const CustomSpacerWidget(height: 20,),
                Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.whiteFF,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.blackColor.withOpacity(.25),
                          offset: const Offset(0, 1),
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("First Name", style: AppFonts.extraBoldStyle(fontColor: Colors.black,fontSize: 15),),
                        TextField(
                            controller: fname,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.people,color: Colors.black,),
                              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),borderSide: BorderSide(color: Colors.black, width: 2)),//icon at head of input
                            )
                        ),
                        const CustomSpacerWidget(height: 20,),
                        Text("Last Name", style: AppFonts.extraBoldStyle(fontColor: Colors.black,fontSize: 15),),
                        TextField(
                            controller: lname,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.people,color: Colors.black,),
                              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),borderSide: BorderSide(color: Colors.black, width: 2)),//icon at head of input
                            )
                        ),
                        const CustomSpacerWidget(height: 20,),
                        Text("Mobile", style: AppFonts.extraBoldStyle(fontColor: Colors.black,fontSize: 15),),
                        TextField(
                            controller: mobile,
                            decoration: const InputDecoration(
                                icon: Icon(Icons.phone,color: Colors.black,), //icon at head of input
                                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),borderSide: BorderSide(color: Colors.black, width: 2)),
                                //prefixIcon: Icon(Icons.people), //you can use prefixIcon property too.
                            )
                        ),
                        const CustomSpacerWidget(height: 20,),
                        Text("Address", style: AppFonts.extraBoldStyle(fontColor: Colors.black,fontSize: 15),),
                        TextField(
                            controller: address,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.location_city,color: Colors.black,), //icon at head of input
                              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),borderSide: BorderSide(color: Colors.black, width: 2)),
                              //prefixIcon: Icon(Icons.people), //you can use prefixIcon property too.
                            )
                        ),
                        const CustomSpacerWidget(height: 20,),
                        Text("Religion", style: AppFonts.extraBoldStyle(fontColor: Colors.black,fontSize: 15),),
                        TextField(
                            controller: religion,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.flag_circle,color: Colors.black,), //icon at head of input
                              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),borderSide: BorderSide(color: Colors.black, width: 2)),
                              //prefixIcon: Icon(Icons.people), //you can use prefixIcon property too.
                            )
                        ),
                        const CustomSpacerWidget(height: 20,),
                        Text("Caste", style: AppFonts.extraBoldStyle(fontColor: Colors.black,fontSize: 15),),
                        TextField(
                            controller: caste,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.flag,color: Colors.black,), //icon at head of input
                              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),borderSide: BorderSide(color: Colors.black, width: 2)),
                              //prefixIcon: Icon(Icons.people), //you can use prefixIcon property too.
                            )
                        ),
                        const CustomSpacerWidget(height: 20,),
                        Text("Qualification", style: AppFonts.extraBoldStyle(fontColor: Colors.black,fontSize: 15),),
                        TextField(
                            controller: qualification,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.cast_for_education,color: Colors.black,), //icon at head of input
                              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),borderSide: BorderSide(color: Colors.black, width: 2)),
                              //prefixIcon: Icon(Icons.people), //you can use prefixIcon property too.
                            )
                        ),
                        const CustomSpacerWidget(height: 20,),
                        Text("Email", style: AppFonts.extraBoldStyle(fontColor: Colors.black,fontSize: 15),),
                        TextField(
                            controller: email,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.mail,color: Colors.black,),
                              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),borderSide: BorderSide(color: Colors.black, width: 2)),//icon at head of input
                            )
                        ),
                        const CustomSpacerWidget(height: 20,),
                      ],
                    )
                ),
                Center(
                  child:GestureDetector(
                    onTap: (){
                      if(fname.text.isEmpty && lname.text.isEmpty &&
                      mobile.text.isEmpty && address.text.isEmpty && religion.text.isEmpty &&
                      caste.text.isEmpty && qualification.text.isEmpty && email.text.isEmpty){
                        Fluttertoast.showToast(
                            msg: "Please Enter Details",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM // Also possible "TOP" and "CENTER"
                            );
                      }
                      else{
                        FirebaseFirestore.instance.collection("Customer Details").add({
                          "First Name":fname.text,
                          "Last Name":lname.text,
                          "Mobile":mobile.text,
                          "Address":address.text,
                          "Religion":religion.text,
                          "Caste":caste.text,
                          "Qualification":qualification.text,
                          "Email":email.text});
                        Fluttertoast.showToast(
                            msg: "Signed Successfully",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM // Also possible "TOP" and "CENTER"
                        );
                      }

                    },
                    child: Container(
                        width: 150,
                        height: 50,
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppColors.blackColor,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.blackColor.withOpacity(.25),
                              offset: const Offset(0, 1),
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: Center(
                            child: Text("Sign Up",style: AppFonts.extraBoldStyle(fontColor: Colors.white,fontSize: 15),)
                        )
                    ),
                  )),
              ],
            )
        )
    ));
  }
}