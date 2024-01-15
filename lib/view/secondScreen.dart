

import 'package:attendance/compnayLogin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class secondScreen extends StatefulWidget {
  const secondScreen({super.key});

  @override
  State<secondScreen> createState() => _secondScreenState();
}

class _secondScreenState extends State<secondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.only(left: 20,right: 20),

          children: [
            SizedBox(height: 20,),
            Column(
              
              children: [
                Image.asset('assest/splace.png',height: 150, width: 150,),
              ],
              
            ),
            SizedBox(height: 20,),
            Container(
              height: 50,
              
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                //color: Colors.brown[800],
              ),
              
              child: ElevatedButton(onPressed: (){},child: Text('Employee Login',style: TextStyle(
                fontSize: 20,
              ),),),

            ),

            SizedBox(height: 20,),
            Container(
              height: 50,
              
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                //color: Colors.brown[800],
              ),
              
              child: ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> compnayLogin()));
              },
              
              child: Text('Company Login',style: TextStyle(
                fontSize: 20,
              ),
              ),
              ),

            ),
            SizedBox(height: 20,),
            Center(
              
              child: Container(
                
                
                //padding: EdgeInsets.only(left: 60,right: 60),
               // padding: EdgeInsets.only(left: 60,right: 60),
                
                 decoration: BoxDecoration(
                  
                   color: Colors.blueAccent,
                   borderRadius: BorderRadius.circular(5),
                 ),
                
                child: TextButton(onPressed: (() {
            
                  
                  
                }
                ), child: Text('Register ',style: TextStyle(
                  fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white,decoration: TextDecoration.underline,
                  
              
                ),)
                ),
              ),
            )
          ],
          
          

        )
      
        
        ),
        


    );
  }
}