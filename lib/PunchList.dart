import 'package:attendance/Api_Provider.dart/Api_Provider.dart';
import 'package:attendance/AttendanceLog.dart';
import 'package:attendance/EmployeeLogin.dart';
import 'package:attendance/Model/AttendanceLogModle.dart';
import 'package:attendance/Model/DateAttendaceLogList.dart';
import 'package:attendance/view/Dasboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';



// current date in app bar
String cdate = DateFormat("yyyy-MM-dd").format(DateTime.now());
var two='';

class PunchList extends StatefulWidget {


 // const PunchList({Key? key}) : super(key: key);
  
  // Attendace log data fetch
  String? DateA;
  String? two;
  PunchList({this.DateA,this.two});

  @override
  State<PunchList> createState() => _PunchListState();
}

class _PunchListState extends State<PunchList> {
  late Future<DateAttendanceLogList> _store;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _store = ApiProvider().DateAttendList(widget.DateA.toString());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(widget.DateA.toString()),
        //title: Text(cdate),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // if (PunchType == '1' ) {
            //   Get.to(Dasboard());
            // } else if (two==two) {
            //   Get.to(AttLog());
            //   //Get.to(Dasboard());
            //   //print('Punch two');
            //
            // } else {
            //
            //   print('Punch error');
            // }
            Get.to(Dasboard());
            Center(child: CircularProgressIndicator());
          },
        ),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) => Center(
                          child: AlertDialog(
                            title: Text('Are you sure you want to exit? '),
                            actionsAlignment: MainAxisAlignment.center,
                            actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    Get.to(EmployeeLogin());
                                  },
                                  child: Text('Yes')),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('No'))
                            ],
                          ),
                        ));
              },
              icon: Icon(Icons.home_filled))
        ],
      ),
      body: FutureBuilder<DateAttendanceLogList>(
        future: _store,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.employeeAttendanceList!.length,
              itemBuilder: (i, index) => Container(

                  //padding: EdgeInsets.only(top: 10),
                  child: Column(
                children: [
                  Container(
                    height: 80,
                    child: Card(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          CircleAvatar(
                            backgroundImage:
                                NetworkImage('${snapshot.data!.empImage}'),
                          ),
                          Padding(padding: EdgeInsets.only(top: 10, left: 20)),
                          Text(
                            '${snapshot.data!.employeeAttendanceList![index].attDatetime}',
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Text(
                            '${snapshot.data!.employeeAttendanceList![index].type}',
                            style: TextStyle(
                              fontSize: 10.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // SizedBox(height: 20,),
                  // Card(
                  //   child: Container(
                  //     height: 70,
                  //     child: Row(
                  //       children: [
                  //         CircleAvatar(
                  //           backgroundImage: NetworkImage('${snapshot.data!.employeeAttendanceList![index].imageURL}'),
                  //         ),
                  //         SizedBox(width: 20,),
                  //         Text('${snapshot.data!.employeeAttendanceList![index].attDatetime}',style: TextStyle(
                  //           fontSize: 15.0,
                  //         ),),
                  //
                  //         // Text('${widget.DateA.toString()}',style: TextStyle(
                  //         //   fontSize: 15.0,
                  //         // ),),
                  //         SizedBox(width: 80,),
                  //         Icon(Icons.arrow_circle_left,color: Colors.green,),
                  //       ],
                  //     ),
                  //   ),
                  // )
                ],
              )),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    ));
  }
}
