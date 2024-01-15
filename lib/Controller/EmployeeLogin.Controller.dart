import 'package:attendance/Api_Provider.dart/Api_Provider.dart';
import 'package:attendance/Model/EmployeeLoginModle.dart';
import 'package:attendance/view/Dasboard.dart';
import 'package:get/get.dart';

class Employee_Controller extends GetxController{
  final EmpLoginData = EmployeeLoginModle().obs;
  var isLoading = false.obs;
  var ispassword = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  EmpLogin(String employeeId) async {

    var resultr= await ApiProvider().EmpLogin(employeeId);
    // if(resultr.responseData==200){
    //   Get.to(Dasboard());
    //   EmpLoginData.value = resultr;
    //   isLoading(true);

    // }else{
    //   isLoading(false);
    // }
  }

}