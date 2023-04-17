import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lift_status_app/dev_info.dart';
import 'package:lift_status_app/list_item.dart';
import 'package:lift_status_app/screen.dart';
import 'package:lift_status_app/themes.dart';

Widget currentTab(String title,IconData icon,Color color){
  return
    Padding(
      padding: EdgeInsets.only(top:30.h),
      child: Material(
        elevation: 6,
        child: Container(
          height: 50.h,
          width: 180.w,
          color: Colors.white,
          
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
            Icon(icon,color:color ,),
            Text(title,style: GoogleFonts.lobster(color: color, fontSize: 22.sp),)
          ],),
        ),
      ),
    );
}

Widget centreMessage(bool state){
    return 
      Padding(
        padding: EdgeInsets.only(top: 100.h),
        child: Column(
          children: [
            Icon(
              state ? Icons.health_and_safety_outlined: Icons.warning_amber_outlined,
              size: 150.w, color: state? Colors.green:Colors.red,),

            Text(state? "ALL UNITS ARE SAFE":"NO SAFE UNITS",style: medium.titleMedium,)
          ],
        ),
      );
    
}


Widget statusContainers(int total,int safe,int unsafe){
  return  Padding(
    padding:  EdgeInsets.only(top: 30.h),
    child: Material(
      elevation: 2,
      child: Container(
        height: 60.h,
        width: screenWidth,
        
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              
    child: Column(
              
                children: [
                  Padding(
                    padding:  EdgeInsets.only(bottom: 5.h),
                    child: Text("SAFE",style: smalltitle.titleSmall
                    ),
                  ),
                  
                  Container(
                    
                    width: 80.w,
                    height: 30.h,
                    // padding:EdgeInsets.only(left: 40,top: 10),
                    decoration: greenDecoration,
                    child: Center(child: Text("$safe",style:small.titleSmall)),
                  )
                ],
              ),
            ),
    
            Column(
            
              children: [
                Padding(
                  padding:  EdgeInsets.only(bottom: 5.h),
                  child: Text("TOTAL",style: smalltitle.titleSmall,
                  ),
                ),
                
                Container(
                  
                  width: 80.w,
                  height: 30.h,
                  decoration: yellowDecoration,
                  // padding:EdgeInsets.only(left: 40,top: 10),
                  child: Center(child: Text("$total",style: small.titleSmall)),
                )
              ],
            ),
    
             Column(
             
               children: [
                 Padding(
                   padding:  EdgeInsets.only(bottom: 5.h),
                   child: Text("UNSAFE",style: smalltitle.titleSmall,
                   ),
                 ),
                 
                 Container(
                   
                   width: 80.w,
                   height: 30.h,
                  //  padding:EdgeInsets.only(left: 40,top: 10),
                   decoration: redDecoration,
                  child: Center(child: Text("$unsafe",style: small.titleSmall)),
                 )
               ],
             ),
          ],
        ),
      ),
    ),
  );

}


Widget largeContainer(List liftdata,BuildContext context){


  
  //var rad=Radius.circular(40.r);
  return Container(
      height: 400.h,
      padding: EdgeInsets.only(top:20.h,bottom: 20.h,left: 30.w,right: 30.w),
      // child:  
      child: ListView.builder(itemBuilder: (context, index){
        
        // print("id : ${liftdata.elementAt(index)}");
        return ListItem(liftdata.elementAt(index));
      },
      itemCount: liftdata.length,
      ),
        
      );
}


 Widget search() {
    
    
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container( width:60.w ,
          color: Colors.black,
            child: TextField(
                
                style: TextStyle(color: Colors.black,),
                focusNode:searchFocus, 
                //autofocus: provider.state,
                keyboardType: TextInputType.number,
                enabled:true,
               // decoration: InputDecoration(hintStyle: hint.titleSmall,hintText: "Search",focusColor: Colors.white),
                ),),
          IconButton(onPressed: (){
            // if(provider.state==false){
              
            //  // provider.changeState();
              
              
            // }
            // else{

            // }
            searchFocus.requestFocus();
          }, icon: Icon(Icons.search,size: 30.w,),color: Colors.black,),
        ],
      ),
    );
  }


Widget showDrawer(){

  return Drawer(
 

  child: ListView(
    
    padding: EdgeInsets.zero,
    children: [
       DrawerHeader(
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("lib/assets/liftmonitor.png",height: 80.h,width: 100.w,),
            Text("LIFT MONITOR",style: small.titleSmall,)
          ],
        ),
      ),
      ListTile(
        title: Text('Dev Info',style: smalltitle.titleSmall,),
        onTap: () {
          Navigator.pop(ctx);
          Navigator.push(
          ctx,
          MaterialPageRoute(builder: (context) => DevInfo()),
          );
        },
       
      ),
      Divider(height: 0.2,thickness: 2,)
      // ListTile(
      //   title: const Text('Item 2'),
      //   onTap: () {
      //     // Update the state of the app.
      //     // ...
      //   },
      // ),
    ],
  ),
);
}