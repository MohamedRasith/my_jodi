// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_jodi/Categories/caste_based.dart';
import 'package:my_jodi/Categories/location_based.dart';
import 'package:my_jodi/Categories/manual_selection.dart';
import 'package:my_jodi/Categories/professional_based.dart';
import 'package:my_jodi/Categories/religion_based.dart';
import 'package:my_jodi/chat_page.dart';
import 'package:my_jodi/common_widgets/custom_spacer_widget.dart';
import 'package:my_jodi/main.dart';
import 'package:my_jodi/utils/constants.dart';
import 'package:my_jodi/utils/fonts.dart';
import 'package:my_jodi/view_demo.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Are you sure?'),
        content: const Text('Do you want to Logout'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const LoginScreen())),
            child: const Text('Yes'),
          ),
        ],
      ),
    )) ?? false;
  }
  int _currentIndex = 0;
  PageController? _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onWillPop,
        child:Scaffold(
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: _currentIndex,
          onItemSelected: (index) {
            setState(() => _currentIndex = index);
            _pageController!.jumpToPage(index);
          },
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
                title: Text('Home',style: AppFonts.boldStyle(fontSize: 12,fontColor: AppColors.blackColor),),
                icon: const Icon(Icons.home,color: AppColors.blackColor,)
            ),
            BottomNavyBarItem(
                title: Text('Categories',style: AppFonts.boldStyle(fontSize: 12,fontColor: AppColors.blackColor),),
                icon: const Icon(Icons.apps,color: AppColors.blackColor,)
            ),
            BottomNavyBarItem(
                title: Text('Chat',style: AppFonts.boldStyle(fontSize: 12,fontColor: AppColors.blackColor),),
                icon: const Icon(Icons.chat_bubble,color: AppColors.blackColor,)
            ),
            BottomNavyBarItem(
                title: Text('Settings',style: AppFonts.boldStyle(fontSize: 12,fontColor: AppColors.blackColor),),
                icon: const Icon(Icons.settings,color: AppColors.blackColor,)
            ),
          ],
        ),
        body: SizedBox.expand(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
            children: const <Widget>[
              Page1(),
              Page2(),
              Page3(),
              Page4()
            ],
          ),
        ),
    ));
  }
}
class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> usersStream = FirebaseFirestore.instance.collection('Customer Details').snapshots();
    return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CustomSpacerWidget(height: 150,),
                Image.asset("assets/images/matrimony.png",width: 80,height: 80,),
                Text("Home", style: AppFonts.regularStyle(fontColor: Colors.black,fontSize: 15),),
              ],
            ),
             Padding(padding: const EdgeInsets.only(left: 10),
             child: Row(
               children: [
                 const Icon(Icons.calendar_month),
                 const CustomSpacerWidget(width: 5,),
                 Text("Chithirai 12(Subamugurtha Naal)", style: AppFonts.extraBoldStyle(fontColor: Colors.black,fontSize: 15),),
               ],
             ),
             ),

        Padding(padding: const EdgeInsets.only(left: 10),
          child:Text("Hai, User",style: AppFonts.extraBoldStyle(fontSize: 25,fontColor: AppColors.blackColor),)),
            const CustomSpacerWidget(height: 10),
      SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: StreamBuilder<QuerySnapshot>(
          stream: usersStream,
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if(snapshot.data!.docs.isEmpty){
              return const Center(child: Text('No Data',style: TextStyle(fontSize: 20,color: Colors.black),),);
            }
            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
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
                                    Text("Name : " + data["First Name"] + " " + data["Last Name"], style: AppFonts.regularStyle(fontColor: Colors.black,fontSize: 15),),
                                    const CustomSpacerWidget(height: 10),
                                    Text("Age : " + data["Age"], style: AppFonts.regularStyle(fontColor: Colors.black,fontSize: 15),),
                                    const CustomSpacerWidget(height: 10),
                                    Text("Religion : "+data["Religion"], style: AppFonts.regularStyle(fontColor: Colors.black,fontSize: 15),),
                                    const CustomSpacerWidget(height: 10),
                                    Text("Location : "+data["Address"], style: AppFonts.regularStyle(fontColor: Colors.black,fontSize: 15),),
                                  ],
                                )
                              ],
                            )
                        )
                    );
              }).toList(),
            );
          },
        ),
      )

          ],
        )
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CustomSpacerWidget(height: 150,),
                Image.asset("assets/images/matrimony.png",width: 80,height: 80,),
                Text("Categories", style: AppFonts.regularStyle(fontColor: Colors.black,fontSize: 15),),
              ],
            ),
            const CustomSpacerWidget(height: 10),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.location_city),
                            const CustomSpacerWidget(width: 5,),
                            Text("Location Based", style: AppFonts.extraBoldStyle(fontColor: Colors.black,fontSize: 15),),
                          ],
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const Location()));
                          },
                          child: const Icon(Icons.arrow_circle_right,color: AppColors.blackColor,),
                        )
                      ],
                    ),
                    const CustomSpacerWidget(height: 20),
                    Container(width: double.maxFinite,height: 2,color: AppColors.blackColor,),
                    const CustomSpacerWidget(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.flag_circle),
                            const CustomSpacerWidget(width: 5,),
                            Text("Religion Based", style: AppFonts.extraBoldStyle(fontColor: Colors.black,fontSize: 15),),
                          ],
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const Religion()));
                          },
                          child: const Icon(Icons.arrow_circle_right,color: AppColors.blackColor,),
                        )
                      ],
                    ),
                    const CustomSpacerWidget(height: 20),
                    Container(width: double.maxFinite,height: 2,color: AppColors.blackColor,),
                    const CustomSpacerWidget(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.flag_sharp),
                            const CustomSpacerWidget(width: 5,),
                            Text("Caste Based", style: AppFonts.extraBoldStyle(fontColor: Colors.black,fontSize: 15),),
                          ],
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const Caste()));
                          },
                          child: const Icon(Icons.arrow_circle_right,color: AppColors.blackColor,),
                        )
                      ],
                    ),
                    const CustomSpacerWidget(height: 20),
                    Container(width: double.maxFinite,height: 2,color: AppColors.blackColor,),
                    const CustomSpacerWidget(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.cast_for_education_sharp),
                            const CustomSpacerWidget(width: 5,),
                            Text("Professional Based", style: AppFonts.extraBoldStyle(fontColor: Colors.black,fontSize: 15),),
                          ],
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const Professional()));
                          },
                          child: const Icon(Icons.arrow_circle_right,color: AppColors.blackColor,),
                        )
                      ],
                    ),
                    const CustomSpacerWidget(height: 20),
                    Container(width: double.maxFinite,height: 2,color: AppColors.blackColor,),
                    const CustomSpacerWidget(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.apps),
                            const CustomSpacerWidget(width: 5,),
                            Text("Manual Selection", style: AppFonts.extraBoldStyle(fontColor: Colors.black,fontSize: 15),),
                          ],
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const Manual()));
                          },
                          child: const Icon(Icons.arrow_circle_right,color: AppColors.blackColor,),
                        )
                      ],
                    ),
                  ],
                )
            ),
          ],
        )
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CustomSpacerWidget(height: 150,),
                Image.asset("assets/images/matrimony.png",width: 80,height: 80,),
                Text("Chat", style: AppFonts.regularStyle(fontColor: Colors.black,fontSize: 15),),
              ],
            ),
            const CustomSpacerWidget(height: 10),
            ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
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
                        Image.asset("assets/images/profile.png",width: 50,height: 50,),
                        Text("Name :  XXXXXXX", style: AppFonts.regularStyle(fontColor: Colors.black,fontSize: 15),),
                        GestureDetector(
                          onTap: (){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const ChatPage()));
                          },
                          child: const Icon(Icons.chat),
                        )
                      ],
                    )
                );
              },
              separatorBuilder: (context, index) {
                return const CustomSpacerWidget(
                  height: 10,
                );
              },
              itemCount: 5,
            ),
          ],
        )
    );
  }
}

