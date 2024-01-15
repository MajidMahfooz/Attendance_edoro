
import 'package:attendance/Model/AttendanceLogModle.dart';
import 'package:attendance/Model/DateAttendaceLogList.dart';
import 'package:attendance/Model/EmployeeLoginModle.dart';
import 'package:attendance/Model/Login_Model.dart';
import 'package:attendance/Model/PunchInModle.dart';
import 'package:attendance/Model/PunchOutModle.dart';
import 'package:attendance/PunchList.dart';
import 'package:attendance/compnayLogin.dart';
import 'package:attendance/view/Dasboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import '../EmployeeLogin.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:attendance/Api_Provider.dart/my-globals.dart' as globals;

import '../Model/EmployeeFetchModle.dart';
import '../Model/Loginmodel.dart';





// punch list current date

var empIdp='';
var User='';

var Email =" ";
var Password=" ";

var company=" ";

var employee=" ";
var empId='';
var location='';

var locationtwo='';

var text='';


//DateTime dateToday = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);




class ApiProvider {


  ///Login Api
Future<LoginModle> Login(userEmail, String userPassword) async{
      Map body = {
                           "clientKey": "clientKey",
                            "accessToken": "accessTokenValue",
                            "action": "login",
                            "requestData": {
                                "userEmail": userEmail,
                                "userPassword": userPassword
                            }

      };

     //print(userEmail.toString() +userPassword.toString());

      var data = json.encode(body);
      print(data);

    var response = await http.post(Uri.parse('http://alapi.smallindia.net/v/index.php'),
      headers: {"Content-Type": "application/json"},
      body: data,
    );

    //dynamic Email Id And Password store in a varible get fetch next api
     Email=userEmail;
    print(Email);
    Password = userPassword;
    //

    if (response.statusCode == 200)

    {
      // If the server did return a 200 OK response, then parse the JSON.
      print("Server Response from here");
      print(response.body);
      Fluttertoast.showToast(msg: "successfully",);
      Get.to(new EmployeeLogin());

     return LoginModle.fromJson(json.decode(response.body));


    } else {
      // If the server did not return a 200 OK response, then throw an exception.
      print('faild ');
      Fluttertoast.showToast(msg: "Wrong Email password",);

      throw Exception('User or Password was incorrect.');
    }

}

/// Data show form Login Api

  Future<Modellogin> packed() async {

    Modellogin ing = Modellogin();

    String query = "http://alapi.smallindia.net/v/index.php";

    Map<String, dynamic> head = {

      "Content-Type": "application/json",
    };

    Map data = {
      "clientKey": "clientKey",
      "accessToken": "accessTokenValue",
      "action": "login",
      "requestData": {
        "userEmail": Email,
        "userPassword": Password,
        //"11111"
        // "er.sachingaun@gmail.com",
      }
    };

    try {
      var response = await Dio().post(
        query,
        data: data,
        options: Options(
          headers: head,
        ),
      );
      var respCode = response.data; // response message
      print(respCode);

      var fetch = respCode['responseData'];  // responseData size 6 store in hhh
      // print(fetch);

// covert dynamic compnay id


      var companyDetails = fetch['companyDetails'];

     var compdetails = companyDetails[0];

      var companyId = compdetails['companyId'];

      companyId = companyId.toString();

      print(companyId);

      company=companyId;
//

      if (fetch!=200) {
        ing = Modellogin.fromJson(fetch);


      } else {
        Fluttertoast.showToast(msg: 'Faild');
      }
    } catch (e) {
      print(e);
    }

    return ing;
  }


