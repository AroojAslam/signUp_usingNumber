


import 'package:flutter/material.dart';
import 'package:signup_using_number/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SafeArea(

        child: Center(
          child: backGround(widget: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('HEY BROO',style:  TextStyle(fontWeight:  FontWeight.bold,fontSize: 35), )
              ],
            ),
          )),
        ),
      ),
    );
  }
}
