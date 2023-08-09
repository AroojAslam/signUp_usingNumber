


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:signup_using_number/constants.dart';

import 'enterNumber.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(onPressed: (){
            auth.signOut().then((value) => Navigator.push(context,
                MaterialPageRoute(builder: (context) => EnterNumber(),)));
          }, icon: Icon(Icons.logout))
        ],
      ),
      backgroundColor: Colors.grey.shade50,
      body: SafeArea(

        child: Center(
          child: backGround(widget: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('HEY',style:  TextStyle(fontWeight:  FontWeight.bold,fontSize: 35), )
              ],
            ),
          )),
        ),
      ),
    );
  }
}
