

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:signup_using_number/HomePage.dart';

import 'constants.dart';

class VerifyCode extends StatefulWidget {
  final String verificationID;
   VerifyCode({super.key, required this.verificationID});
   final auth = FirebaseAuth.instance;

  @override
  State<VerifyCode> createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCode> {
  TextEditingController codeController= TextEditingController();
  GlobalKey<FormState> formKey =GlobalKey<FormState>();
  bool loading = false;
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.grey.shade50,
        body: SafeArea(
          child: backGround(widget: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              const  Image(
                      height: 250,
                      width: 250,
                      image: AssetImage('assets/images/verify.png')),
                const   SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    key: formKey,
                    child: TextFormField(
                      controller: codeController,
                      decoration:const  InputDecoration(border: UnderlineInputBorder(),
                        hintText: 'Enter Code',

                      ),
                      validator: (value) {
                        if(
                        value!.isEmpty){
                          return 'Enter Code';
                        }else{
                          return null;
                        }
                      },

                    ),

                  ),
                ),
                const  SizedBox(height: 30,),
                MyButton(title: 'Verify',ontap: () async {
               if(formKey.currentState!.validate()){
                 final crendital =PhoneAuthProvider.credential(
                     verificationId: widget.verificationID,
                     smsCode: codeController.text.toString());
                 try{
                   await auth.signInWithCredential(crendital);
                   Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
                 }catch(e){
                   toastmessage(error: e.toString());

                 }
               }

                })

              ],
            ),

          ),),
        )

    );
  }
}
