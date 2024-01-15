// ignore_for_file: unused_label

import 'package:attendance/Api_Provider.dart/Api_Provider.dart';
import 'package:attendance/EmployeeLogin.dart';
import 'package:attendance/Model/AttendanceLogModle.dart';
import 'package:attendance/PunchList.dart';
import 'package:attendance/view/PunchIn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../Model/EmployeeFetchModle.dart';
import 'package:attendance/AttendanceLog.dart';
import 'dart:io';
import 'Message.dart';

var PunchType = '';

//type varible store punch in punch out
var type = '';

class Dasboard extends StatefulWidget {
  const Dasboard({Key? key}) : super(key: key);

  @override
  State<Dasboard> createState() => _DasboardState();
}

class _DasboardState extends State<Dasboard> {
  late Future<EmployeeFetchModle> _inm;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _inm = ApiProvider().EmpFetch();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        //background color remove
        // backgroundColor: Colors.transparent,
        // elevation: 0,
        //
        //title: Text('Back'),
        leading: IconButton(
          padding: EdgeInsets.only(left: 20),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            showDialog(
                context: context,
                barrierDismissible: false,
                builder: ((context) => AlertDialog(
                      title:
                          Center(child: Text('Are you sure you want to exit?')),
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
                            child: Text('No')),
                      ],
                    )));
          },
        ),
      ),
      body: FutureBuilder<EmployeeFetchModle>(
        future: _inm,
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
////punch in punch out condication

            PunchType = ('${snapshot.data!.punchType}');
            print(PunchType);
            // punch=PunchType;
            // print('Punch type Value ''$punch');

            if (PunchType == "0") {
              type = 'Punch In';
            } else {
              type = 'Punch Out';
            }

////

            return ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) => Container(
                //height: 200,
                child: Column(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(left: 20, top: 150.0)),
                            CircleAvatar(
                              backgroundImage:
                                  NetworkImage('${snapshot.data!.empImage}'),
                              radius: 50,
                            ),
                            Padding(padding: EdgeInsets.only(left: 20)),
                            Align(
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  Text(
                                    'Name : '
                                    '${snapshot.data!.empName}\t\t\t\t\t\t\t\n',
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                  Text(
                                      'EmpId : '
                                      '${snapshot.data!.employeeId}\t\t\t\t\t\t\n',
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.justify),
                                  Text(' Date : ' '$cdate',
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.justify),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    //SizedBox(height: 20,),
                    Divider(
                      color: Colors.black,
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PunchIn()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //Padding(padding: EdgeInsets.only(left: 10)),
                          TextButton.icon(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PunchIn()));
                            }, //2. punch in punch out chnage
                            label: Text(
                              '$type\t\t\t\t' '$cdate',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            icon: Icon(Icons.list_alt),
                          ),
                          Icon(Icons.arrow_forward_ios,color: Colors.black12),
                        ],

                      ),
                    ),
                    Divider(),
                    InkWell(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AttLog()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              TextButton.icon(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AttLog()));
                                },
                                label: Text(
                                  'Attendance Log',
                                  style: TextStyle(color: Colors.black),
                                ),
                                icon: Icon(Icons.book),
                              ),
                            ],

                          ),
                          Icon(Icons.arrow_forward_ios,color: Colors.black12,),
                        ],
                      ),
                    ),
                    Divider(),
                    InkWell(
                      onTap: ()
                      {
                       // Get.to(Message());
                        },
                      child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton.icon(
                            onPressed: () {
                              Get.to(Message());
                            },

                            label: Text(
                              'Message ',
                              style: TextStyle(
                                color: Colors.black,

                              ),
                            ),
                            icon: Icon(Icons.message),
                          ),

                          Icon(Icons.arrow_forward_ios,color: Colors.black12),
                        ],
                      ),
                    ),
                    Divider(),

                    InkWell(
                      onTap: (){},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton.icon(
                            onPressed: () {},
                            label: Text(
                              'My Profile',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            icon: Icon(Icons.account_box),
                          ),
                          Icon(Icons.arrow_forward_ios,color: Colors.black12),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        }),
      ),
    ));
  }
}
