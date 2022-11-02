import 'package:flutter/material.dart';
import 'package:my_jodi/Dashboard.dart';
import 'package:my_jodi/common_widgets/custom_spacer_widget.dart';
import 'package:my_jodi/utils/constants.dart';
import 'package:my_jodi/utils/fonts.dart';
import 'package:my_jodi/utils/navigation.dart';
import 'package:my_jodi/view_demo.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
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
            appBar: AppBar(title:Text("Location Based",style: AppFonts.extraBoldStyle(fontSize: 20,fontColor: AppColors.backgroundColorF5),
            ),
              backgroundColor: AppColors.blackColor,
              leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const Dashboard()));}
              ),
            ),
          body: SingleChildScrollView(
              child: ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const ViewDemo()));
                      },
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
                          child:Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                ],
                              )
                            ],
                          )
                      )
                  );
                },
                separatorBuilder: (context, index) {
                  return const CustomSpacerWidget(
                    height: 10,
                  );
                },
                itemCount: 8,
              ),
          )
        ));
  }
}