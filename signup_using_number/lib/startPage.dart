import 'package:flutter/material.dart';
import 'package:signup_using_number/constants.dart';

import 'enterNumber.dart';




class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SafeArea(
        child: backGround(widget: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                    height: 350,
                    width: 330,
                    image: AssetImage('assets/images/logo.png')),
             const SizedBox(height: 20,),
            const  Text('Let\'s Get Started',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700),),
            const  Text('Click on start button to start the App',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w200),),
             const SizedBox(height: 20,),
              MyButton(title: 'Start', ontap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const EnterNumber(),));
              })
            ],
          ),

        ),),
      )

    );
  }
}
