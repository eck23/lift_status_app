import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lift_status_app/functions.dart';
import 'package:lift_status_app/themes.dart';
import 'package:lift_status_app/widgets.dart';
import 'details_page.dart';


FocusNode searchFocus=FocusNode();
late double screenWidth;
late double screenHeight;
TextEditingController searchController=TextEditingController();
List<Map<dynamic,dynamic>> liftdata=[];
List<Map<dynamic,dynamic>> liftsafe=[];
List<Map<dynamic,dynamic>> liftunsafe=[];
late BuildContext ctx;

class Screen extends StatefulWidget{

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
 


  int taskIndex=0;
  bool sortmode=true;
  String sortMessage="";
  DatabaseReference databaseRef=FirebaseDatabase.instance.ref("NPA0059/");
  
  //late FirebaseMessaging _fcm;
  // late String message;
  // late String token;



  @override
  void initState() {

    super.initState();

    FirebaseDatabase.instance.setPersistenceEnabled(true);
    //sendData();


  // var initialzationSettingsAndroid =
  //    AndroidInitializationSettings('@mipmap/ic_launcher');
  //   var initializationSettings =
  //   InitializationSettings(android: initialzationSettingsAndroid);

  //   flutterLocalNotificationsPlugin.initialize(initializationSettings);
  //   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //     RemoteNotification? notification = message.notification;
  //     AndroidNotification? android = message.notification?.android;
  //     if (notification != null && android != null) {
  //       flutterLocalNotificationsPlugin.show(
  //           notification.hashCode,
  //           notification.title,
  //           notification.body,
  //           NotificationDetails(
  //             android: AndroidNotificationDetails(
  //               channel.id,
  //               channel.name,
                
  //               icon: android.smallIcon,
  //             ),
  //           ));
  //     }
  //   });
    
  //   getToken();


    
  }



  

@override
void didChangeDependencies(){
      
      screenHeight=MediaQuery.of(context).size.height;
      screenWidth=MediaQuery.of(context).size.width;
      ctx=context;
      super.didChangeDependencies();
      
}

@override
void dispose(){

  searchController.dispose();
  super.dispose();
}


void sortByLastUpdated(){


                liftdata.sort((a, b) =>(a['LastUpdated']).compareTo(b['LastUpdated']) );
                liftsafe.sort((a, b) =>(a['LastUpdated']).compareTo(b['LastUpdated']) );
                liftunsafe.sort((a, b) =>(a['LastUpdated']).compareTo(b['LastUpdated']) );
                

}

void sortByDeviceID(){


                liftdata.sort((a, b) =>(a['DeviceID']).compareTo(b['DeviceID']) );
                liftsafe.sort((a, b) =>(a['DeviceID']).compareTo(b['DeviceID']) );
                liftunsafe.sort((a, b) =>(a['DeviceID']).compareTo(b['DeviceID']) );
                
}



void setData(var result){
                // print("Token : $fcmToken");
                liftdata.clear();
                liftsafe.clear();
                liftunsafe.clear();
                result.forEach((key, value) {
                //print("value: $value\n");
                value['Key']=key;
                
                
                
                value['LastUpdated']=formateDateTime(value['Date'], value['Time']);
                //print(value['LastUpdated']);
               // print("value: $value\n");
                liftdata.add(value);
               });

               liftsafe=liftdata.where((element) => element['Status']==false).toList();
               liftunsafe=liftdata.where((element) => element['Status']==true).toList();
               
              sortmode?sortByLastUpdated():sortByDeviceID();
             


                
}
  
void changeSort(){
   if(liftdata.isNotEmpty){
      setState(() {
        sortmode=!sortmode;
        sortMessage=sortmode? "recently updated":"ID order";
        Fluttertoast.showToast(
        msg: "View by $sortMessage",  
        toastLength: Toast.LENGTH_LONG, 
        gravity: ToastGravity.BOTTOM    
                      
       );
        
    });

        
      
      
   }

}



  

  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: GestureDetector(
        onTap: (){  
                    FocusScope.of(context).unfocus();
                    searchController.clear();
                  },
        child: Scaffold(
          drawer: showDrawer(),
          
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            backgroundColor: Colors.white,
            centerTitle: true,
            elevation: 4,
            
            title: Text("Lift Status",style: customTheme.headline1,),
            actions: [IconButton(onPressed: ()=>changeSort(), icon: Icon(Icons.sort,color: Colors.black,))],
          ),
          body: SingleChildScrollView(
            child: Column(
              
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                   
                      StreamBuilder<DatabaseEvent>(
                      stream: databaseRef.limitToFirst(50).onValue,
                      builder:(context,  snap) {
          
                   if(snap.hasData){
                     
                  // print(snap.data!.snapshot.value);
                   var result= snap.data!.snapshot.value  as Map<dynamic,dynamic>;
                   setData(result);
                   databaseRef.keepSynced(true);
                    
                  //  print(liftsafe);
          
                  return Column(
                     children: [
                       
                       statusContainers(liftdata.length,liftsafe.length,liftunsafe.length),

                       if(liftdata.isEmpty && (taskIndex>=0))
                        Padding(
                          padding:  EdgeInsets.only(top: 200.h),
                          child: Center(child: Text("NO UNITS ADDED YET",style:medium.titleMedium ,),),
                        )
                       
                       else if(taskIndex==0 && liftunsafe.isNotEmpty)currentTab(" Unsafe Lifts",Icons.warning_amber_outlined,Colors.red.shade900)
                       else if(taskIndex==1 && liftsafe.isNotEmpty)currentTab(" Safe Lifts",Icons.health_and_safety,Colors.green.shade500)
                       else if(taskIndex==2) currentTab("  All Lifts",Icons.list_sharp,Colors.yellow.shade900),

                       if(taskIndex==0 && liftunsafe.isNotEmpty && liftdata.isNotEmpty)largeContainer(liftunsafe,context)
                       else if(taskIndex==0 && liftunsafe.isEmpty && liftdata.isNotEmpty)centreMessage(true)
                       else if(taskIndex==1 && liftsafe.isNotEmpty &&liftdata.isNotEmpty)largeContainer(liftsafe,context)
                       else if(taskIndex==1 && liftsafe.isEmpty && liftdata.isNotEmpty)centreMessage(false)
                       else largeContainer(liftdata,context),
          
                    ],
                   );
                  
                   
                }
                
                else{
                  //print("no data");
                  return  Padding(
                    padding: EdgeInsets.only(top: 220.h),
                    child: Center(child: CircularProgressIndicator()),
                  );
                } 
          
                                      
              },
            ),
                  
                  
                  
              ],
            ),
          ),
      
