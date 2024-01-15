
import 'package:attendance/Api_Provider.dart/Api_Provider.dart';
import 'package:attendance/EmployeeLogin.dart';
import 'package:attendance/HomeScreen.dart';
import 'package:attendance/Model/Login_Model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:attendance/compnayLogin.dart';

class Login_Controller extends GetxController{
  final logindata=LoginModle().obs;
    var isLoading =false.obs;
    var ispassword =true.obs;
     
    
        

    @override
    void onInit(){
      super.onInit();  
      
    

    }
      
      Login(String userEmail, String UserPassword)async{
        var result = await ApiProvider().Login(userEmail, UserPassword);
        if (result.responseData == 200) {
          Get.to(EmployeeLogin());

          logindata.value = result;
          isLoading(true);
        } else {
          isLoading(false);
        }

      }

    }

 
  