class Page4 extends StatefulWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  State<Page4> createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  String? _method="Languages";
  ImagePicker picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CustomSpacerWidget(height: 150,),
                Image.asset("assets/images/matrimony.png",width: 80,height: 80,),
                Text("Settings", style: AppFonts.regularStyle(fontColor: Colors.black,fontSize: 15),),
              ],
            ),
            const CustomSpacerWidget(height: 10),
            Container(
                width: double.maxFinite,
                padding: const EdgeInsets.all(20),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.language),
                            const CustomSpacerWidget(width: 5,),
                            Text("Languages", style: AppFonts.extraBoldStyle(fontColor: Colors.black,fontSize: 15),),
                          ],
                        ),
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
                                  height: 300,
                                  color: Colors.white,
                                  child: Center(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            const Icon(Icons.language),
                                            const CustomSpacerWidget(width: 5,),
                                            Text("Languages", style: AppFonts.extraBoldStyle(fontColor: Colors.black,fontSize: 15),),
                                          ],
                                        ),
                                        RadioListTile(
                                          title: const Text('English'),
                                          value: "Languages1",
                                          groupValue: _method,
                                          onChanged: (value) {
                                            setState(() {
                                              _method = value;
                                            });
                                          },
                                        ),
                                        RadioListTile(
                                          title: const Text('Tamil'),
                                          value: "Languages2",
                                          groupValue: _method,
                                          onChanged: (value) {
                                            setState(() {
                                              _method = value;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: const Icon(Icons.arrow_circle_right,color: AppColors.blackColor,),
                        )
                      ],
                    ),
                    const CustomSpacerWidget(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.location_city),
                            const CustomSpacerWidget(width: 5,),
                            Text("Location", style: AppFonts.extraBoldStyle(fontColor: Colors.black,fontSize: 15),),
                          ],
                        ),
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
                                  height: 200,
                                  color: Colors.white,
                                  child: Center(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            const Icon(Icons.location_city),
                                            const CustomSpacerWidget(width: 5,),
                                            Text("Location", style: AppFonts.extraBoldStyle(fontColor: Colors.black,fontSize: 15),),
                                          ],
                                        ),
                                        const CustomSpacerWidget(height: 30,),
                                        Center(
                                          child:Container(
                                              width: 250,
                                              height: 40,
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
                                                  child: Text("Please Select Your Location",style: AppFonts.extraBoldStyle(fontColor: Colors.white,fontSize: 15),)
                                              )
                                          ),),

                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: const Icon(Icons.arrow_circle_right,color: AppColors.blackColor,),
                        )
                      ],
                    ),
                    const CustomSpacerWidget(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.person),
                            const CustomSpacerWidget(width: 5,),
                            Text("Profile", style: AppFonts.extraBoldStyle(fontColor: Colors.black,fontSize: 15),),
                          ],
                        ),
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
                                  height: 500,
                                  color: Colors.white,
                                  child: Center(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            const Icon(Icons.person),
                                            const CustomSpacerWidget(width: 5,),
                                            Text("Profile", style: AppFonts.extraBoldStyle(fontColor: Colors.black,fontSize: 15),),
                                          ],
                                        ),
                                        const CustomSpacerWidget(height: 30,),
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
                                        const CustomSpacerWidget(height: 10,),
                                        Text("Mohamed Rasith", style: AppFonts.boldStyle(fontColor: AppColors.blackColor,fontSize: 20),),
                                        const CustomSpacerWidget(height: 10,),
                                        Text("DOB: 27/04/1995", style: AppFonts.lightStyle(fontSize: 15,fontColor: Colors.black87),),
                                        const CustomSpacerWidget(height: 10,),
                                        Text("Gender: Male", style: AppFonts.lightStyle(fontSize: 15,fontColor: Colors.black87),),
                                        const CustomSpacerWidget(height: 10,),
                                        Text("Qualification: MCA", style: AppFonts.lightStyle(fontSize: 15,fontColor: Colors.black87),),
                                        const CustomSpacerWidget(height: 20,),
                                    Container(
                                      width: 50,
                                      height: 50,
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
                                      child:const Icon(Icons.edit))
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: const Icon(Icons.arrow_circle_right,color: AppColors.blackColor,),
                        )
                      ],
                    ),
                    const CustomSpacerWidget(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.payment),
                            const CustomSpacerWidget(width: 5,),
                            Text("Payment", style: AppFonts.extraBoldStyle(fontColor: Colors.black,fontSize: 15),),
                          ],
                        ),
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
                                return SingleChildScrollView(
                                  child: Container(
                                    padding: const EdgeInsets.only(top: 20),
                                    height: 500,
                                    color: Colors.white,
                                    child: Center(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              const Icon(Icons.payment_sharp),
                                              const CustomSpacerWidget(width: 5,),
                                              Text("Payment", style: AppFonts.extraBoldStyle(fontColor: Colors.black,fontSize: 15),),
                                            ],
                                          ),
                                          const CustomSpacerWidget(height: 30,),
                                          Center(
                                            child:Container(
                                              width: 150,
                                              height: 50,
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
                                              child: Image.asset("assets/images/gpay.png",width: 50,height: 50,),
                                            ),),
                                          Center(
                                            child:Container(
                                              width: 150,
                                              height: 50,
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
                                              child: Image.asset("assets/images/phonepe.png",width: 100,height: 100,),
                                            ),),
                                          Center(
                                            child:Container(
                                              width: 150,
                                              height: 50,
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
                                              child: Image.asset("assets/images/paytm.png",width: 50,height: 50,),
                                            ),),
                                          Center(
                                            child:Container(
                                                width: 150,
                                                height: 50,
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
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    const Icon(Icons.credit_card),
                                                    Text("Card", style: AppFonts.boldStyle(fontSize: 15,fontColor: AppColors.blackColor),)
                                                  ],
                                                )
                                            ),),
                                        ],
                                      ),
                                    ),
                                  )
                                );
                              },
                            );
                          },
                          child: const Icon(Icons.arrow_circle_right,color: AppColors.blackColor,),
                        )
                      ],
                    ),
                    const CustomSpacerWidget(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.help_center),
                            const CustomSpacerWidget(width: 5,),
                            Text("Help Centre", style: AppFonts.extraBoldStyle(fontColor: Colors.black,fontSize: 15),),
                          ],
                        ),
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
                                  height: 300,
                                  color: Colors.white,
                                  child: Center(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            const Icon(Icons.help_center_sharp),
                                            const CustomSpacerWidget(width: 5,),
                                            Text("Help Centre", style: AppFonts.extraBoldStyle(fontColor: Colors.black,fontSize: 15),),
                                          ],
                                        ),
                                        const CustomSpacerWidget(height: 30,),
                                        Text("We Help you from 10 am to 7 pm via calling, Please contact any number on below. If any line is busy, Please contact alternative numbers", textAlign: TextAlign.center, style: AppFonts.regularStyle(fontColor: AppColors.blackColor,fontSize: 15),),
                                        const CustomSpacerWidget(height: 10,),
                                        Text("1800-1000-8122", style: AppFonts.lightStyle(fontSize: 20,fontColor: Colors.blueAccent),),
                                        const CustomSpacerWidget(height: 10,),
                                        Text("1800-1000-8133", style: AppFonts.lightStyle(fontSize: 20,fontColor: Colors.blueAccent),),
                                        const CustomSpacerWidget(height: 10,),
                                        Text("1800-1000-8144", style: AppFonts.lightStyle(fontSize: 20,fontColor: Colors.blueAccent),),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: const Icon(Icons.arrow_circle_right,color: AppColors.blackColor,),
                        )
                      ],
                    ),
                    const CustomSpacerWidget(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.integration_instructions_rounded),
                            const CustomSpacerWidget(width: 5,),
                            Text("About Us", style: AppFonts.extraBoldStyle(fontColor: Colors.black,fontSize: 15),),
                          ],
                        ),
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
                                  height: 300,
                                  color: Colors.white,
                                  child: Center(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            const Icon(Icons.integration_instructions),
                                            const CustomSpacerWidget(width: 5,),
                                            Text("About Us", style: AppFonts.extraBoldStyle(fontColor: Colors.black,fontSize: 15),),
                                          ],
                                        ),
                                        const CustomSpacerWidget(height: 10,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Image.asset("assets/images/matrimony.png",width: 100,height: 100,),
                                            const CustomSpacerWidget(width: 5,),
                                            Text("My Jodi v1.0", style: AppFonts.regularStyle(fontColor: Colors.black,fontSize: 15),),
                                          ],
                                        ),
                                        const CustomSpacerWidget(height: 10,),
                                        Text("This is Matrimony App", style: AppFonts.lightStyle(fontSize: 20,fontColor: Colors.black),),

                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: const Icon(Icons.arrow_circle_right,color: AppColors.blackColor,),
                        )
                      ],
                    ),
                    const CustomSpacerWidget(height: 30),
                    Text("My Jodi V1.0", style: AppFonts.regularStyle(fontColor: Colors.black,fontSize: 15),),
                  ],
                )
            ),
          ],
        )
    );
  }
}