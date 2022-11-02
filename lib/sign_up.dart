
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
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
    TextEditingController username = TextEditingController();
    TextEditingController password = TextEditingController();
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
                            controller: username,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.people,color: Colors.black,),
                              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),borderSide: BorderSide(color: Colors.black, width: 2)),//icon at head of input
                            )
                        ),
                        const CustomSpacerWidget(height: 20,),
                        Text("Last Name", style: AppFonts.extraBoldStyle(fontColor: Colors.black,fontSize: 15),),
                        TextField(
                            controller: username,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.people,color: Colors.black,),
                              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),borderSide: BorderSide(color: Colors.black, width: 2)),//icon at head of input
                            )
                        ),
                        const CustomSpacerWidget(height: 20,),
                        Text("Mobile", style: AppFonts.extraBoldStyle(fontColor: Colors.black,fontSize: 15),),
                        TextField(
                            controller: password,
                            decoration: const InputDecoration(
                                icon: Icon(Icons.phone,color: Colors.black,), //icon at head of input
                                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),borderSide: BorderSide(color: Colors.black, width: 2)),
                                //prefixIcon: Icon(Icons.people), //you can use prefixIcon property too.
                            )
                        ),
                        const CustomSpacerWidget(height: 20,),
                        Text("Address", style: AppFonts.extraBoldStyle(fontColor: Colors.black,fontSize: 15),),
                        TextField(
                            controller: password,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.location_city,color: Colors.black,), //icon at head of input
                              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),borderSide: BorderSide(color: Colors.black, width: 2)),
                              //prefixIcon: Icon(Icons.people), //you can use prefixIcon property too.
                            )
                        ),
                        const CustomSpacerWidget(height: 20,),
                        Text("Religion", style: AppFonts.extraBoldStyle(fontColor: Colors.black,fontSize: 15),),
                        TextField(
                            controller: password,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.flag_circle,color: Colors.black,), //icon at head of input
                              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),borderSide: BorderSide(color: Colors.black, width: 2)),
                              //prefixIcon: Icon(Icons.people), //you can use prefixIcon property too.
                            )
                        ),
                        const CustomSpacerWidget(height: 20,),
                        Text("Caste", style: AppFonts.extraBoldStyle(fontColor: Colors.black,fontSize: 15),),
                        TextField(
                            controller: password,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.flag,color: Colors.black,), //icon at head of input
                              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),borderSide: BorderSide(color: Colors.black, width: 2)),
                              //prefixIcon: Icon(Icons.people), //you can use prefixIcon property too.
                            )
                        ),
                        const CustomSpacerWidget(height: 20,),
                        Text("Qualification", style: AppFonts.extraBoldStyle(fontColor: Colors.black,fontSize: 15),),
                        TextField(
                            controller: password,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.cast_for_education,color: Colors.black,), //icon at head of input
                              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),borderSide: BorderSide(color: Colors.black, width: 2)),
                              //prefixIcon: Icon(Icons.people), //you can use prefixIcon property too.
                            )
                        ),
                        const CustomSpacerWidget(height: 20,),
                        Text("Email", style: AppFonts.extraBoldStyle(fontColor: Colors.black,fontSize: 15),),
                        TextField(
                            controller: username,
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
                  child:Container(
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
                  ),),
              ],
            )
        )
    ));
  }
}