import 'package:attendance/Api_Provider.dart/Api_Provider.dart';
import 'package:attendance/view/Dasboard.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'Model/Loginmodel.dart';

final _formKey = GlobalKey<FormState>();




class EmployeeLogin extends StatefulWidget {
  const EmployeeLogin({Key? key}) : super(key: key);

  @override
  State<EmployeeLogin> createState() => _EmployeeLoginState();
}

class _EmployeeLoginState extends State<EmployeeLogin> {

  TextEditingController EmployeeController= TextEditingController();
  TextEditingController compnayIdController = TextEditingController();
  bool _validate = false;

  late Future<Modellogin> _inq;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _inq = ApiProvider().packed();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(

            body: FutureBuilder<Modellogin>(
              future:_inq,
              builder: ((context, snapshot) {
                if(snapshot.hasData){


                return ListView.builder(
                //itemCount: 1,
                itemCount: snapshot.data!.companyDetails!.length,
                itemBuilder: (context, index) => Container(
                //child: Text('${snapshot.data!.companyDetails![0].companyName}'),
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(left: 30,right: 30),
                  child: Column(
                      children: [
                        SizedBox(height: 30.0,),
                      CircleAvatar(
                        backgroundImage: NetworkImage('${snapshot.data!.companyDetails![0].companyImage}'),
                        radius: 80,
                      ),
                        SizedBox(height: 30,),
                        Text('${snapshot.data!.companyDetails![0].companyName}',style: TextStyle(
                          fontSize: 20,fontWeight: FontWeight.bold
                        ),
                        ),
                        SizedBox(height: 50,),
                        TextField(
                          // key: _formKey,
                          // validator: (value) {
                          //   if (value == null || value.isEmpty) {
                          //     return 'Please enter some text';
                          //   }
                          //   return null;
                          // },



                          controller: EmployeeController,
                          decoration: InputDecoration(
                            hintText: 'Employee Login',
                              //validation
                              errorText: _validate ? 'Employee Id can\'t be empty' : null,
                            //
                            prefixIcon: Align(
                              widthFactor: 0,
                              heightFactor: 0,

                              child: Icon(
                                Icons.email,
                                color: Colors.blue,
                              ),

                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                            )

                          ),


                        ),

                        SizedBox(height: 50,),
                        Center(
                          child: Container(
                            height: 50,

                            child: ElevatedButton(onPressed: (){

                              Future.delayed(Duration(seconds: 2));

                              ApiProvider().EmpLogin(EmployeeController.text);

                              // if(EmployeeController.text==employee){
                              //   print('yes');
                              //   ApiProvider().EmpLogin(EmployeeController.text);
                              //
                              // }else{
                              //   //print('faildM');
                              //   showDialog(context: context, barrierDismissible: false, builder: (context)=>AlertDialog(
                              //   title: Center(child: Text('Invalid Employee Id !')),
                              //   actions: [
                              //     Center(child: ElevatedButton(onPressed: (){
                              //       Navigator.pop(context);
                              //     }, child: Text('Cancel')))
                              //   ],
                              //   )
                              //   );
                              // }

                              //validation

                              setState(() {
                                EmployeeController.text.isEmpty ? _validate = true : _validate = false;
                              });
                              //



                            },
                              child: Text('Employee Login',style: TextStyle(
                                fontSize: 20
                              ),
                              ),

                            ),

                          ),
                        ),
                        SizedBox(height: 100,)

                      ],

                    
                    
                  ),
                  
                ),

              ),


          );

        }
        else {
          return Center(child: CircularProgressIndicator());
        }
      }
      ),
    ),
    )
    );
  }




  }
  

