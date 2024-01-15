import 'package:attendance/Api_Provider.dart/Api_Provider.dart';
import 'package:attendance/PunchList.dart';
import 'package:attendance/view/Dasboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'Model/AttendanceLogModle.dart';


class AttLog extends StatefulWidget {
  //const AttLog({Key? key}) : super(key: key);


var two='';

  @override
  State<AttLog> createState() => _AttLogState();
}

class _AttLogState extends State<AttLog> {



  late Future<attendmodel> _dat;

  @override
  void initState() {
    // TODO: implement initState
    _dat =ApiProvider().Log();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text('Attendance Log'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios), onPressed: () {
            Get.to(Dasboard());
        },
        ),
      ),

      body:Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 20,left: 20,right: 20),
            color: Colors.blue[200],
            height: 50,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Date',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                    Text('Working hour',style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),)
                  ],
                )
              ],
            )
          ),
          Expanded(
            child:  FutureBuilder<attendmodel>(
            future: _dat,
            builder: (context, snapshot) {
              if(snapshot.hasData){

                return ListView.builder(
                  // itemCount: 1,
                  itemCount: snapshot.data!.attendanceLog!.length,
                  itemBuilder: (i, index) => Container(
                    //height: 80,
                    padding: EdgeInsets.only(top: 20,left: 10,right: 10),
                    child: InkWell(
                      onTap: (){Get.to(PunchList(DateA: '${snapshot.data!.attendanceLog![index].attendanceDate}'),arguments: two);},
                      child: GestureDetector(onTap: ()
                      {


                        Get.to(PunchList(DateA: '${snapshot.data!.attendanceLog![index].attendanceDate}'));
                      },
                        child: Column(
                          children: [
                            Padding(padding: EdgeInsets.only(left: 20)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('${snapshot.data!.attendanceLog![index].attendanceDate}',style: TextStyle(
                                    fontSize: 15.0,fontWeight: FontWeight.w500
                                ),),

                                Text('${snapshot.data!.attendanceLog![index].workHour}\t\t\t\t\t',style: TextStyle(
                                  fontSize: 15.0,fontWeight: FontWeight.w500,
                                ),),
                              ],
                            ),
                             SizedBox(height: 25,),
                             Divider(),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
          )
        ],
      )
    ),
    );
  }
}
