import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lift_status_app/functions.dart';
import 'package:lift_status_app/themes.dart';


class DevInfo extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      appBar: AppBar(
        leading: const BackButton(
              color: Colors.black
              ),
        backgroundColor: Colors.white,
        title:Text("Dev Info",style: customTheme.headline1,),),
        body: ListView(
          children: [
            Divider(height: 10.h,),
            ListTile(
              textColor: Colors.blue.shade900,
              leading :Icon(Icons.person),title: Text("Jayasankar JP",style: GoogleFonts.montez(fontSize: 25.sp,fontWeight: FontWeight.bold),)),
            ListTile(leading: Icon(Icons.developer_mode),title: Text("IOT Developer",style: smalltitle.titleSmall,)),
            ListTile(leading: Icon(Icons.email),title: Text("scicopath01@gmail.com",style: smalltitle.titleSmall), onTap: ()=>launchEmail("scicopath01@gmail.com"),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () => launchURL("https://www.linkedin.com/in/jayasankar-jp-9991291a3"),
                    child: Image.asset("lib/assets/linkedin.png",height:30.h)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap:() => launchURL("https://www.youtube.com/scicopath"),
                    child: Image.asset("lib/assets/youtube.png",height:40.h)),
                )
              ],
            ),
            
            Divider(height: 3,thickness: 4,),


             ListTile(
              textColor: Colors.blue.shade900,
              leading :Icon(Icons.person),title: Text("Elson C Kaithamangalam",style: GoogleFonts.montez(fontSize: 25.sp,fontWeight: FontWeight.bold),)),
            ListTile(leading: Icon(Icons.developer_mode),title: Text("Mobile App Developer",style: smalltitle.titleSmall,)),
            ListTile(leading: Icon(Icons.email),title: Text("elsonck23@outlook.com",style: smalltitle.titleSmall), onTap: ()=>launchEmail("elsonck23@outlook.com"),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () => launchURL("https://www.linkedin.com/in/elson-c-kaithamangalam-15ba581b1/"),
                    child: Image.asset("lib/assets/linkedin.png",height:30.h)),
                ),
                
              ],
            ),
            
          ],
        ),
    );
  }
}