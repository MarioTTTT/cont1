import 'package:flutter/material.dart';

import 'package:hello/colors/colors_theme.dart';
import 'package:hello/perfil.dart';

import 'package:hello/widgets/playlist.dart';


class MyNotifications extends StatefulWidget{
  const MyNotifications({super.key});


//função pra chamar o state inicial 
  @override
  State<MyNotifications> createState() => _MyNotificationsState();
}
class _MyNotificationsState extends State<MyNotifications>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

       backgroundColor:AppColors.primaryColor,
        
   body:SingleChildScrollView(
   
   scrollDirection: Axis.vertical,

    child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(25.0),
                      child: Text(
                                  
                                 'Notificações',
                                      style: TextStyle(
                                  fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                 ),
                                   
                               ),
                               
                    ),
                        
                                            IconButton(
                                                     icon: const Icon(
                                                     Icons.share_rounded,
                                                      size: 25,
                                                      color: Colors.white,
                                                                                       ), 
                                                      onPressed: () {  },
                                                   ),
                                                





                  ],
                ),
                  
       
              ],
              
            ),
  ),
   


    );
  }


  
}