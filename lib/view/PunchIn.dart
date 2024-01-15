import 'package:attendance/Api_Provider.dart/Api_Provider.dart';
import 'package:attendance/Model/EmployeeFetchModle.dart';
import 'package:attendance/view/Dasboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class PunchIn extends StatefulWidget {
  const PunchIn({Key? key}) : super(key: key);

  @override
  State<PunchIn> createState() => _PunchInState();
}

class _PunchInState extends State<PunchIn> {


TextEditingController remarkController= TextEditingController();

  late Future<EmployeeFetchModle> _ng;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _ng = ApiProvider().PunchIn();


  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text(type),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: (){
            Get.to(Dasboard());
          },
        ),
      ),
      body: FutureBuilder<EmployeeFetchModle>(
        future: _ng,
        builder: ((context, snapshot) {

          if(snapshot.hasData){
            return ListView.builder(
              itemCount: 1,
                itemBuilder: (context, index) => Container(
                  padding: EdgeInsets.only(left: 10,right: 10),
                  child: Column(

                    children: [
                      SizedBox(height: 20,),
                      Column(
                        children: [
                         // Center(child: CircularProgressIndicator()),
                          CircleAvatar(
                            backgroundImage: NetworkImage('${snapshot.data!.empImage}'

                            ),
                            radius: 70,
                          ),
                          SizedBox(height: 20,),
                          Container(
                            height: 20,
                            color: Colors.black12,
                            padding: EdgeInsets.only(left: 50),
                            child:Row(
                              children: [
                                 Center(
                                   child: Text('Attendance Date : ''${snapshot.data!.currentDate}',style:
                                     TextStyle(
                                       fontWeight: FontWeight.bold,
                                     ),),
                                 )

                              ],
                            ) ,
                          ),
                          SizedBox(height: 30,),
                          Row(
                            children: [
                              Padding(padding: EdgeInsets.only(left: 15)),
                              Text('Remark (Optional)',style: TextStyle(
                                fontSize: 20.0
                              ),),
                            ],
                          ),
                          Container(
                              margin: EdgeInsets.all(12),
                            child: TextField(
                              controller: remarkController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                hintText: 'Message',
                              ),
                              maxLines: 5,

                            ),
                          ),
                          SizedBox(height: 50,),
                          Container(
                            height: 40,

                            child: ElevatedButton(onPressed: (){
                              showDialog(context: context, barrierDismissible: false, builder: (BuildContext Context)=>AlertDialog(
                                title: Center(child: Text('$type')),
                                contentPadding: EdgeInsets.only(left: 50),
                                content: Text('Are you sure to proceed?\n'),
                                actionsPadding: EdgeInsets.only(right: 70),

                                actions: [
                                  ElevatedButton(onPressed: (){

                                    //ok button on click

                                    if(PunchType=="0"){
                                      Future.delayed(Duration(seconds: 1));
                                      ApiProvider().PunchInList('remark');

                                    }else{

                                      Future.delayed(Duration(seconds: 1));
                                      ApiProvider().PunchOutData();

                                    }

                                  }, child:Text('Yes')),


                                  ElevatedButton(onPressed: (){

                                    Navigator.pop(context);

                                  }, child: Text('No') ),
                                ],
                              )
                              );

                            },

                              style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
                            ),
                              //// change button  punch in punch out value
                                child : Text(type,style: TextStyle(fontSize: 20.0),),

                              ),
                          ),

                        ],
                      )
                    ],
                  ),

                ),
            );


          }else{
            return Center(child: CircularProgressIndicator());
          }

        }
        ),
      ),
    )
    );
  }
}
