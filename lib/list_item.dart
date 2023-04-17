
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:lift_status_app/details_page.dart';
import 'package:lift_status_app/themes.dart';

class ListItem extends StatefulWidget{
  
  Map<dynamic,dynamic> val ;
  ListItem(this.val);
  
  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {

  @override
  Widget build(BuildContext context) {
    return Padding(
    padding:  EdgeInsets.all(8.0),
    child: Material(
      elevation: 5,
      
      child: InkWell(
        onTap: (){
          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailsPage(widget.val['Key'])),
          );
          print("tapped");},
          
        child: Container(
                  
                  height: 80.h,
                  
                  decoration: BoxDecoration(
                              
                              color:widget.val['Status']? Colors.red.shade800:Colors.green.shade700,
                              boxShadow: [BoxShadow(color: Colors.white,blurRadius: 1,spreadRadius: 2,)],
                              borderRadius: BorderRadius.all(
                               Radius.circular(10.r),
                                 )
                              ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                          Padding(
                            padding: EdgeInsets.only(top:10.h),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("LIFT ${widget.val['DeviceID']}",style: liftIDTheme.titleSmall,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                   Icon(Icons.sync_rounded),
                                   Text(" ${DateFormat.yMMMd().format(widget.val['LastUpdated'])}",style: small.titleSmall,),
                                ],)
                              ],
                            ),
                          ),
                         
                          
                          CircleAvatar(
                            radius: 30.r,
                            backgroundColor: widget.val['Status'] ?Colors.red.shade300:Colors.green.shade400,
                            child: Icon(widget.val['Status']  ?Icons.thumb_down: Icons.thumb_up, color: Colors.white,)
                          )
                    ],
                  ),
                ),
      ),
    ),
  );
  }
}