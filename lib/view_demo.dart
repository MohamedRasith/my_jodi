import 'package:flutter/material.dart';
import 'package:my_jodi/Dashboard.dart';
import 'package:my_jodi/common_widgets/custom_spacer_widget.dart';
import 'package:my_jodi/utils/constants.dart';
import 'package:my_jodi/utils/fonts.dart';
import 'package:my_jodi/utils/navigation.dart';

class ViewDemo extends StatefulWidget {
  const ViewDemo({super.key});
  @override
  State<ViewDemo> createState() => _ViewDemoState();
}

class _ViewDemoState extends State<ViewDemo> {
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
            appBar: AppBar(title:Text("Details",style: AppFonts.extraBoldStyle(fontSize: 20,fontColor: AppColors.backgroundColorF5),
            ),
              backgroundColor: AppColors.blackColor,
              leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const Dashboard()));}
              ),
            ),
            body: SingleChildScrollView(
              child: Container(
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/profile.png",width: 150,height: 150,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Name :  XXXXXXX", style: AppFonts.regularStyle(fontColor: Colors.black,fontSize: 15),),
                              const CustomSpacerWidget(height: 10),
                              Text("Age : XX", style: AppFonts.regularStyle(fontColor: Colors.black,fontSize: 15),),
                              const CustomSpacerWidget(height: 10),
                              Text("Religion : XXXXXX", style: AppFonts.regularStyle(fontColor: Colors.black,fontSize: 15),),
                              const CustomSpacerWidget(height: 10),
                              Text("Location : XXXXXX", style: AppFonts.regularStyle(fontColor: Colors.black,fontSize: 15),),
                              const CustomSpacerWidget(height: 30),
                              GestureDetector(
                                onTap: (){
                                  showModalBottomSheet<void>(
                                    context: context,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10.0),
                                        topRight: Radius.circular(10.0),
                                      ),
                                    ),
                                    builder: (BuildContext context) {
                                      return Container(
                                        padding: const EdgeInsets.only(top: 20),
                                        height: 150,
                                        color: Colors.white,
                                        child: Center(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: <Widget>[
                                              const Icon(Icons.check_circle),
                                              const CustomSpacerWidget(height: 20,),
                                              Text("Request Sended Successfully",style: AppFonts.regularStyle(fontColor: Colors.black,fontSize: 15),)
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
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
                                        child: Text("Send Request",style: AppFonts.extraBoldStyle(fontColor: Colors.white,fontSize: 15),)
                                    )
                                ),
                              )
                            ],
                          )
                        ],
                      )
                  )
                )));
  }
}