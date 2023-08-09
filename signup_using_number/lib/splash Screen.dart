import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:signup_using_number/HomePage.dart';
import 'package:signup_using_number/startPage.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  void islogin(){
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    if(user != null ){
      Timer(Duration(seconds: 5),() =>Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),)) ,);
    }else{
      Timer(Duration(seconds: 5),() =>Navigator.push(context, MaterialPageRoute(builder: (context) => StartPage(),)) ,);
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    islogin();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Image(image: AssetImage('assets/images/logo.png')),
              SizedBox(height: 30,),
              Text('WelCome',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),),
            ],
          ),
        ),
      ),
    );
  }
}
