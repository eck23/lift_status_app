
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lift_status_app/screen.dart';
import 'package:lift_status_app/themes.dart';

class SplashScreen extends StatefulWidget{


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    super.initState();
   navigateToScreen();
    
  }

  

  void navigateToScreen()async{

      await Future.delayed(Duration(seconds: 3));
       Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Screen()),
          );
  }
  @override
  Widget build(BuildContext context) {
     
     return SafeArea(child: 

      Scaffold(
         backgroundColor: Colors.grey.shade900,
          body: Padding(
            padding: EdgeInsets.only(top:180.h),
            child: Center(
              child: Column(
                
                children: [
                Material(
                  elevation: 5,
                  color: Colors.grey.shade900,
                  shape:  CircleBorder(side: BorderSide.none),
                  child: Image.asset("lib/assets/liftmonitor.png",height: 200.h,width: 200.w,)),
                  Divider(height: 20.h,),
                  Text("LIFT MONITOR",style: small.titleSmall,),
                  
                  Container(
                    padding: EdgeInsets.only(top: 180.h),
                    child: Column(
                      children: [
                        Text("Powered by",style: GoogleFonts.lobster(color: Colors.white, fontSize: 12.sp),),
                        Text("Scicopath Official",style: small.titleSmall,)
                      ],
                    )),
                  
              ]),
            ),
          ) ,
      )
     
     );
  }
}