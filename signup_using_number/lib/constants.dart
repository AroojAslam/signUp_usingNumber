
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';



Widget MyButton({
  required String title,
  required VoidCallback ontap,
  bool loading= false,
}){
  return  GestureDetector(
  onTap: ontap,
    child: Container(
      height: 40,
      width: 300,
      decoration: BoxDecoration(
        color: Colors.deepPurple.shade700,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child:loading ? CircularProgressIndicator(color: Colors.white,):
        Text(title,style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
      ),
    ),
  );
}



Widget backGround({
  required Widget widget,

}){
  return Stack(
    children: [
      Positioned(
          right: -250,top: -110,
          child: Container(
            width:560,
            height: 230,
            transform: Matrix4.rotationZ(0.6),
            decoration: BoxDecoration(
              color: Colors.purple.shade900.withOpacity(0.16),
              shape: BoxShape.rectangle,

            ),
          )),
      Positioned(
          bottom: -100, left: -100,
          width:300,
          height: 300,
          child: Center(
            child: Container(

              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.purple.shade900.withOpacity(0.16),
              ),
            ),
          )),

      Positioned(
          child: widget,
      ),
    ],
  );
}



Future<bool?> toastmessage({
  required String  error,
}){
  return Fluttertoast.showToast(
      msg: error,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0
  );
}