import 'package:bloodbank/screens/home_screen.dart';
import 'package:bloodbank/screens/signin.dart';
import 'package:bloodbank/screens/signup.dart';
import 'package:flutter/material.dart';

class Welcome_screen extends StatelessWidget{
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Blood Donation',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.red),),
          SizedBox(
            height: 40,
          ),
          Text("Be the reasons for someone's heart beat",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),
          SizedBox(
            height: 40,
          ),
          Center(
          child: ClipOval(
            child: Image.asset('assets/images/welcome.jpg',
              width: 250,
              height: 250,
              fit: BoxFit.cover,
          ),
          )
          ),
          SizedBox(
            height: 40,
          ),
          Center(
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) =>Signup()));
              },
              child:Container(
              width: 180,
              height: 40,
              child: Center(child: Text("Don't have an account ?",style: TextStyle(color: Colors.blue),)),
              decoration: BoxDecoration(
                  color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.blue,spreadRadius: 0.5)
                ]
              ),
            ),
            )
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child:GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Signin()));
              },
            child: Container(
              width: 180,
              height: 40,
              child: Center(child: Text("Log in",style: TextStyle(color: Colors.blue),)),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: Colors.blue,spreadRadius: 0.5)
                  ]
              ),
            ),
          )
          )
        ],
      ),
    );
  }
}