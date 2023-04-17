// import 'package:firebase_database/firebase_database.dart';

import 'package:url_launcher/url_launcher.dart';

DateTime formateDateTime(String date,String time){

                var mydate=date.split("-");
                var mytime=time.split(":");
                
                String yyyy=mydate[0].padLeft(4,"0");
                String Mm=mydate[1].padLeft(2,"0");
                String dd=mydate[2].padLeft(2,"0");

                
                String hr=mytime[0].padLeft(2,"0");
                String mm=mytime[1].padLeft(2,"0");
                String ss=mytime[2].padLeft(2,"0");

                String datetime= "$yyyy-$Mm-$dd $hr:$mm:$ss";
                return DateTime.parse(datetime);

}

  launchEmail(String email) async {
    // ignore: deprecated_member_use
    launch(
        "mailto:$email");
  }

  launchURL(String url) async {
    
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

// _saveOptions() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   await prefs.setBool('option', true);
// }


// var mykey="";
// bool statusState=false;

/* 
sendData() async{
      

    for(int i=2;i<=100;i++){

        // mykey= "L${i.toString().padLeft(3,"0")}";
        // print("$mykey\n");

        FirebaseDatabase.instance.ref("NPA0059/$mykey").set(
           {
          'DeviceID': i,
          'Date': "2022-5-26",
          'Time': "16:21:52",
          'DoorSafety':true,
          'EmergencyStop':true,
          'FloorZone':true,
          'Limit1':true,
          'Notification':false,
          'Running':true,
          'Status':statusState

        }
        );
        statusState=!statusState;
    }
    
  }
  */



/*  getToken() async {
    token = (await FirebaseMessaging.instance.getToken())!;
    setState(() {
      token = token;
    });
    final DatabaseReference _database = FirebaseDatabase.instance.ref();
    _database.child('fcm-token/${token}').set({"token": token});
  }
*/