          bottomNavigationBar: BottomNavigationBar(
            
            
            currentIndex: taskIndex,
            
            fixedColor:Colors.red.shade900,
            unselectedItemColor: Colors.blue.shade900,
            onTap: (int index){
                
                setState(() {
                  taskIndex=index;
      
                });
      
      
            },
            items:const [
            BottomNavigationBarItem(label:'UNSAFE',icon: Icon(Icons.warning_amber_outlined)),
            BottomNavigationBarItem(label:'SAFE',icon: Icon(Icons.health_and_safety)),
            BottomNavigationBarItem(label:'ALL',icon: Icon(Icons.list_sharp)),
            
          ]),
          floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
          
          floatingActionButton: FloatingActionButton(
            splashColor: Colors.black,
            backgroundColor: Colors.yellow.shade900,
            elevation: 10,
            
            onPressed: ()=> modalButtomSheet(context) , child:const Icon(Icons.search),
        ),)
      ),
    );
  }
}


String? get _errorText {
  
  final text = searchController.value.text.trim();
  
  if (text.isEmpty) {
    return 'Can\'t be empty';
  }
  if(int.tryParse(text)==null){
      return 'Decimals and special characters are not accepted';
  }
    
  if(int.parse(text)<=0){

    return 'Lift number should be greater than zero';
  }
  if (int.parse(text) > liftdata.length) {
    return 'Only ${liftdata.length} lifts are present';
  }
  // return null if the text is valid
  return null;
}

void _submit() {
  
  
  if (_errorText == null) {
    // notify the parent widget via the onSubmit callback
    String content=searchController.value.text;
    searchController.clear();
    var lift=liftdata.firstWhere((element) => element['DeviceID']==int.parse(content));
    
    Navigator.pop(ctx);
    Navigator.push(
          ctx,
          MaterialPageRoute(builder: (context) => DetailsPage(lift['Key'])),
    );
  }
  
  
}

modalButtomSheet(BuildContext context){

  showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              elevation: 3,
              builder: (context) {
                return  Container(
                  
                  padding:  EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Row(
                      
                      children: [
                        Container(
                          width: screenWidth*0.85,
                          child: TextField(
                            controller: searchController,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(hintText: 'Enter Lift Number',errorText: _errorText),
                            autofocus: true,
                          ),
                        ),
                        IconButton(onPressed: (){
                          searchController.value.text.isNotEmpty?_submit():null;
                        } ,icon:Icon(Icons.search))
                      ],
                    
                  ),
                );
              }); 

}

