
// import 'package:attendance/Controller/Login_Controller.dart';
// import 'package:attendance/Employeelogin.dart';
// import 'package:attendance/HomeScreen.dart';
// import 'package:attendance/Model/Login_Model.dart';
// import 'package:attendance/view/secondScreen.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:attendance/Controller/Login_Controller.dart';
import 'package:attendance/Employeelogin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:attendance/compnayLogin.dart';
import 'Api_Provider.dart/Api_Provider.dart';
import 'Controller/Login_Controller.dart';
import 'package:get/get.dart';





class compnayLogin extends StatefulWidget {

  
  const compnayLogin({super.key});

  @override
  State<compnayLogin> createState() => _compnayLoginState();

  
}


class _compnayLoginState extends State<compnayLogin> {

    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    bool _validate=false;

// void login(String userEmail, userPassword) async {


//   try{

//     Response response = await post(
//       Uri.parse('http://alapi.smallindia.net/v/index.php'),
//       body: {
//         'userEmail':'er.sachingaun@gmail.com',
//        'userPassword':11111,
//       }
//       );

//       if(response.statusCode == 200){
        
//        // var data = jsonDecode(response.body.toString());
//       //  print(data['token']);
//         print('Login successfully');
//         Navigator.push(context, MaterialPageRoute(builder: (context)=>secondScreen()));

//        // print('login successfully');5

//       }else{
//         print('faild out');
//       }

//   }catch(e){
//     print(e.toString());

//   }

// }



  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
      body: SafeArea(child: ListView(

        padding: EdgeInsets.only(left: 20,right: 20),

        children: [
          SizedBox(height: 20,),
          Column(
            
            children: [
              Image.asset('assest/splace.png',height: 150,width: 150,),
            ],
            
          ),
          SizedBox(height: 30,),
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              hintText: 'Company Id',
              errorText: _validate ? 'Please Enter Company Id' :null,
              prefixIcon: Icon(Icons.email,color: Colors.lightBlue,),
            ),
            
          ),
           SizedBox(height: 30,),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              hintText: 'Password',

              errorText: _validate? 'Please Enter Password ':null,

              prefixIcon: Icon(Icons.key,color: Colors.lightBlue,),
            ),
            obscureText: true,
            
          ),
          SizedBox(height: 30,),

          Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ElevatedButton(onPressed: (){

                //Login_Controller().Login(emailController.text,passwordController.text);
                ApiProvider().Login(emailController.text,passwordController.text);

                // if(emailController.text==Email && passwordController.text==Password){
                //   print('yes');
                //  ApiProvider().Login(emailController.text,passwordController.text);
                // }else{
                //
                //   showDialog(context: context,barrierDismissible: false, builder: (context)=>AlertDialog(
                //     title: Center(child: Text('Invalid Company Id & Password')),
                //     actions: [
                //       ElevatedButton(onPressed: (){
                //         Navigator.pop(context);
                //       }, child: Center(child: Text('Cancel'))),
                //     ],
                //   )
                //   );
                //   print('faild mm');
                // }

                //Navigator.push(context, MaterialPageRoute(builder: (context) => EmployeeLogin()));

                Future.delayed(Duration(seconds: 1));

                //validation

                setState(() {
                  emailController.text.isEmpty ?  _validate = true : _validate=false;
                  passwordController.text.isEmpty ? _validate = true : _validate=false;
                });
                //

              },child: Text('Submit',style: TextStyle(
                fontSize: 20,

              ),
              )
              )
          
            
            ),
          )


        ],
        
        

      )
      ),
    );

    
  }

  
}