  // Employee Login

Future<EmployeeFetchModle> EmpLogin(String employeeId,) async{

  EmployeeFetchModle img =EmployeeFetchModle();

  Map<String, dynamic> head = {
    "Content-Type": "application/json",
  };
  Map data ={
    "clientKey": "clientKey",
    "accessToken": "accessTokenValue",
    "action": "verifyEmployee",
    "requestData": {
      "employeeId":employeeId ,
      "companyId": company,
    }

  };

  try{

    var response = await Dio().post('http://alapi.smallindia.net/v/index.php', data: data);

    var respCode= response.data;
    print(respCode);

    var fetch = respCode['responseData'];
    //print(fetch);

    // cover comployeeId covert Dynamic Api
    employee =employeeId;
    print(employee);
    //

    var empidp =fetch['empId'];
    print(empidp);
    empIdp=empidp;


    if(fetch!=null){
      img = EmployeeFetchModle.fromJson(fetch);
      Fluttertoast.showToast(msg: 'login ');
      Get.to(Dasboard());

    }else{
      Fluttertoast.showToast(msg: 'data not loading');

    }

  }catch(e){
    print(e);
    Fluttertoast.showToast(msg: 'wrong Entry');
  }
  return img;

}

//data show for Employee Login

Future<EmployeeFetchModle> EmpFetch() async {

  EmployeeFetchModle img =EmployeeFetchModle();

  Map<String, dynamic> head = {
    "Content-Type": "application/json",
  };

  Map data ={
      "clientKey": "clientKey",
      "accessToken": "accessTokenValue",
      "action": "verifyEmployee",
      "requestData": {
        "employeeId":employee ,
        "companyId": company,
      }

  };

  try{

    var response = await Dio().post('http://alapi.smallindia.net/v/index.php', data: data);

    var respCode= response.data;
    print(respCode);

    var fetch = respCode['responseData'];
    //empid dynamic
    var empid =fetch['empId'];
    print(empid);
    empId=empid;
    //print(fetch);

    if(fetch!=200){
      img = EmployeeFetchModle.fromJson(fetch);

    }else{
      Fluttertoast.showToast(msg: 'data not loading');

    }


  }catch(e){
    print(e);
  }
  return img;


}

//punch In api

