import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_jodi/Dashboard.dart';
import 'package:my_jodi/common_widgets/custom_spacer_widget.dart';
import 'package:my_jodi/sign_up.dart';
import 'package:my_jodi/utils/constants.dart';
import 'package:my_jodi/utils/fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                const LoginScreen()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome to My Jodi", style: AppFonts.extraBoldStyle(fontColor: Colors.black,fontSize: 20),),
            Image.asset("assets/images/matrimony.png",width: 200,height: 200,),
            const CircularProgressIndicator(color: AppColors.blackColor,)
          ],
        )
    );
  }
}
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Are you sure?'),
        content: const Text('Do you want to exit an App'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Yes'),
          ),
        ],
      ),
    )) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController username = TextEditingController();
    TextEditingController password = TextEditingController();
    return WillPopScope(
        onWillPop: _onWillPop,
        child:Scaffold(
      appBar: AppBar(title:Text("Login",style: AppFonts.extraBoldStyle(fontSize: 20,fontColor: AppColors.backgroundColorF5),
      ),
      backgroundColor: AppColors.blackColor,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child:Image.asset("assets/images/matrimony.png",width: 200,height: 200,),
            ),
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
                    Text("Email", style: AppFonts.extraBoldStyle(fontColor: Colors.black,fontSize: 15),),
                    TextField(
                        controller: username,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.people,color: Colors.black,),
                          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),borderSide: BorderSide(color: Colors.black, width: 2)),//icon at head of input
                        )
                    ),
                    const CustomSpacerWidget(height: 20,),
                    Text("Password", style: AppFonts.extraBoldStyle(fontColor: Colors.black,fontSize: 15),),
                    TextField(
                        controller: password,
                        decoration: const InputDecoration(
                            icon: Icon(Icons.lock,color: Colors.black,), //icon at head of input
                            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),borderSide: BorderSide(color: Colors.black, width: 2)),
                            //prefixIcon: Icon(Icons.people), //you can use prefixIcon property too.
                            suffixIcon: Icon(Icons.remove_red_eye,color: Colors.black,) //icon at ,// tail of input
                        )
                    ),
                  ],
                )
            ),
            Center(
              child:GestureDetector(
                onTap: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Dashboard()));},
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
                        child: Text("Login",style: AppFonts.extraBoldStyle(fontColor: Colors.white,fontSize: 15),)
                    )
                ),
              )),
            Center(
                child: Text("If you are new User, Please",style: AppFonts.regularStyle(fontColor: AppColors.blackColor, fontSize: 12),)
            ),
            Center(
              child:GestureDetector(
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
                  const SignUp()));
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
            Center(
              child: Text("--------- OR Login Via ---------",style: AppFonts.regularStyle(fontColor: Colors.black,fontSize: 15),)
            ),
            const CustomSpacerWidget(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset("assets/images/google.png",width: 50,height: 50,),
                Image.asset("assets/images/fb.png",width: 50,height: 50,)
              ],
            )
          ],
        )
      )
    ))  ;
  }
}