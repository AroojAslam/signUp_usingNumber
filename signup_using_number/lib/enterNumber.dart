import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:signup_using_number/verifyCode.dart';

import 'constants.dart';

class EnterNumber extends StatefulWidget {
  const EnterNumber({super.key});

  @override
  State<EnterNumber> createState() => _EnterNumberState();
}

class _EnterNumberState extends State<EnterNumber> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController numberController= TextEditingController();
  bool loading = false;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:backGround(widget:  SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             const Image(
                  height: 250,
                  width: 250,
                  image: AssetImage('assets/images/number.png')),
            const  SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child:Form(
                  key: formKey,
                  child: TextFormField(
                      controller: numberController,
                      decoration:const InputDecoration(border: UnderlineInputBorder(),
                      hintText: 'Enter Number',
                        helperText: '+92 *** *******'

                      ),
                      validator: (value) {
                        if(
                        value!.isEmpty){
                          return 'Enter Number';
                        }else{
                          return null;
                        }
                      },

                    ),
                ),
              ),
            const  SizedBox(height: 30,),
              MyButton(title: 'Next',ontap: (){
                if(formKey.currentState!.validate())
               {setState(() {
                 loading =true;
               });
                 auth.verifyPhoneNumber(
                     phoneNumber: numberController.text,
                     verificationCompleted: (_){},
                     verificationFailed: (e){
                       toastmessage(error: e.toString());
                       loading =false;
                     },
                     codeSent: (String verificationID, int? token){
                       Navigator.push(context, MaterialPageRoute(builder: (context) =>
                           VerifyCode(verificationID:verificationID ),));
                       loading =false;
                     },
                     codeAutoRetrievalTimeout: (e){
                       toastmessage(error: e.toString());
                       loading =false;
                     });
               }


              })

            ],
          ),
        ),),
      ),
    );
  }
}