  // successfully run api

Future<EmployeeFetchModle> PunchIn() async{

  EmployeeFetchModle amg=EmployeeFetchModle();


  Map data ={

  "clientKey": "clientKey",
  "accessToken": "accessTokenValue",
  "action": "verifyEmployee",
  "requestData": {
  "employeeId": employee,
  "companyId": company,
  }
  };

  try{
    var response = await Dio().post('http://alapi.smallindia.net/v/index.php',data: data);

    var respCode=response.data;
    //print(respCode);
    var fetch=respCode['responseData'];
    //print(fetch);

    //empId data pass dynamic

    var empid =fetch['empId'];
    print(empid);
    empId=empid;
    //

    if(fetch!=200){
      amg=EmployeeFetchModle.fromJson(fetch);
    }else{
      print('data not loading');
    }

  }catch(e){
    print(e);
    print('wromng data');
  }
return amg;

}

//Punch in List APi
//
Future<PunchInModle> PunchInList(remark) async{

  PunchInModle share = PunchInModle();

  DateTime now = DateTime.now();
  var CurrentDate=DateTime.now().toString();

  Map data={

      "clientKey":"clientKey",
      "accessToken":"accessTokenValue",
      "action":"punchIn",
      "requestData":{
        "empId": empId,
        "punchInImage":"/9j/4SN2RXhpZgAATU0AKgAAAAgAFQEAAAMAAAABAZAAAAEBAAMAAAABAZAAAAECAAMAAAADAAABCgEGAAMAAAABAAIAAAEPAAIAAAAgAAABEAEQAAIAAAAgAAABMAESAAMAAAABAAEAAAEVAAMAAAABAAMAAAEaAAUAAAABAAABUAEbAAUAAAABAAABWAEoAAMAAAABAAIAAAExAAIAAAAeAAABYAEyAAIAAAAUAAABfgITAAMAAAABAAIAAAIgAAQAAAABAAAAAAIhAAQAAAABAAAAAAIiAAQAAAABAAAAAAIjAAQAAAABAAAAAAIkAAQAAAABAAAAAAIlAAIAAA",
        "punchInLatitude":location,
        "punchInLongitude":locationtwo,
        "punchInDate": CurrentDate,
        "remark":text

    }


  };
  print(empId.toString());

  try{
    var response = await Dio().post('http://alapi.smallindia.net/v/index.php',
        data: data);

    var respCode=response.data;
    //print(respCode);
    var fetchData =respCode['responseData'];
    print(fetchData);


    var punch = fetchData['punchInLatitude'];
    location = punch;
    var punchlong =fetchData['punchInLongitude'];
    //print(punchlong);
    locationtwo=punchlong;

   // print(punchInlatitude);

    var remk=remark;
    text=remk;

  //

    if(fetchData!=null){
      share = PunchInModle.fromJson(fetchData);
      Fluttertoast.showToast(msg: 'succesfully ');
      Get.to(PunchList(DateA:cdate));

    }else{
      Fluttertoast.showToast(msg: 'data not showing');
    }

  }catch(e){
    Fluttertoast.showToast(msg: 'not loading data');
  }
  return share;


}

//// punch out api

Future<PunchOutModle> PunchOutData() async {

  PunchOutModle ft = PunchOutModle();
  // not remove current time because punch in punch data time not current time time show
  DateTime now = DateTime.now();
  var Curr=DateTime.now().toString();

  Map data ={

      "clientKey":"clientKey",
      "accessToken":"accessTokenValue",
      "action":"punchOut",
      "requestData":{
        "empId": empId,//209
        "attendanceDate": Curr,
        "punchOutImage":" http://alapi.smallindia.net/uploads/1662500691.jpeg",
        "punchOutLatitude":"5464564665",
        "punchOutLongitude":"565989878",
        "punchOutDate":Curr,
      }


  };

  try{

    var response = await Dio().post('http://alapi.smallindia.net/v/index.php',
        data: data);

    var respCode=response.data;
    print(respCode);

    var fetch = respCode['responseData'];

    if(fetch!=null){
      ft = PunchOutModle.fromJson(fetch);
     // Fluttertoast.showToast(msg: ' punch out  data ');
      //Get.to(PunchList(ValueOne: "2",));
      Get.to(PunchList(DateA:cdate));

    }else{
      print('wrong data');
    }

  }catch(e){
    print('data not fetch');
  }
  return ft;

}

//Attendance Log list

Future<attendmodel> Log() async{

  attendmodel share = attendmodel();

  // DateTime now = DateTime.now();
  // var currentDate=DateTime.now().toString();


  Map data={

      "clientKey": "clientKey",
      "accessToken": "accessTokenValue",
      "action": "attendanceLog",
      "requestData": {
        "empId": empIdp,
        "companyId": company,
        "startDate": "2022-09-01",
        "endDate":cdate
      }




  };
 print(empId.toString()+company.toString());
  try{

    var response = await Dio().post('http://alapi.smallindia.net/v/index.php', data: data);

    var resCode = response.data;
    print(resCode);
    var fetch=resCode['responseData'];
    print(fetch);



//     var com=fetch[empId];
// //    print(com);
//     Comment=com;

    if(fetch!=200){

      share=attendmodel.fromJson(fetch);

      Fluttertoast.showToast(msg: 'Attendance Log');
    //  Get.to(AttendanceLog());



    }else{
      Fluttertoast.showToast(msg: 'data not fetch');

    }

  }catch(e){
    print('wrong');

  }

  return share;
}

// dateWiseAttendaceList

Future<DateAttendanceLogList> DateAttendList(String newcdate) async{

  DateAttendanceLogList sha = DateAttendanceLogList();


  Map data=   {
    "clientKey": "clientKey",
    "accessToken": "accessTokenValue",
    "action": "datewiseAttendanceLog",
    "requestData": {
      "empId": empId,
      "companyId": company,
      "attendanceDate":newcdate
    }
  };

  try{

    var response = await Dio().post('http://alapi.smallindia.net/v/index.php',
        data: data);

    var resCode = response.data;
    print(resCode);
    //print(response.data);
    var fetch=resCode['responseData'];
    print(fetch);


    if(fetch!=200){

      sha=DateAttendanceLogList.fromJson(fetch);
      Fluttertoast.showToast(msg: 'Successfully data');
      Get.to(PunchList());

    }else{
      Fluttertoast.showToast(msg: 'data not fetch');

    }

  }catch(e){
    print(e);

  }

  return sha;
}

}





