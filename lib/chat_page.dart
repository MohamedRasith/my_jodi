import 'package:flutter/material.dart';
import 'package:my_jodi/Dashboard.dart';
import 'package:my_jodi/common_widgets/custom_spacer_widget.dart';
import 'package:my_jodi/utils/constants.dart';
import 'package:my_jodi/utils/fonts.dart';
import 'package:my_jodi/utils/navigation.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  Future<bool> _onWillPop() async {
    return (await showDialog(
        context: context,
        builder: (context) => Navigation.back(context)
    )) ?? false;
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onWillPop,
        child:Scaffold(
            appBar: AppBar(title:Text("Name",style: AppFonts.extraBoldStyle(fontSize: 20,fontColor: AppColors.backgroundColorF5),
            ),
              backgroundColor: AppColors.blackColor,
              leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const Dashboard()));}
              ),
            ),
            body: SingleChildScrollView(
                child: Container(
                    width: 100,
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(40),
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
                    child: Text("Hai", style: AppFonts.lightStyle(fontColor: AppColors.blackColor,fontSize: 15),)
                )
            )));
  }
}