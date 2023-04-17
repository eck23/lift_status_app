import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:lift_status_app/themes.dart';

import 'functions.dart';

class DetailsPage extends StatefulWidget{

  String liftkey;
  DetailsPage(this.liftkey);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  
  var result;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
              leading: const BackButton(
              color: Colors.black
              ),
              backgroundColor: Colors.white,
              elevation: 4,
              titleSpacing: 0, 
              centerTitle: false,
              title: Text("Lift Details",style: customTheme.headline1,)
            ),
            body: SingleChildScrollView(
              child: StreamBuilder<DatabaseEvent>(
                stream: FirebaseDatabase.instance.ref("NPA0059/${widget.liftkey}").onValue,
                builder: ((context, snapshot){
            
                      if(snapshot.hasData){
                        result= snapshot.data!.snapshot.value;
                      return
                          
                             Column(
                               
                               crossAxisAlignment: CrossAxisAlignment.center,
                               mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      result['Status']?Icon(Icons.warning,size: 120.w,color: Colors.red,):Icon(Icons.health_and_safety,color: Colors.green,size: 120.w),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        
                                        children: [
                                          Row(
                                            
                                            children: [
                                              Text("Device ID  : ",style:  smalltitle.titleSmall,),
                                              Text("${result['DeviceID']}",style:  smalltitle.titleSmall,),
                                            ],
                                          ),
                                          
                                          Divider(height: 10.h),
                                          Row(
                                            
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Updated    : ",style:  smalltitle.titleSmall,),
                                              Column(
                                                
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(DateFormat.yMMMd().format(formateDateTime(result['Date'], result['Time'])),style:  smalltitle.titleSmall,),
                                                  Text("${result['Time']}",style:  smalltitle.titleSmall,),
                                                ],
                                              ),
                                            ],
                                          ),
                                          
                                          
                                        ],
                                      ),
                                    ],
                                  ),
                                  Divider(height: 10.h,thickness: 10),
                                  
                               

                                 DataTable(
                                 columns:  <DataColumn>[
                                   DataColumn(
                                     label: Text(
                                       'PINS',
                                       style:smalltitle.titleSmall ,
                                     ),
                                   ),
                                   DataColumn(
                                     label: Text(
                                       'STATUS',
                                       style: smalltitle.titleSmall,
                                     ),
                                   ),

                                 ],
                                 rows: <DataRow>[
                                   DataRow(
                                     cells: <DataCell>[
                                       DataCell(Text('Door Safety',style: smalltitle.titleSmall)),
                                       DataCell(Text('${result['DoorSafety']}',style: smalltitle.titleSmall)),

                                     ],
                                   ),

                                   DataRow(
                                     cells: <DataCell>[
                                       DataCell(Text('Emergency Stop',style: smalltitle.titleSmall)),
                                       DataCell(Text('${result['EmergencyStop']}',style: smalltitle.titleSmall)),

                                     ],
                                   ),

                                   DataRow(
                                     cells: <DataCell>[
                                       DataCell(Text('Floor Zone',style: smalltitle.titleSmall)),
                                       DataCell(Text('${result['FloorZone']}',style: smalltitle.titleSmall)),

                                     ],
                                   ),

                                   DataRow(
                                     cells: <DataCell>[
                                       DataCell(Text('Limit 1',style: smalltitle.titleSmall)),
                                       DataCell(Text('${result['Limit1']}',style: smalltitle.titleSmall)),

                                     ],
                                   ),

                                   DataRow(
                                     cells: <DataCell>[
                                        DataCell(Text('Limit 2',style: smalltitle.titleSmall)),
                                       DataCell(Text('${result['Limit2']}',style: smalltitle.titleSmall)),

                                     ],
                                   ),

                                   DataRow(
                                     cells: <DataCell>[
                                       DataCell(Text('Running',style: smalltitle.titleSmall)),
                                       DataCell(Text('${result['Running']}',style: smalltitle.titleSmall)),

                                     ],
                                   ),

                                 ],
                            )                           
    
                                  
                            ],
                            
                          );
                      }
                      else{
                        return const Center(child: CircularProgressIndicator(),);
                      }
               }
              )
            ),
          ),
      ),
    );

  }
}