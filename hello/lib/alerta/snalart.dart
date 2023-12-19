import "package:flutter/material.dart";

showAlertBar({required BuildContext context, required String texto, bool isError = true}){
  SnackBar showalert = SnackBar( 
    content: Text(texto),
   backgroundColor: (isError)? Colors.red:Colors.green,
   shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top:Radius.circular(10))),
 duration: const Duration(seconds: 3),
 action: SnackBarAction(label: "OK",
 
 textColor: Colors.white,
 onPressed: (){
   ScaffoldMessenger.of(context).hideCurrentSnackBar();
 },
 
 
 ),
  );
  ScaffoldMessenger.of(context).showSnackBar(showalert);
}